import csv
import json
import requests
from datetime import datetime

# API base URL
BASE_URL = "http://127.0.0.1:9115/api"

# Define valid operators
operators = ["AM", "EG", "GE", "KO", "MO", "NAO", "NO", "OO"]

# CSV File containing passes
PASSES_FILE = "passes07.csv"
RESULTS_FILE = "passescost_test_results.txt"  # Output file for storing results

# List of API calls to test
api_calls = [
    f"{BASE_URL}/passesCost/AM/NAO/20220210/20220224",
    f"{BASE_URL}/passesCost/NAO/AM/20220210/20220224",
    f"{BASE_URL}/passesCost/NO/OO/20220210/20220224",
    f"{BASE_URL}/passesCost/OO/KO/20220210/20220224",
    f"{BASE_URL}/passesCost/XXX/KO/20220210/20220224",
    f"{BASE_URL}/passesCost/AM/NAO/20220211/20220222",
    f"{BASE_URL}/passesCost/NAO/AM/20220211/20220222",
    f"{BASE_URL}/passesCost/NO/OO/20220211/20220222",
    f"{BASE_URL}/passesCost/OO/KO/20220211/20220222",
    f"{BASE_URL}/passesCost/XXX/KO/20220211/20220222"
]

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

def generate_expected_response(toll_op, tag_op, date_from, date_to, passes):
    # Filter passes by station operator and tag operator within the date range
    filtered_passes = [
        p for p in passes 
        if p["tollID"].startswith(toll_op) 
        and p["tagProvider"] == tag_op 
        and date_from <= p["timestamp"].split()[0] <= date_to
    ]

    total_cost = sum(p["passCharge"] for p in filtered_passes)
    
    # Get current time in GMT/UTC format
    current_time = datetime.utcnow()
    formatted_timestamp = current_time.strftime("%a, %d %b %Y %H:%M:%S GMT")
    
    response = {
        "nPasses": len(filtered_passes),
        "passesCost": round(total_cost, 2),
        "periodFrom": date_from,
        "periodTo": date_to,
        "requestTimestamp": formatted_timestamp,
        "status": "success",
        "tagOpID": tag_op,
        "tollOpID": toll_op
    }

    return response

# Fetch actual API response and compare it with expected, then log results to a file
def test_api(api_url, passes):
    parts = api_url.split("/")
    if len(parts) < 6:
        log_result(f"[ERROR] Invalid API URL format: {api_url}")
        return

    toll_op = parts[-4]
    tag_op = parts[-3]
    date_from = format_date(parts[-2])
    date_to = format_date(parts[-1])

    if not date_from or not date_to:
        log_result(f"[ERROR] Invalid date format in API URL: {api_url}")
        return

    # Generate expected response
    expected_response = generate_expected_response(toll_op, tag_op, date_from, date_to, passes)

    # Make API request
    response = requests.get(api_url)
    if response.status_code == 200:
        actual_response = response.json()

        # Compare expected and actual responses
        if actual_response == expected_response:
            log_result(f"[✅ MATCH] API response matches expected output for {api_url}")
        else:
            log_result(f"[❌ MISMATCH] API response does not match expected output for {api_url}")
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
        file.write(f"PASS COST TEST RESULTS - {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")

    passes = load_passes()
    for api_url in api_calls:
        test_api(api_url, passes)

    print(f"✅ Test results saved to {RESULTS_FILE}")

if __name__ == "__main__":
    run_all()
