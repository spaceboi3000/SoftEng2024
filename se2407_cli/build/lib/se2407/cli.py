import json
from se2407.utils import *
import csv
import json
import sys


TOKEN_FILE = "cli_token.txt"
USER_FILE = "cli_user.txt"
user_id = ""  # Global variable to track the logged-in user

def save_user_id(user):
    """Save user role (admin or regular user) to a file."""
    with open(USER_FILE, "w") as file:
        file.write(user)

def load_user_id():
    """Load the stored user role."""
    try:
        with open(USER_FILE, "r") as file:
            return file.read().strip()
    except FileNotFoundError:
        return ""

def save_token(token):
    """Save the token to a file."""
    with open(TOKEN_FILE, "w") as file:
        file.write(token)

def load_token():
    """Load the token from a file."""
    try:
        with open(TOKEN_FILE, "r") as file:
            return file.read().strip()
    except FileNotFoundError:
        return None




#check succesfull with se2407 login --username naodos --passw naodos   
#check unsuccesfull with se2407 login --username naodos --passw naodos1  
def process_login(args):
    global user_id
    """Handle the login command."""
    try:
        if '--username' in args and '--passw' in args:
            username = args[args.index('--username') + 1]
            password = args[args.index('--passw') + 1]
            response = call_api_login('/api/login', {"username": username, "password": password})
            if "token" in response:
                save_token(response["token"])  # Save the token
                #print("Login successful!")
                user_id = "admin" if username == "admin" else "user"  # Set user role
                save_user_id(user_id)  # Persist user role
                # Return a JSON object with the token
                print("Logged in as", user_id, "OK")
            else:
                error_message = f"Error: Incorrect credentials"
                print(error_message)
        else:
            print("Usage: login --username <USERNAME> --password <PASSWORD>")
            return {"error": "Invalid usage. Missing username or password."}
    except Exception as e:
        print(f"An error occurred: {str(e)}")

#check with se2407 tollstationpasses --station NO01 --from 20220101 --to 20220131
def process_tollstationpasses(args):
    """Handle the tollstationpasses command."""
    try:
        # Check if the user is logged in
        token = load_token()
        if not token:
            print("Error: You must be logged in to use this command.")
            print("Please log in using: se2407 login --username <USERNAME> --password <PASSWORD>")
            return
        
        station = args[args.index('--station') + 1]
        from_date = args[args.index('--from') + 1]
        to_date = args[args.index('--to') + 1]
        format = args[args.index('--format') + 1] if '--format' in args else 'csv'

        # Validate format
        if format not in ['json', 'csv']:
            print("Error: Invalid format. Use 'json' or 'csv'.")
            return

        params = {"station": station, "from": from_date, "to": to_date, "format": format}
        response = call_api_tollstationpasses('/api/tollStationPasses', params)
        if format == "json":
            print(json.dumps(response, indent=2))
    except (ValueError, IndexError):
        print("Usage: tollstationpasses --station <STATION> --from <YYYYMMDD> --to <YYYYMMDD> --format <json/csv>")


#check with se2407 healthcheck  
def process_healthcheck():
    """Handle the healthcheck command."""
    response = call_api_healthcheck('/api/admin/healthcheck')
    print(json.dumps(response, indent=2))


#helper for usermod, users, addpasses
def process_admin(args):
    global user_id  # Explicitly use the global variable

    # Load user role from file
    user_id = load_user_id()

    if user_id != "admin":
        print("🚨 Error: You must be logged in as an admin to use this command.")
        print("Please log in using: se2407 login --username <USERNAME> --password <PASSWORD>")
        return
    if '--addpasses' in args:
        try:
            source = args[args.index('--source') + 1]
            process_addpasses(source)
        except (ValueError, IndexError):
            print("Usage: admin --addpasses --source <FILE_NAME>")
    elif '--usermod' in args:
        try:
            username = args[args.index('--username') + 1]
            new_password = args[args.index('--passw') + 1]
            process_usermod(username, new_password)
        except (ValueError, IndexError):
            print("Usage: admin --usermod --username <USERNAME> --passw <NEW_PASSWORD>")
    elif '--users' in args:
        process_users(args)
    else:
        print("Unknown admin command. Type 'help' for available commands.")


#check with se2407 admin --addpasses --source toll_data.csv  
def process_addpasses(source):
    """Handle admin --addpasses command."""
    try:
        # Check if the file exists
        with open(source, 'rb') as file:
            response = call_api_admin_addpasses('/api/admin/addpasses', file)
        print("Passes and tags added successfully.")
    except FileNotFoundError:
        print(f"Error: File '{source}' not found.")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

