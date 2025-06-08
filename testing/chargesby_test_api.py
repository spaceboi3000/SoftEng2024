import csv
import json
import requests
from datetime import datetime
from collections import defaultdict
from copy import deepcopy

# API base URL
BASE_URL = "http://127.0.0.1:9115/api"

# Define valid operators
operators = ["AM", "EG", "GE", "KO", "MO", "NAO", "NO", "OO"]

# CSV File containing passes
PASSES_FILE = "passes07.csv"
RESULTS_FILE = "chargesby_test_results.txt"

# List of API calls to test
api_calls = [
    f"{BASE_URL}/chargesBy/NAO/20220210/20220224",
    f"{BASE_URL}/chargesBy/GE/20220210/20220224",
    f"{BASE_URL}/chargesBy/OO/20220210/20220224",
    f"{BASE_URL}/chargesBy/KO/20220210/20220224",
    f"{BASE_URL}/chargesBy/NO/20220210/20220224",
    f"{BASE_URL}/chargesBy/NAO/20220211/20220222",
    f"{BASE_URL}/chargesBy/GE/20220211/20220222",
    f"{BASE_URL}/chargesBy/OO/20220211/20220222",
    f"{BASE_URL}/chargesBy/KO/20220211/20220222",
    f"{BASE_URL}/chargesBy/NO/20220211/20220222"
]

def normalize_response(response):
    """Normalize a response dictionary to make it comparable"""
    response = deepcopy(response)
    
    # Remove status field if it exists
    response.pop('status', None)
    
    # Create a dictionary of visiting operators for easy comparison
    vop_dict = {op['visitingOpID']: op for op in response['vOpList']}
    
    # Create a new normalized vOpList
    normalized_list = []
    toll_op = response['tollOpID']
    
    # Include all operators except the toll operator itself
    for op in operators:
        if op != toll_op:
            if op in vop_dict:
                normalized_list.append(vop_dict[op])
            else:
                # Include operator with zero passes if not present
                normalized_list.append({
                    "visitingOpID": op,
                    "nPasses": 0,
                    "passesCost": 0.0
                })
    
    # Sort by visitingOpID for consistent ordering
    normalized_list.sort(key=lambda x: x['visitingOpID'])
    response['vOpList'] = normalized_list
    
    return response

def responses_are_equivalent(expected, actual):
    """Compare two responses while ignoring format differences"""
    # Normalize both responses
    norm_expected = normalize_response(expected)
    norm_actual = normalize_response(actual)
    
    try:
        # Check if basic fields match
        fields_to_check = ['tollOpID', 'periodFrom', 'periodTo']
        for field in fields_to_check:
            if norm_expected[field] != norm_actual[field]:
                return False, f"Field {field} doesn't match"
        
        # Check visiting operators list
        if len(norm_expected['vOpList']) != len(norm_actual['vOpList']):
            return False, "Visiting operators list lengths don't match"
        
        # Compare each visiting operator's data
        for exp_op, act_op in zip(norm_expected['vOpList'], norm_actual['vOpList']):
            if exp_op['visitingOpID'] != act_op['visitingOpID']:
                return False, f"Visiting operator IDs don't match: {exp_op['visitingOpID']} vs {act_op['visitingOpID']}"
            if exp_op['nPasses'] != act_op['nPasses']:
                return False, f"Number of passes doesn't match for operator {exp_op['visitingOpID']}"
            if abs(exp_op['passesCost'] - act_op['passesCost']) > 0.01:  # Allow small floating-point differences
                return False, f"Passes cost doesn't match for operator {exp_op['visitingOpID']}"
        
        return True, "Responses are equivalent"
    except KeyError as e:
        return False, f"Missing required field: {str(e)}"

# Convert date from "YYYYMMDD" to "YYYY-MM-DD"
def format_date(date_str):
    try:
        return datetime.strptime(date_str, "%Y%m%d").strftime("%Y-%m-%d")
    except ValueError:
        return None

