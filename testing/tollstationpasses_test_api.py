import csv
import json
import requests
from datetime import datetime
from copy import deepcopy

# API base URL
BASE_URL = "http://127.0.0.1:9115/api"

# Define valid operators and their full names
OPERATOR_MAPPING = {
    "AM": "aegeanmotorway",
    "EG": "egnatia", 
    "GE": "gefyra",
    "KO": "kentrikiodos",
    "MO": "moreas",
    "NAO": "naodos",
    "NO": "neaodos",
    "OO": "olympiaodos"
}

# File paths
PASSES_FILE = "passes07.csv"
RESULTS_FILE = "tollstationpasses_test_results.txt"

# List of API calls to test
api_calls = [
    f"{BASE_URL}/tollStationPasses/AM08/20220210/20220224",
    f"{BASE_URL}/tollStationPasses/NAO04/20220210/20220224", 
    f"{BASE_URL}/tollStationPasses/NO01/20220210/20220224",
    f"{BASE_URL}/tollStationPasses/OO03/20220210/20220224",
    f"{BASE_URL}/tollStationPasses/XXX/20220210/20220224",
    f"{BASE_URL}/tollStationPasses/OO03/20220210/20220224",
    f"{BASE_URL}/tollStationPasses/AM08/20220211/20220222",
    f"{BASE_URL}/tollStationPasses/NAO04/20220211/20220222",
    f"{BASE_URL}/tollStationPasses/NO01/20220211/20220222", 
    f"{BASE_URL}/tollStationPasses/OO03/20220211/20220222",
    f"{BASE_URL}/tollStationPasses/XXX/20220211/20220222",
    f"{BASE_URL}/tollStationPasses/OO03/20220211/20220222"
]

def log_result(message):
    """Write message to results file"""
    with open(RESULTS_FILE, 'a', encoding='utf-8') as f:
        f.write(f"{message}\n")

def responses_are_equivalent(expected, actual):
    """Compare two responses while ignoring non-essential differences"""
    # Make deep copies to avoid modifying originals
    exp = deepcopy(expected)
    act = deepcopy(actual)

    # Check basic fields match
    basic_fields = ['stationID', 'stationOperator', 'periodFrom', 'periodTo', 'nPasses']
    for field in basic_fields:
        if exp[field] != act[field]:
            return False

    # Compare pass lists ignoring passID differences
    if len(exp['passList']) != len(act['passList']):
        return False

    for e_pass, a_pass in zip(exp['passList'], act['passList']):
        essential_fields = ['passIndex', 'passType', 'tagID', 'tagProvider', 'passCharge', 'timestamp']
        for field in essential_fields:
            if e_pass[field] != a_pass[field]:
                return False
                
    return True

def format_date(date_str):
    """Convert date from YYYYMMDD to YYYY-MM-DD"""
    try:
        return datetime.strptime(date_str, "%Y%m%d").strftime("%Y-%m-%d")
    except ValueError:
        return None

def format_timestamp(timestamp_str):
    """Convert timestamp to API format"""
    dt = datetime.strptime(timestamp_str, "%Y-%m-%d %H:%M")
    return dt.strftime("%a, %d %b %Y %H:%M:00 GMT")

def get_operator(toll_id):
    """Extract station operator from toll ID"""
    for op in OPERATOR_MAPPING.keys():
        if toll_id.startswith(op):
            return op
    return "UNKNOWN"

def load_passes():
    """Read passes from CSV file"""
    passes = []
    try:
        with open(PASSES_FILE, mode="r", encoding="utf-8-sig") as file:
            csv_reader = csv.DictReader(file, delimiter=",")
            expected_fields = {"timestamp", "tollID", "tagRef", "tagHomeID", "charge"}
            if not expected_fields.issubset(set(csv_reader.fieldnames)):
                log_result("⚠️ CSV headers are incorrect!")
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
        log_result(f"Error reading CSV file: {e}")
    return passes

def generate_expected_response(toll_station_id, date_from, date_to, passes):
    """Generate expected response matching API format"""
    station_operator = get_operator(toll_station_id)
    
    station_passes = [
        p for p in passes 
        if p["tollID"] == toll_station_id and date_from <= p["timestamp"].split()[0] <= date_to
    ]
    
    station_passes.sort(key=lambda x: x["timestamp"])
    
    response = {
        "nPasses": len(station_passes),
        "passList": [],
        "periodFrom": date_from,
        "periodTo": date_to,
        "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "stationID": toll_station_id,
        "stationOperator": station_operator,
        "status": "success"
    }

    for index, p in enumerate(station_passes, start=1):
        tag_op = get_operator(p["tagProvider"])
        pass_type = "home" if p["tagProvider"] == station_operator else "visitor"
        
        response["passList"].append({
            "passCharge": p["passCharge"],
            "passID": (index + 83),
            "passIndex": index,
            "passType": pass_type,
            "tagID": p["tagID"],
            "tagProvider": OPERATOR_MAPPING.get(tag_op, "unknown"),
            "timestamp": format_timestamp(p["timestamp"])
        })
    
    return response

def test_api(api_url, passes):
    """Test API endpoint and compare with expected response"""
    parts = api_url.split("/")
    if len(parts) < 6:
        log_result(f"[ERROR] Invalid API URL format: {api_url}")
        return

    toll_station_id = parts[-3]
    date_from = format_date(parts[-2])
    date_to = format_date(parts[-1])
    
    if not date_from or not date_to:
        log_result(f"[ERROR] Invalid date format in API URL: {api_url}")
        return

    expected_response = generate_expected_response(toll_station_id, date_from, date_to, passes)
    
    response = requests.get(api_url)
    if response.status_code == 200:
        actual_response = response.json()
        if responses_are_equivalent(expected_response, actual_response):
            log_result(f"[✅ MATCH] API response is equivalent for {api_url}")
        else:
            log_result(f"[❌ MISMATCH] API response does not match expected output for {api_url}")
            log_result(f"Expected: {json.dumps(expected_response, indent=2)}")
            log_result(f"Actual:   {json.dumps(actual_response, indent=2)}")
    elif response.status_code == 204:
        log_result(f"[ℹ️  NO CONTENT] No passes found for {api_url}")
    else:
        log_result(f"[ERROR] API request failed for {api_url}. Status Code: {response.status_code}")

def run_all():
    """Run all API tests"""
    # Clear previous results file
    with open(RESULTS_FILE, 'w', encoding='utf-8') as f:
        f.write(f"TOLL STATION PASSES TEST RESULTS - {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
    
    passes = load_passes()
    for api_url in api_calls:
        test_api(api_url, passes)
    
    print(f"Test results have been saved to {RESULTS_FILE}")

if __name__ == "__main__":
    run_all()