#check with se2407 admin --usermod --username naodos --passw naodos1
#check with se2407 admin --usermod --username test --passw test  
def process_usermod(username, new_password):
    """Handle admin --usermod command."""
    url = f"/api/admin/usermod/{username}/{new_password}"
    response = call_api_admin_usermod(url)

    if response.get("status") == "success":
        print(f"Success: {response.get('message')}")
    else:
        print(f"Error: {response.get('message', 'Unknown error')}")


#check with se2407 admin --users
def process_users(args):
    """Handle admin --users command."""
    try:
        # Parse the format from arguments
        if '--format' in args:
            format_type = args[args.index('--format') + 1].lower()
        else:
            format_type = 'csv'  # Default to JSON if no format is provided

        if format_type not in {'json', 'csv'}:
            print("Invalid format. Please use '--format json' or '--format csv'.")
            return

        # Call the API to fetch users
        response = call_api_admin_users('/api/admin/users')

        if response.get("status") == "success":
            users = response.get("users", [])

            if format_type == "csv":
                # Write the users to a CSV file
                csv_file = "users.csv"
                try:
                    with open(csv_file, "w", newline="", encoding="utf-8") as file:
                        writer = csv.writer(file)
                        writer.writerow(["Username"])  # Header row
                        for user in users:
                            writer.writerow([user])  # Write each user to a row
                    print(f"Users list saved to '{csv_file}'.")
                except Exception as e:
                    print(f"Error writing to CSV: {e}")
            else:
                # Print JSON response to the console
                print(json.dumps(response, indent=2))
        else:
            # Handle API error
            print(f"Error: {response.get('message', 'Unknown error')}")
    except Exception as e:
        print(f"An error occurred: {str(e)}")


#check with se2407 passanalysis --stationop NO --tagop NAO --from 20220101 --to 20220131
def process_passanalysis(args):
    """Handle the passanalysis command."""
    try:
        # Check if the user is logged in
        token = load_token()
        if not token:
            print("Error: You must be logged in to use this command.")
            print("Please log in using: se2407 login --username <USERNAME> --password <PASSWORD>")
            return

        # Extract parameters from the arguments
        station_op_id = args[args.index('--stationop') + 1]
        tag_op_id = args[args.index('--tagop') + 1]
        date_from = args[args.index('--from') + 1]
        date_to = args[args.index('--to') + 1]
        format_type = args[args.index('--format') + 1] if '--format' in args else 'csv'

        # Validate format
        if format_type not in ['json', 'csv']:
            print("Error: Invalid format. Use 'json' or 'csv'.")

        # Make the API call
        response = call_api_passanalysis('/api/passAnalysis', station_op_id, tag_op_id, date_from, date_to, format_type)
        
        if format_type == "json":
            print(json.dumps(response, indent=2))

    except (ValueError, IndexError):
        print("Usage: passanalysis --station <STATION_OP_ID> --tag <TAG_OP_ID> --from <YYYYMMDD> --to <YYYYMMDD> --format <json/csv>")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

#check with se2407 chargesby --opid NAO --from 20220101 --to 20220131
def process_chargesby(args):
    """Handle the chargesBy command."""
    try:
        token = load_token()
        if not token:
            print("Error: You must be logged in to use this command.")
            return

        # Validate correct argument count
        if "--opid" not in args or "--from" not in args or "--to" not in args:
            print(" Missing required arguments.")
            print("Usage: chargesby --opid <OPERATOR_ID> --from <YYYYMMDD> --to <YYYYMMDD> --format <json/csv>")
            return

        # Parse arguments
        try:
            toll_op_id = args[args.index('--opid') + 1]
            date_from = args[args.index('--from') + 1]
            date_to = args[args.index('--to') + 1]
            format_type = args[args.index('--format') + 1] if '--format' in args else 'json'
        except IndexError:
            print(" Invalid argument formatting.")
            print("Usage: chargesby --opid <OPERATOR_ID> --from <YYYYMMDD> --to <YYYYMMDD> --format <json/csv>")
            return

        # Make API call
        endpoint = f"/api/chargesBy/{toll_op_id}/{date_from}/{date_to}"
        response = call_api_chargesBy(endpoint, {"format": format_type})

        if format_type == 'json':
            print(json.dumps(response, indent=2))

    except (ValueError, IndexError) as e:
        print(f" Argument Parsing Error: {str(e)}")
        print("Usage: chargesby --opid <OPERATOR_ID> --from <YYYYMMDD> --to <YYYYMMDD> --format <json/csv>")
    except Exception as e:
        print(f" Unexpected Error: {str(e)}")



