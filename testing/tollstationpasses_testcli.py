import csv
import json
import subprocess
from datetime import datetime

# Define valid operators
operators = ["AM", "EG", "GE", "KO", "MO", "NAO", "NO", "OO"]

# Load passes from CSV
PASSES_FILE = "passes07.csv"

# List of CLI commands to process
cli_commands = [
    "se2407 tollstationpasses --station AM08 --from 20220210 --to 20220224 --format json",
    "se2407 tollstationpasses --station NAO04 --from 20220210 --to 20220224 --format csv",
    "se2407 tollstationpasses --station NO01 --from 20220210 --to 20220224 --format csv",
    "se2407 tollstationpasses --station OO03 --from 20220210 --to 20220224 --format csv",
    "se2407 tollstationpasses --station XXX --from 20220210 --to 20220224 --format csv",
    "se2407 tollstationpasses --station OO03 --from 20220210 --to 20220224 --format YYY",
    "se2407 tollstationpasses --station AM08 --from 20220211 --to 20220222 --format json",
    "se2407 tollstationpasses --station NAO04 --from 20220211 --to 20220222 --format csv",
    "se2407 tollstationpasses --station NO01 --from 20220211 --to 20220222 --format csv",
    "se2407 tollstationpasses --station OO03 --from 20220211 --to 20220222 --format csv",
    "se2407 tollstationpasses --station XXX --from 20220211 --to 20220222 --format csv",
    "se2407 tollstationpasses --station OO03 --from 20220211 --to 20220222 --format YYY"
   
]


def format_date(date_str):
    try:
        return datetime.strptime(date_str, "%Y%m%d").strftime("%Y-%m-%d")
    except ValueError:
        return None


def load_passes():
    passes = []
    try:
        with open(PASSES_FILE, mode="r", encoding="utf-8-sig") as file:
            csv_reader = csv.DictReader(file, delimiter=",")
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


def extract_relevant_fields(response):
    if isinstance(response, str):
        try:
            response = json.loads(response)
        except json.JSONDecodeError:
            return {}
    return {
        "nPasses": response.get("nPasses"),
        "periodFrom": response.get("periodFrom"),
        "periodTo": response.get("periodTo"),
        "stationID": response.get("stationID"),
        "stationOperator": response.get("stationOperator"),
        "status": response.get("status")
    }
def get_expected_output(command, passes):
    parts = command.split()
    if len(parts) < 9:
        return "[ERROR] Invalid command format"

    station_id = parts[3]  
    date_from = format_date(parts[5])
    date_to = format_date(parts[7])
    format_type = parts[9].lower()

    if station_id == "XXX":
        return "Error: Bad request. Please check your parameters."

    if not date_from or not date_to:
        return "[ERROR] Invalid date format"

    if format_type not in ["json", "csv"]:
        return "Error: Invalid format. Use 'json' or 'csv'."

    # Filter passes for this station and date range
    station_passes = [
        p for p in passes if 
        p["tollID"] == station_id and date_from <= p["timestamp"].split()[0] <= date_to 
    ]

    if not station_passes:
        return f"[NO DATA] No passes found for {station_id} between {date_from} and {date_to}."

    # Build response
    response = {
        "nPasses": len(station_passes),
        "passList": [],
        "periodFrom": date_from,
        "periodTo": date_to,
        "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "stationID": station_id,
        "stationOperator": station_id[:-2],
        "status": "success"
    }

    for index, p in enumerate(station_passes, start=1):
        response["passList"].append({
            "passCharge": p["passCharge"],
            "passID": f"{p['tollID']}_{index}",
            "passIndex": index,
            "passType": "home" if p['tollID'][:-2] == p['tagProvider'] else "visitor",
            "tagID": p["tagID"],            
            "tagProvider": p["tagProvider"],
            "timestamp": p["timestamp"]      
        })

    if format_type == "json":
        return json.dumps(response, indent=2)
    elif format_type == "csv":
        csv_output = "passIndex,passID,timestamp,tagID,tagProvider,passCharge\n"
        for p in response["passList"]:
            csv_output += f"{p['passIndex']},{p['passID']},{p['timestamp']},{p['tagID']},{p['tagProvider']},{p['passCharge']}\n"
        return csv_output.strip()


def process_command(command, passes):
    print(f"\n=== Running CLI Command: {command} ===")
    
    expected_output = extract_relevant_fields(get_expected_output(command, passes))
    
    try:
        actual_output = subprocess.run(command, shell=True, capture_output=True, text=True).stdout.strip()
        actual_output = extract_relevant_fields(actual_output)
    except Exception as e:
        print(f"Error executing CLI command: {e}")
        actual_output = {}

    print("\n=== Comparison Result ===")
    match = expected_output == actual_output
    print("MATCH" if match else "MISMATCH")
    if not match:
        print("\n=== Expected Output ===")
        print(expected_output)
        print("\n=== CLI Output ===")
        print(actual_output)


def run_all():
    passes = load_passes()
    for command in cli_commands:
        process_command(command, passes)


if __name__ == "__main__":
    run_all()
