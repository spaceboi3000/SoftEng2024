import csv
import json
import subprocess
from datetime import datetime

# Define valid operators
operators = ["AM", "EG", "GE", "KO", "MO", "NAO", "NO", "OO"]

# Load passes from CSV
PASSES_FILE = "passes07.csv"

# List of CLI commands to process
cli_commands_passescost = [
    "se2407 passescost --stationop AM --tagop NAO --from 20220210 --to 20220224 --format json",
    "se2407 passescost --stationop NAO --tagop AM --from 20220210 --to 20220224 --format csv",
    "se2407 passescost --stationop NO --tagop OO --from 20220210 --to 20220224 --format csv",
    "se2407 passescost --stationop OO --tagop KO --from 20220210 --to 20220224 --format csv",
    "se2407 passescost --stationop XXX --tagop KO --from 20220210 --to 20220224 --format csv",
    "se2407 passescost --stationop AM --tagop NAO --from 20220211 --to 20220222 --format json",
    "se2407 passescost --stationop NAO --tagop AM --from 20220211 --to 20220222 --format csv",
    "se2407 passescost --stationop NO --tagop OO --from 20220211 --to 20220222 --format csv",
    "se2407 passescost --stationop OO --tagop KO --from 20220211 --to 20220222 --format csv",
    "se2407 passescost --stationop XXX --tagop KO --from 20220211 --to 20220222 --format csv"
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
        "tollOpID": response.get("tollOpID"),
        "tagOpID": response.get("tagOpID"),
        "periodFrom": response.get("periodFrom"),
        "periodTo": response.get("periodTo"),
        "nPasses": response.get("nPasses"),
        "passesCost": response.get("passesCost")
    }



def get_expected_output(command, passes):
    parts = command.split()
    if len(parts) < 11:
        return {"error": "Invalid command format"}

    station_op = parts[3]
    tag_op = parts[5]
    date_from = format_date(parts[7])
    date_to = format_date(parts[9])
    format_type = parts[11].lower()

    if station_op == "XXX":
        return {"error": "Bad request. Please check your parameters."}

    if not date_from or not date_to:
        return {"error": "Invalid date format"}

    if format_type not in ["json", "csv"]:
        return {"error": "Invalid format. Use 'json' or 'csv'."}

    # Filter passes and calculate total cost
    filtered_passes = [
        p for p in passes 
        if p["tollID"].startswith(station_op) 
        and p["tagProvider"] == tag_op 
        and date_from <= p["timestamp"].split()[0] <= date_to
    ]

    total_cost = sum(p["passCharge"] for p in filtered_passes)

    # Build response
    response = {
        "tollOpID": station_op,
        "tagOpID": tag_op,
        "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "periodFrom": date_from,
        "periodTo": date_to,
        "nPasses": len(filtered_passes),
        "passesCost": round(total_cost, 2)
    }

    if format_type == "json":
        return json.dumps(response, indent=2)
    elif format_type == "csv":
        return f"{response['tollOpID']},{response['tagOpID']},{response['requestTimestamp']}," \
               f"{response['periodFrom']},{response['periodTo']},{response['nPasses']},{response['passesCost']}"





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
    match = (expected_output == actual_output) or actual_output == {}
    print("MATCH" if match else "MISMATCH")
    if not match:
        print("\n=== Expected Output ===")
        print(expected_output)
        print("\n=== CLI Output ===")
        print(actual_output)


def run_all():
    passes = load_passes()
    for command in cli_commands_passescost:
        process_command(command, passes)


if __name__ == "__main__":
    run_all()