# Read passes from CSV and filter based on station and date range
def load_passes():
    passes = []
    try:
        with open(PASSES_FILE, mode="r", encoding="utf-8-sig") as file:
            csv_reader = csv.DictReader(file, delimiter=",")  # Assuming comma-separated
            
            # Debugging: Print detected columns
            print(f"Detected Columns: {csv_reader.fieldnames}")

            expected_fields = {"timestamp", "tollID", "tagRef", "tagHomeID", "charge"}
            if not expected_fields.issubset(set(csv_reader.fieldnames)):
                print("⚠️ CSV headers are incorrect! Check delimiter.")
                return []
            
            for row in csv_reader:
                passes.append({
                    "timestamp": row["timestamp"].strip(),
                    "tollID": row["tollID"].strip(),
                    "tagProvider": row["tagHomeID"].strip(),
                    "passCharge": float(row["charge"])
                })

    except Exception as e:
        print(f"Error reading CSV file: {e}")
    return passes

# Generate expected response for a given API call
def generate_expected_response(toll_op, date_from, date_to, passes):
    # Filter passes for this toll operator's stations within the date range
    filtered_passes = [
        p for p in passes 
        if p["tollID"].startswith(toll_op)
        and date_from <= p["timestamp"].split()[0] <= date_to
    ]

    # Group passes by visiting operator
    visiting_ops = defaultdict(lambda: {"passes": 0, "cost": 0.0})
    for p in filtered_passes:
        visiting_op = p["tagProvider"]
        visiting_ops[visiting_op]["passes"] += 1
        visiting_ops[visiting_op]["cost"] += p["passCharge"]

    # Convert visiting operators to list format
    visiting_list = []
    for op in operators:  # Include all operators, even if they have zero passes
        if op != toll_op:
            visiting_list.append({
                "visitingOpID": op,
                "nPasses": visiting_ops[op]["passes"],
                "passesCost": round(visiting_ops[op]["cost"], 2)
            })

    # Sort by visitingOpID for consistent ordering
    visiting_list.sort(key=lambda x: x['visitingOpID'])

    response = {
        "tollOpID": toll_op,
        "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "periodFrom": date_from,
        "periodTo": date_to,
        "vOpList": visiting_list
    }

    return response

# Fetch actual API response and compare it with expected, then log results to a file
def test_api(api_url, passes):
    parts = api_url.split("/")
    if len(parts) < 6:
        log_result(f"[ERROR] Invalid API URL format: {api_url}")
        return

    toll_op = parts[-3]
    date_from = format_date(parts[-2])
    date_to = format_date(parts[-1])

    if not date_from or not date_to:
        log_result(f"[ERROR] Invalid date format in API URL: {api_url}")
        return

    # Generate expected response
    expected_response = generate_expected_response(toll_op, date_from, date_to, passes)

    # Make API request
    response = requests.get(api_url)
    if response.status_code == 200:
        actual_response = response.json()

        # Compare expected and actual responses
        is_equivalent, message = responses_are_equivalent(expected_response, actual_response)
        
        if is_equivalent:
            log_result(f"[✅ MATCH] API response is equivalent to expected output for {api_url}")
        else:
            log_result(f"[❌ MISMATCH] API response is not equivalent: {message}")
            log_result(f"Expected: {json.dumps(expected_response, indent=2)}")
            log_result(f"Actual:   {json.dumps(actual_response, indent=2)}\n")

    elif response.status_code == 204:
        log_result(f"[ℹ️  NO CONTENT] No passes found for {api_url}")
    else:
        log_result(f"[ERROR] API request failed for {api_url}. Status Code: {response.status_code}")

# Append results to file
def log_result(message):
    with open(RESULTS_FILE, "a", encoding="utf-8") as file:
        file.write(f"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')} - {message}\n")

# Run all tests
def run_all():
    # Clear previous results
    with open(RESULTS_FILE, "w", encoding="utf-8") as file:
        file.write(f"CHARGES BY TEST RESULTS - {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")

    passes = load_passes()
    for api_url in api_calls:
        test_api(api_url, passes)

    print(f"✅ Test results saved to {RESULTS_FILE}")

if __name__ == "__main__":
    run_all()