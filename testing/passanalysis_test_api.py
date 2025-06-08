import csv
import json
import requests
from datetime import datetime
from copy import deepcopy

# API base URL
BASE_URL = "http://127.0.0.1:9115/api"

# Define valid operators
operators = ["AM", "EG", "GE", "KO", "MO", "NAO", "NO", "OO"]

# CSV File containing passes
PASSES_FILE = "passes07.csv"
RESULTS_FILE = "passanalysis_test_results.txt"

# List of API calls to test
api_calls = [
    f"{BASE_URL}/passAnalysis/AM/NAO/20220210/20220224",
    f"{BASE_URL}/passAnalysis/NAO/AM/20220210/20220224",
    f"{BASE_URL}/passAnalysis/NO/OO/20220210/20220224",
    f"{BASE_URL}/passAnalysis/OO/KO/20220210/20220224",
    f"{BASE_URL}/passAnalysis/XXX/KO/20220210/20220224",
    f"{BASE_URL}/passAnalysis/AM/NAO/20220211/20220222",
    f"{BASE_URL}/passAnalysis/NAO/AM/20220211/20220222",
    f"{BASE_URL}/passAnalysis/NO/OO/20220211/20220222",
    f"{BASE_URL}/passAnalysis/OO/KO/20220211/20220222",
    f"{BASE_URL}/passAnalysis/XXX/KO/20220211/20220222"
]

def normalize_timestamp(timestamp_str):
    """Convert different timestamp formats to a standard format"""
    try:
        # Handle the GMT format
        if "GMT" in timestamp_str:
            dt = datetime.strptime(timestamp_str, "%a, %d %b %Y %H:%M:%S GMT")
            return dt.strftime("%Y-%m-%d %H:%M")
        # Handle the simple format
        return timestamp_str
    except ValueError:
        return timestamp_str

def normalize_pass_id(pass_id):
    """Convert pass_id to string format regardless of input type"""
    return str(pass_id)

def normalize_response(response):
    """Normalize a response dictionary to make it comparable"""
    response = deepcopy(response)
    
    # Remove status field if it exists
    response.pop('status', None)
    
    # Normalize timestamps in passList
    if 'passList' in response:
        for pass_entry in response['passList']:
            if 'timestamp' in pass_entry:
                pass_entry['timestamp'] = normalize_timestamp(pass_entry['timestamp'])
            if 'passID' in pass_entry:
                pass_entry['passID'] = normalize_pass_id(pass_entry['passID'])

    return response

def responses_are_equivalent(expected, actual):
    """Compare two responses while ignoring format differences"""
    # Normalize both responses
    norm_expected = normalize_response(expected)
    norm_actual = normalize_response(actual)
    
    try:
        # Check if number of passes matches
        if norm_expected['nPasses'] != norm_actual['nPasses']:
            return False, "Number of passes doesn't match"
        
        # Check if basic fields match
        fields_to_check = ['stationOpID', 'tagOpID', 'periodFrom', 'periodTo']
        for field in fields_to_check:
            if norm_expected[field] != norm_actual[field]:
                return False, f"Field {field} doesn't match"
        
        # Check pass lists
        if len(norm_expected['passList']) != len(norm_actual['passList']):
            return False, "Pass list lengths don't match"
        
        # For each pass, check if essential data matches
        for exp_pass, act_pass in zip(norm_expected['passList'], norm_actual['passList']):
            fields_to_check = ['passIndex', 'stationID', 'timestamp', 'tagID', 'passCharge']
            for field in fields_to_check:
                if exp_pass[field] != act_pass[field]:
                    return False, f"Pass field {field} doesn't match"
        
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
            csv_reader = csv.DictReader(file, delimiter=",")
            
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
                    "tagID": row["tagRef"].strip(),
                    "tagProvider": row["tagHomeID"].strip(),
                    "passCharge": float(row["charge"])
                })

    except Exception as e:
        print(f"Error reading CSV file: {e}")
    return passes

# Generate expected response for a given API call
def generate_expected_response(station_op, tag_op, date_from, date_to, passes):
    # Filter passes by station operator and tag operator within the date range
    filtered_passes = [
        p for p in passes 
        if p["tollID"].startswith(station_op) 
        and p["tagProvider"] == tag_op 
        and date_from <= p["timestamp"].split()[0] <= date_to
    ]

    response = {
        "stationOpID": station_op,
        "tagOpID": tag_op,
        "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "periodFrom": date_from,
        "periodTo": date_to,
        "nPasses": len(filtered_passes),
        "passList": []
    }

    for index, p in enumerate(filtered_passes, start=1):
        response["passList"].append({
            "passIndex": index,
            "passID": f"{p['tollID']}_{index}",
            "stationID": p["tollID"],
            "timestamp": p["timestamp"],
            "tagID": p["tagID"],
            "passCharge": p["passCharge"]
        })
    
    return response

# Fetch actual API response and compare it with expected, then log results to a file
def test_api(api_url, passes):
    parts = api_url.split("/")
    if len(parts) < 6:
        log_result(f"[ERROR] Invalid API URL format: {api_url}")
        return

    station_op = parts[-4]
    tag_op = parts[-3]
    date_from = format_date(parts[-2])
    date_to = format_date(parts[-1])

    if not date_from or not date_to:
        log_result(f"[ERROR] Invalid date format in API URL: {api_url}")
        return

    # Generate expected response
    expected_response = generate_expected_response(station_op, tag_op, date_from, date_to, passes)

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
        file.write(f"PASS ANALYSIS TEST RESULTS - {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")

    passes = load_passes()
    for api_url in api_calls:
        test_api(api_url, passes)

    print(f"✅ Test results saved to {RESULTS_FILE}")

if __name__ == "__main__":
    run_all()