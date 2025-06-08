import subprocess
import os
import json
import sys

# Add se2407_cli to sys.path before running tests
sys.path.insert(0, os.path.abspath("../se2407_cli"))

# Set the CLI script path
CLI_SCRIPT = os.path.abspath("../se2407_cli/se2407/cli.py")

# Define operators and date range
OPERATORS = ['AM', 'EG', 'GE', 'KO', 'MO', 'NAO', 'NO', 'OO']
DATE_FROM = "20220101"
DATE_TO = "20220131"

def run_cli_command(command):
    """Run a CLI command and capture output."""
    try:
        process = subprocess.Popen(
            ["python", CLI_SCRIPT] + command.split(),
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
        )
        output, error = process.communicate()
        return output.strip(), error.strip()
    except Exception as e:
        return None, str(e)

def test_login():
    """Test login functionality."""
    print("Testing login...")
    output, error = run_cli_command("login --username admin --passw admin")
    
    #print(f"Login Output: {output}")
    #print(f"Login Error: {error}")

    assert "logged_in" in output.lower(), f"Login test failed. Output: {output}"
    print("✅ Login test passed.")

def test_tollstationpasses():
    """Test tollstationpasses functionality."""
    print("Testing tollstationpasses...")
    output, error = run_cli_command(f"tollstationpasses --station NO01 --from {DATE_FROM} --to {DATE_TO} --format json")
    
    #print(f"Output: {output}")
    #print(f"Error: {error}")

    assert "\"status\": \"success\"" in output, f"TollStationPasses test failed. Output: {output}"
    print("✅ TollStationPasses test passed.")

def test_passanalysis():
    """Test passanalysis functionality."""
    print("Testing passanalysis...")
    output, error = run_cli_command(f"passanalysis --stationop NO --tagop NAO --from {DATE_FROM} --to {DATE_TO} --format json")
    
    #print(f"Output: {output}")
    #print(f"Error: {error}")

    assert "\"status\": \"success\"" in output, f"PassAnalysis test failed. Output: {output}"
    print("✅ PassAnalysis test passed.")


def test_passescost():
    """Test passescost functionality."""
    print("Testing passescost...")
    output, error = run_cli_command(f"passescost --stationop NAO --tagop NO --from {DATE_FROM} --to {DATE_TO} --format json")
    
    #print(f"Output: {output}")
    #print(f"Error: {error}")

    assert "\"status\": \"success\"" in output, f"PassesCost test failed. Output: {output}"
    print("✅ PassesCost test passed.")


def test_chargesby():
    """Test chargesby functionality."""
    print(" Testing chargesby...")
    
    command = f"chargesby --opid NAO --from {DATE_FROM} --to {DATE_TO} --format json"
    output, error = run_cli_command(command)
    
    print(f" Command Executed: {command}")
    print(f"Raw Output: {output}")
    print(f"Error (if any): {error}")

    try:
        response_json = json.loads(output)
        print(f"Parsed JSON Response: {response_json}")
    except json.JSONDecodeError:
        print(" Failed to parse JSON response. Output might not be JSON.")

    assert "tollOpID" in output, f" ChargesBy test failed. API returned: {output}"
    print("✅ ChargesBy test passed.")


def test_healthcheck():
    """Test the healthcheck functionality."""
    print("Testing healthcheck...")
    output, error = run_cli_command("healthcheck")
    
    #print(f"Output: {output}")
    #print(f"Error: {error}")

    assert "OK" in output, f"Healthcheck test failed. Output: {output}"
    print("✅ Healthcheck test passed.")

def test_admin_users():
    """Test the admin --users functionality."""
    print("Testing admin --users...")
    output, error = run_cli_command("admin --users --format json")

    #print(f"Output: {output}")
    #print(f"Error: {error}")

    assert "users" in output, "❌ Admin users test failed."
    print("✅ Admin users test passed.")

import os

def test_admin_addpasses():
    """Test the admin --addpasses functionality."""
    print("Testing admin --addpasses...")

    # Define test file
    test_file = "toll_data.csv"

    # Ensure the test file exists
    if not os.path.exists(test_file):
        print(f"❌ Test failed: File '{test_file}' does not exist. Please provide a valid test file.")
        return

    # Run the CLI command
    output, error = run_cli_command(f"admin --addpasses --source {test_file}")


    # Check for success in response
    assert "status" in output and "success" in output, f"❌ Admin addpasses test failed. Output: {output}"

    print("✅ Admin addpasses test passed.")


def test_admin_usermod():
    """Test the admin --usermod functionality."""
    print("Testing admin --usermod...")
    output, error = run_cli_command("admin --usermod --username testuser --passw newpassword")

    #print(f"Output: {output}")
    #print(f"Error: {error}")

    assert "success" in output.lower(), "❌ Admin usermod test failed."
    print("✅ Admin usermod test passed.")

def test_resetpasses():
    """Test resetpasses functionality."""
    print("Testing resetpasses...")
    output, error = run_cli_command("resetpasses")

    #print(f"Output: {output}")
    #print(f"Error: {error}")

    assert "reset successful" in output.lower(), "❌ ResetPasses test failed."
    print("✅ ResetPasses test passed.")

def test_resetstations():
    """Test resetstations functionality."""
    print("Testing resetstations...")
    output, error = run_cli_command("resetstations")

    #print(f"Output: {output}")
    #print(f"Error: {error}")

    assert "OK" in output, "❌ ResetStations test failed."
    print("✅ ResetStations test passed.")

def test_logout():
    """Test logout functionality."""
    print("Testing logout...")
    output, error = run_cli_command("logout")

    #print(f"Output: {output}")
    #print(f"Error: {error}")

    assert "logout successful" in output.lower(), "❌ Logout test failed."
    print("✅ Logout test passed.")

def run_all_tests():
    """Run all CLI tests."""
    print("\n🚀 Starting CLI Tests...\n")

    # Authentication Tests
    test_login()
    test_healthcheck()
    test_admin_users()
    test_admin_usermod()

    # Functional Tests
    test_tollstationpasses()
    test_passanalysis()
    test_passescost()
    test_chargesby()
    test_admin_addpasses()
    test_resetpasses()
    test_resetstations()

    # Logout
    test_logout()

    print("\n✅ All tests completed successfully.")

if __name__ == "__main__":
    run_all_tests()