#check with se2407 passescost --stationop NAO --tagop NO --from 20220101 --to 20220131  
def process_passescost(args):
    """Handle the chargesBy command."""
    try:
        # Check if the user is logged in
        token = load_token()
        if not token:
            print("Error: You must be logged in to use this command.")
            print("Please log in using: se2407 login --username <USERNAME> --password <PASSWORD>")
            return
        
        # Parse arguments
        station_op = args[args.index('--stationop') + 1]
        tag_op = args[args.index('--tagop')+1]
        date_from = args[args.index('--from') + 1]
        date_to = args[args.index('--to') + 1]
        format_type = args[args.index('--format') + 1].lower() if '--format' in args else 'csv'

        # Validate format
        if format_type not in ['json', 'csv']:
            print("Error: Invalid format. Please use '--format json' or '--format csv'.")
            return

        # Make the API call
        endpoint = f"/api/passesCost/{station_op}/{tag_op}/{date_from}/{date_to}?format={format_type}"
        params = {"station_op": station_op, "tag_op": tag_op, "date_from": date_from, "date_to": date_to, "format_type": format_type}
        response = call_api_passesCost(endpoint,params)
        if format_type == "json":
            print(json.dumps(response, indent=2))
    except (ValueError, IndexError):
        print("Usage: passescost --stationop <STATION_OP> --tagop <TAG_OP> --from <YYYYMMDD> --to <YYYYMMDD> --format <json/csv>")
    except Exception as e:
        print(f"An error occurred: {str(e)}")
    return 0

#check with se2407 resetpasses
def process_resetpasses(args):
    """Handle the resetpasses command."""
    try:
        # Make the API call
        response = call_api_resetpasses('/api/admin/resetpasses')
        
        # Print success message if no error
        print("Reset passes successful.")
        #return response

    except (ValueError, IndexError):
        print("Usage: resetpasses")
    except Exception as e:
        print(f"An error occurred: {str(e)}")


#check with se2407 resetstations
def process_resetstations(args):
    """Handle the resetstations command."""
    try:
        # Make the API call
        response = call_api_resetstations('/api/admin/resetstations')
        
        # Print success message if no error
        print("Reset stations successful.")
        #return response

    except (ValueError, IndexError):
        print("Usage: resetstations")
    except Exception as e:
        print(f"An error occurred: {str(e)}")
    

#check with se2407 logout
def process_logout(args):
    """Handle the logout command."""
    try:
        token = load_token()  # Load the token from storage
        if token:
            # Call the API logout utility
            response = call_api_logout('/api/logout', token)
            if response.get("message") == "Logout successful":
                print("Logout successful!")
                save_token("")  # Clear the token after logout
                user_id = ""
            else:
                print(json.dumps(response, indent=2))  # Print error response
        else:
            print("No token found. Please log in first.")
    except Exception as e:
        print(f"Error: {str(e)}")

def main():
    """Handles the CLI execution based on provided command-line arguments."""
    
    if len(sys.argv) < 2:
        print("Usage: se2407 <command> [--param1 value1 --param2 value2 ...]")
        print("Use 'se2407 help' to see available commands.")
        sys.exit(1)

    command = sys.argv[1]  # The first argument is the command
    args = sys.argv[2:]  # The rest are parameters

    # Route the command to the correct function
    if command == "login":
        result = process_login(args)
    elif command == "tollstationpasses":
        result = process_tollstationpasses(args)
    elif command == "logout":
        result = process_logout(args)
    elif command == "healthcheck":
        result = process_healthcheck()
    elif command == "passanalysis":
        result = process_passanalysis(args)
    elif command == "passescost":
        result = process_passescost(args)
    elif command == "chargesby":
        result = process_chargesby(args)
    elif command == "resetpasses":
        result = process_resetpasses(args)
    elif command == "resetstations":
        result = process_resetstations(args)
    elif command == "admin":
        result = process_admin(args)
    elif command == "help":
        print("""
Available commands:
  - login --username <USERNAME> --password <PASSWORD>
  - tollstationpasses --station <STATION> --from <YYYYMMDD> --to <YYYYMMDD> --format <json/csv>
  - passanalysis --stationop <OPERATORID> --tagop <OPERATORID> --from <YYYYMMDD> --to <YYYYMMDD> --format <json/csv>
  - passescost --stationop <OPERATORID> --tagop <OPERATORID> --from <YYYYMMDD> --to <YYYYMMDD> --format <json/csv>
  - chargesby --opid <OPERATORID> --from <YYYYMMDD> --to <YYYYMMDD> --format <json/csv>
  - admin --addpasses --source <FILE_NAME>
  - admin --usermod --username <USERNAME> --passw <NEW_PASSWORD>
  - admin --users --format <json/csv>
  - logout
  - healthcheck
  - resetpasses
  - resetstations
  - help
""")
        sys.exit(0)
    else:
        print(f"Unknown command: {command}. Type 'se2407 help' to see available commands.")
        sys.exit(1)

    # Print JSON result for API responses
    if isinstance(result, dict):
        print(json.dumps(result, indent=2))

if __name__ == "__main__":
    import sys
    main()


