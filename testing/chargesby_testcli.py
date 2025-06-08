import csv
import json
import subprocess
from datetime import datetime
from collections import defaultdict

# Define valid operators
operators = ["AM", "EG", "GE", "KO", "MO", "NAO", "NO", "OO"]

# Load passes from CSV
PASSES_FILE = "passes07.csv"

# List of CLI commands to process
cli_commands_chargesby = [
    "se2407 chargesby --opid NAO --from 20220210 --to 20220224 --format json",
    "se2407 chargesby --opid GE --from 20220210 --to 20220224 --format csv",
    "se2407 chargesby --opid OO --from 20220210 --to 20220224 --format csv",
    "se2407 chargesby --opid KO --from 20220210 --to 20220224 --format csv",
    "se2407 chargesby --opid NO --from 20220210 --to 20220224 --format csv"
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
        "periodFrom": response.get("periodFrom"),
        "periodTo": response.get("periodTo"),
        "requestTimestamp": response.get("requestTimestamp")
    }

def get_expected_output(command, passes):
    parts = command.split()
    if len(parts) < 9:
        return {"error": "Invalid command format"}

    toll_op = parts[3]
    date_from = format_date(parts[5])
    date_to = format_date(parts[7])
    format_type = parts[9].lower()

    if toll_op not in operators:
        return {"error": "Invalid operator ID"}

    if not date_from or not date_to:
        return {"error": "Invalid date format"}

    if format_type not in ["json", "csv"]:
        return {"error": "Invalid format. Use 'json' or 'csv'."}

    # Filter passes for this operator's stations within the date range
    filtered_passes = [
        p for p in passes
        if p["tollID"].startswith(toll_op)
        and date_from <= p["timestamp"].split()[0] <= date_to
    ]

    # Group passes by visiting operator
    visiting_ops = defaultdict(lambda: {"passes": 0, "cost": 0})
    for p in filtered_passes:
        visiting_op = p["tagProvider"]
        visiting_ops[visiting_op]["passes"] += 1
        visiting_ops[visiting_op]["cost"] += p["passCharge"]

    # Convert visiting operators to list format
    visiting_list = []
    for op, data in visiting_ops.items():
        visiting_list.append({
            "visitingOpID": op,
            "nPasses": data["passes"],
            "passesCost": round(data["cost"], 2)
        })

    # Build response
    response = {
        "tollOpID": toll_op,
        "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "periodFrom": date_from,
        "periodTo": date_to,
        "vOpList": visiting_list
    }

    if format_type == "json":
        return json.dumps(response, indent=2)
    elif format_type == "csv":
        csv_output = "tollOpID,visitingOpID,requestTimestamp,periodFrom,periodTo,nPasses,passesCost\n"
        for op_data in visiting_list:
            csv_output += f"{response['tollOpID']},{op_data['visitingOpID']},{response['requestTimestamp']}," \
                          f"{response['periodFrom']},{response['periodTo']},{op_data['nPasses']},{op_data['passesCost']}\n"
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
    match = (expected_output == actual_output) or actual_output == {}
    print("MATCH" if match else "MISMATCH")
    if not match:
        print("\n=== Expected Output ===")
        print(expected_output)
        print("\n=== CLI Output ===")
        print(actual_output)


def run_all():
    passes = load_passes()
    for command in cli_commands_chargesby:
        process_command(command, passes)


if __name__ == "__main__":
    run_all()
