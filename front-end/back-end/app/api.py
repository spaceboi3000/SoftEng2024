from flask import Flask, jsonify, make_response, request, Response
from flask_mysqldb import MySQL
from flask_cors import CORS
from flask_jwt_extended import JWTManager, create_access_token, decode_token, jwt_required, get_jwt_identity
from flask import Response
import csv
from datetime import datetime, timezone , timedelta
import os

from io import StringIO
app = Flask(__name__)
CORS(app)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
#app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_PORT'] = 3306
app.config['MYSQL_DB'] = 'softeng_07'
app.config['JWT_SECRET_KEY'] = 'Softeng-07'  # Change this to a strong secret key
app.config['JWT_TOKEN_LOCATION'] = ['headers']
app.config['JWT_HEADER_NAME'] = 'X-OBSERVATORY-AUTH'
app.config['JWT_HEADER_TYPE'] = 'Bearer'  # Optional: To match "Bearer <token>"

mysql = MySQL(app)


@app.route("/")
def home():
    return "Softeng-07 project"

jwt = JWTManager(app)


@app.errorhandler(404)
def not_found(error):
    return jsonify({"status": "error", "message": "Endpoint not found"}), 404

@app.errorhandler(405)
def method_not_allowed(error):
    return jsonify({"status": "error", "message": "Method not allowed"}), 405

@app.errorhandler(500)
def internal_server_error(error):
    return jsonify({"status": "error", "message": "Internal server error"}), 500

@app.route("/login", methods=["POST"])
def login2():
    try:
        # Retrieve credentials from form data
        username = request.form.get("username")
        password = request.form.get("password")

        # Verify credentials
        cursor = mysql.connection.cursor()
        query = "SELECT ID FROM User WHERE Username = %s AND Password = %s"
        cursor.execute(query, (username, password))
        user = cursor.fetchone()
        cursor.close()

        if user:
            # Create a JWT token
            token = create_access_token(identity=username)
            return jsonify({"token": token}), 200
        else:
            return make_response(jsonify({"error": "Invalid username or password"}), 401)
    except Exception as e:
        return make_response(jsonify({"error": str(e)}), 500)
    
@app.route("/api/login", methods=["POST"])
def login():
    try:
        # Retrieve credentials from form data
        username = request.form.get("username")
        password = request.form.get("password")

        # Verify credentials
        cursor = mysql.connection.cursor()
        query = "SELECT ID FROM User WHERE Username = %s AND Password = %s"
        cursor.execute(query, (username, password))
        user = cursor.fetchone()
        cursor.close()

        if user:
            # Create a JWT token
            token = create_access_token(identity=username)
            return jsonify({"token": token}), 200
        else:
            return make_response(jsonify({"error": "Invalid username or password"}), 401)
    except Exception as e:
        return make_response(jsonify({"error": str(e)}), 500)

@app.route("/api/logout", methods=["POST"])
def logout():
    try:
        # Retrieve the token from the custom header
        token = request.headers.get("X-OBSERVATORY-AUTH")
        if not token:
            return make_response(jsonify({"error": "Missing token"}), 401)

        # Verify the token
        try:
            decoded_token = decode_token(token)
            identity = decoded_token.get("sub")  # Retrieve the user identity if needed
            print(f"User {identity} is logging out.")  # Optional: Log the user identity
        except JWTDecodeError: # type: ignore
            return make_response(jsonify({"error": "Invalid or expired token"}), 401)

        # Stateless logout: no server-side state to clear
        return "", 200

    except Exception as e:
        return make_response(jsonify({"error": str(e)}), 500)

@app.route("/logout", methods=["POST"])
def logout2():
    try:
        # Retrieve the token from the custom header
        token = request.headers.get("X-OBSERVATORY-AUTH")
        if not token:
            return make_response(jsonify({"error": "Missing token"}), 401)

        # Verify the token
        try:
            decoded_token = decode_token(token)
            identity = decoded_token.get("sub")  # Retrieve the user identity if needed
            print(f"User {identity} is logging out.")  # Optional: Log the user identity
        except JWTDecodeError: # type: ignore
            return make_response(jsonify({"error": "Invalid or expired token"}), 401)

        # Stateless logout: no server-side state to clear
        return "", 200

    except Exception as e:
        return make_response(jsonify({"error": str(e)}), 500)

# Health check endpoint
@app.route("/api/admin/healthcheck", methods=["GET"])
def health_check():
    try:
        # Create a connection cursor
        cursor = mysql.connection.cursor()

        # Query for the number of stations
        cursor.execute("SELECT COUNT(*) as n_stations FROM Toll_Station")
        result = cursor.fetchone()
        n_stations = result[0] if result else None

        # Query for the number of passes
        cursor.execute("SELECT COUNT(*) as n_passes FROM Pass")
        result = cursor.fetchone()
        n_passes = result[0] if result else None

        # Close the cursor
        cursor.close()

        # If there is no data at all, return 204
        if n_stations is None and n_passes is None:
            return make_response("", 204)

        # Get the format query parameter
        format_type = request.args.get("format", "json").lower()

        # Validate format type
        if format_type not in ["json", "csv"]:
            return make_response(jsonify({"error": "Invalid format type"}), 400)

        if format_type == "csv":
            # Generate CSV response
            output = StringIO()
            writer = csv.writer(output)
            writer.writerow(["status", "dbconnection", "n_stations", "n_passes"])
            writer.writerow(["OK", "active", n_stations, n_passes])
            output.seek(0)
            return Response(output, mimetype="text/csv", status=200)
        else:
            # Default JSON response
            return make_response(jsonify({
                "status": "OK",
                "dbconnection": "active",
                "n_stations": n_stations,
                "n_passes": n_passes
            }), 200)

    except Exception as e:
        return make_response(jsonify({"status": "failed", "dbconnection": "inactive", "error": str(e)}), 401)



#-------------------------- START NICK MOR --------------------------#
@app.route('/api/admin/resetpasses', methods=['POST'])
def reset_passes():
    try:
        # Δημιουργία cursor
        cur = mysql.connection.cursor()
        
        # Διαγραφή όλων των διελεύσεων
        cur.execute('DELETE FROM pass')
        
        # Διαγραφή όλων των tags
        cur.execute('DELETE FROM tag')
        
        # Έλεγχος αν υπάρχει ο admin user
        cur.execute('SELECT * FROM operator WHERE ID = %s', ['admin'])
        admin_exists = cur.fetchone() is not None
        '''
        if admin_exists:
            # Ενημέρωση του υπάρχοντος admin
            cur.execute('UPDATE operator SET password = %s WHERE ID = %s', 
                       ['freepasses4all', 'admin'])
        else:
            # Δημιουργία νέου admin
            cur.execute('INSERT INTO operator (ID, password) VALUES (%s, %s)',
                       ['admin', 'freepasses4all'])
        '''
        # Commit των αλλαγών
        mysql.connection.commit()
        
        # Κλείσιμο του cursor
        cur.close()
        
        return jsonify({"status": "OK"})
    
    except Exception as e:
        # Rollback σε περίπτωση σφάλματος
        mysql.connection.rollback()
        return jsonify({
            "status": "failed",
            "info": str(e)
        }), 500
#-------------------------- END NICK MOR --------------------------#


# Utility function to validate date format
def validate_date(date_str):
    try:
        return datetime.strptime(date_str, "%Y%m%d").strftime("%Y-%m-%d")
    except ValueError:
        return None
    
def validate_date_to(date_str):
    try:
        date = datetime.strptime(date_str, "%Y%m%d")
        next_day = date + timedelta(days=1)
        return next_day.strftime("%Y-%m-%d")
    except ValueError:
        return None

# Utility function to validate operator IDs
def validate_operator(operator_id, cursor):
    cursor.execute("SELECT COUNT(*) FROM Operator WHERE ID = %s", (operator_id,))
    return cursor.fetchone()[0] > 0

# Utility function to validate tollStationID
def validate_toll_station(toll_station_id, cursor):
    cursor.execute("SELECT COUNT(*) FROM Toll_Station WHERE ID = %s", (toll_station_id,))
    return cursor.fetchone()[0] > 0

#check with /api/passesCost/NAO/NO/20220101/20220131
@app.route("/api/passesCost/<tollOpID>/<tagOpID>/<date_from>/<date_to>", methods=["GET"])
def passes_cost(tollOpID, tagOpID, date_from, date_to):
    try:
        # Validate and convert dates
        date_from = validate_date(date_from)
        date_to_query = date_to
        date_to = validate_date(date_to)
        date_to_query = validate_date_to(date_to_query)
        if not date_from or not date_to:
            return make_response(jsonify({"status": "error", "message": "Invalid date format. Use YYYYMMDD."}), 400)

        # Validate format parameter
        format_param = request.args.get("format", "json").lower()
        if format_param not in ["json", "csv"]:
            return make_response(jsonify({"status": "error", "message": "Invalid format specified. Use 'json' or 'csv'."}), 400)

        # Database connection
        cursor = mysql.connection.cursor()

        # Validate operators
        if not validate_operator(tollOpID, cursor) or not validate_operator(tagOpID, cursor):
            cursor.close()
            return make_response(jsonify({"status": "error", "message": "Invalid tollOpID or tagOpID."}), 400)

        # Execute query
        query = """
        SELECT COUNT(p.ID), ROUND(COALESCE(SUM(p.Amount), 0), 2)
        FROM Pass p
        JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
        JOIN Operator o ON ts.OperatorID = o.ID
        JOIN Tag t ON p.TagID = t.ID
        JOIN Operator o2 ON t.OperatorID = o2.ID
        WHERE o.ID = %s AND o2.ID = %s AND p.Timestamp BETWEEN %s AND %s
        """
        cursor.execute(query, (tollOpID, tagOpID, date_from, date_to_query))
        result = cursor.fetchone()
        cursor.close()

        
        if result:
            nPasses, passesCost = result 
            status_code = 200
        else:
            nPasses, passesCost = 0, 0.0
            #status_code = 204
        
        # Note: Zero values are valid results, not null
        response_data = {
            "status": "success",
            "tollOpID": tollOpID,
            "tagOpID": tagOpID,
            "requestTimestamp": datetime.now(timezone.utc).strftime("%a, %d %b %Y %H:%M:%S GMT"),
            "periodFrom": date_from,
            "periodTo": date_to,
            "nPasses": nPasses,
            "passesCost": passesCost
        }

        if format_param == "json":
            return make_response(jsonify(response_data), status_code)
        else:  # CSV format
            csv_output = f"tollOpID,tagOpID,requestTimestamp,periodFrom,periodTo,nPasses,passesCost\n"
            csv_output += f"{tollOpID},{tagOpID},\"{response_data['requestTimestamp']}\",{date_from},{date_to},{nPasses},{passesCost}"
            return Response(csv_output, mimetype="text/csv", status=status_code)

    except Exception as e:
        return make_response(jsonify({"status": "error", "message": str(e)}), 500)

#check with /api/passAnalysis/NO/NAO/20220101/20220131
@app.route("/api/passAnalysis/<stationOpID>/<tagOpID>/<date_from>/<date_to>", methods=["GET"])
def pass_analysis(stationOpID, tagOpID, date_from, date_to):
    try:
        # Validate and convert dates
        date_from = validate_date(date_from)
        date_to_query = date_to
        date_to = validate_date(date_to)
        date_to_query = validate_date_to(date_to_query)
        if not date_from or not date_to:
            return make_response(jsonify({"status": "error", "message": "Invalid date format. Use YYYYMMDD."}), 400)

        # Validate format
        format_type = request.args.get("format", "json").lower()
        if format_type not in ["json", "csv"]:
            return make_response(jsonify({"status": "error", "message": "Invalid format. Use 'json' or 'csv'."}), 400)

        cursor = mysql.connection.cursor()

        # Validate operators
        if not validate_operator(stationOpID, cursor) or not validate_operator(tagOpID, cursor):
            cursor.close()
            return make_response(jsonify({"status": "error", "message": "Invalid operator ID."}), 400)

        cursor.callproc('PassAnalysis', (stationOpID, tagOpID, date_from, date_to_query))
        result = cursor.fetchall()
        
        # Fetch the count of rows (nPasses)
        count_query = """
        SELECT COUNT(*) AS totalPasses
        FROM (
            SELECT p.ID AS passID,
                   ts.ID AS stationID,
                   p.Timestamp AS timestamp,
                   t.ID AS tagID,
                   p.Amount AS passCharge
            FROM Pass p
                 JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
                 JOIN Tag t ON p.TagID = t.ID
                 JOIN Operator o ON ts.OperatorID = o.ID
                 JOIN Operator o2 ON t.OperatorID = o2.ID
            WHERE o.ID = %s
              AND o2.ID = %s
              AND p.Timestamp BETWEEN %s AND %s
        ) AS subquery;
        """
        cursor.execute(count_query, (stationOpID, tagOpID, date_from, date_to_query))
        nPasses = cursor.fetchone()[0]
        cursor.close()

        status_code = 200
        if not result and nPasses != 0:
            status_code = 204

        if format_type == "csv":
            output = StringIO()
            writer = csv.writer(output)
            writer.writerow(["stationOpID", stationOpID])
            writer.writerow(["tagOpID", tagOpID])
            writer.writerow(["requestTimestamp", datetime.now().strftime("%Y-%m-%d %H:%M:%S")])
            writer.writerow(["periodFrom", date_from])
            writer.writerow(["periodTo", date_to])
            writer.writerow(["nPasses", nPasses])
            writer.writerow(["passIndex", "passID", "stationID", "timestamp", "tagID", "passCharge"])
            for index, row in enumerate(result, start=1):
                writer.writerow([index, *row])
            output.seek(0)
            return Response(output, mimetype="text/csv", status=status_code)
        
        return make_response(jsonify({
            "status": "success",
            "stationOpID": stationOpID,
            "tagOpID": tagOpID,
            "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "periodFrom": date_from,
            "periodTo": date_to,
            "nPasses": nPasses,
            "passList": [{"passIndex": i + 1, "passID": row[0], "stationID": row[1], "timestamp": row[2], "tagID": row[3], "passCharge": row[4]} for i, row in enumerate(result)]
        }), status_code)
    except Exception as e:
        return make_response(jsonify({"status": "error", "message": str(e)}), 500)

#check with /api/tollStationPasses/NO01/20220101/20220131
@app.route("/api/tollStationPasses/<tollStationID>/<date_from>/<date_to>", methods=["GET"])
def toll_station_passes(tollStationID, date_from, date_to):
    try:
        # Validate and convert dates
        date_from = validate_date(date_from)
        date_to_query = date_to
        date_to = validate_date(date_to)
        date_to_query = validate_date_to(date_to_query)
        if not date_from or not date_to:
            return make_response(jsonify({"status": "error", "message": "Invalid date format. Use YYYYMMDD."}), 400)

        format_type = request.args.get("format", "json").lower()
        if format_type not in ["json", "csv"]:
            return make_response(jsonify({"status": "error", "message": "Invalid format. Use 'json' or 'csv'."}), 400)

        cursor = mysql.connection.cursor()

        if not validate_toll_station(tollStationID, cursor):
            cursor.close()
            return make_response(jsonify({"status": "error", "message": "Invalid toll station ID."}), 400)

        cursor.callproc('TollStationPasses', (tollStationID, date_from, date_to_query))
        result = cursor.fetchall()
        cursor.close()

        status_code = 200
        

        nPasses = len(result)
        station_operator = tollStationID[:-2]
        
        if format_type == "csv":
            output = StringIO()
            writer = csv.writer(output)
            writer.writerow(["stationID", tollStationID])
            writer.writerow(["stationOperator", station_operator])
            writer.writerow(["requestTimestamp", datetime.now().strftime("%Y-%m-%d %H:%M:%S")])
            writer.writerow(["periodFrom", date_from])
            writer.writerow(["periodTo", date_to])
            writer.writerow(["nPasses", nPasses])
            writer.writerow(["passIndex", "passID", "timestamp", "tagID", "tagProvider", "passType", "passCharge"])
            for row in result:
                writer.writerow(row)
            output.seek(0)
            return Response(output, mimetype="text/csv", status=status_code)
        
        return make_response(jsonify({
            "status": "success",
            "stationID": tollStationID,
            "stationOperator": station_operator,
            "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "periodFrom": date_from,
            "periodTo": date_to,
            "nPasses": nPasses,
            "passList": [{"passIndex": row[0], "passID": row[1], "timestamp": row[2], "tagID": row[3], "tagProvider": row[4], "passType": row[5], "passCharge": row[6]} for row in result]
        }), 200)
    except Exception as e:
        return make_response(jsonify({"status": "error", "message": str(e)}), 500)
    
@app.route("/api/admin/resetstations", methods=["POST"])
def reset_stations():
    try:

        csv_file_path = "./tollstations2024.csv"
    
        # Connect to the database
        cursor = mysql.connection.cursor()

        # Clear existing data in the table
        cursor.execute("DELETE FROM Toll_Station")

        # Read and insert data from the CSV file
        with open(csv_file_path, mode="r", encoding="utf-8-sig") as file:
            csv_reader = csv.DictReader(file)

            # Debug: Print detected columns
            print("Detected columns:", csv_reader.fieldnames)

            for row in csv_reader:
                # SQL query to insert a row
                insert_query = """
                INSERT INTO Toll_Station (ID, Name, Road, Lat, Long_, Locality, Email, PM, Price1, Price2, Price3, Price4, OperatorID)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """
                data = (
                    row['TollID'],  # ID
                    row['Name'],  # Name
                    row['Road'],  # Road
                    float(row['Lat']),  # Lat
                    float(row['Long']),  # Long_
                    row['Locality'],  # Locality
                    row['Email'],  # Email
                    row['PM'],  # PM
                    float(row['Price1']),  # Price1
                    float(row['Price2']),  # Price2
                    float(row['Price3']),  # Price3
                    float(row['Price4']),  # Price4
                    row['OpID']  # OperatorID
                )
                cursor.execute(insert_query, data)

        # Commit changes
        mysql.connection.commit()
        cursor.close()

        # Return success response
        return jsonify({"status": "OK"}), 200

    except FileNotFoundError:
        # File not found error
        return jsonify({"status": "failed", "info": "CSV file not found"}), 400
    except KeyError as e:
        # Missing field in CSV error
        return jsonify({"status": "failed", "info": f"Missing column in CSV: {e}"}), 400
    except ValueError as e:
        # Invalid data format (e.g., non-numeric value for float)
        return jsonify({"status": "failed", "info": f"Invalid data format: {e}"}), 400
    except Exception as e:
        # Generic error handling
        return jsonify({"status": "failed", "info": str(e)}), 500

#check with
#N




#check with postman:
#/api/admin/addpasses
#you must add a file.csv to check (to create one use the create_passes.py that makes the toll_data.csv)
@app.route("/api/admin/addpasses", methods=["POST"])
def add_passes():
    try:
        # Check if a file is included in the request
        if 'file' not in request.files:
            return make_response(jsonify({"error": "No file part in request"}), 400)

        file = request.files['file']

        # Validate file type
        if not file or not file.filename.endswith('.csv'):
            return make_response(jsonify({"error": "Invalid file type. Please upload a CSV file."}), 400)

        # Read the uploaded CSV file
        stream = StringIO(file.stream.read().decode("utf-8"))
        csv_reader = csv.DictReader(stream)

        # Expected CSV headers
        expected_fields = ["timestamp", "tollID", "tagRef", "tagHomeID", "charge"]
        if csv_reader.fieldnames != expected_fields:
            return make_response(jsonify({"error": "Invalid CSV format. Ensure the fields match the sample CSV."}), 400)

        cursor = mysql.connection.cursor()

        # Use a set to track unique tags
        tag_entries = set()

        for row in csv_reader:
            timestamp = row["timestamp"]
            tollID = row["tollID"]
            tagRef = row["tagRef"]
            tagHomeID = row["tagHomeID"]
            charge = float(row["charge"])

            # Insert into Tag table if not already processed
            if tagRef not in tag_entries:
                tag_query = """
                INSERT INTO Tag (ID, OperatorID)
                VALUES (%s, %s)
                """
                cursor.execute(tag_query, (tagRef, tagHomeID))
                tag_entries.add(tagRef)

            # Insert into Pass table
            pass_query = """
            INSERT INTO Pass (Timestamp, Amount, Toll_StationID, TagID)
            VALUES (%s, %s, %s, %s)
            """
            cursor.execute(pass_query, (timestamp, charge, tollID, tagRef))

        # Commit the transactions
        mysql.connection.commit()
        cursor.close()

        return jsonify({"status": "success", "message": "Passes and tags added successfully"}), 200

    except Exception as e:
        return make_response(jsonify({"status": "failed", "error": str(e)}), 500)


#-------------------------- START NICK MOR --------------------------#
@app.route("/api/chargesBy/<tollOpID>/<date_from>/<date_to>", methods=["GET"])
def charges_by(tollOpID, date_from, date_to):
    try:
        cursor = mysql.connection.cursor()

       # Validate and convert dates
        date_from = validate_date(date_from)
        date_to_query = date_to
        date_to = validate_date(date_to)
        date_to_query = validate_date_to(date_to_query)
        date_to_query = date_to
        if not date_from or not date_to:
            return make_response(jsonify({"status": "error", "message": "Invalid date format"}), 400)

        # Validate operator ID
        if not validate_operator(tollOpID, cursor):
            return make_response(jsonify({"status": "error", "message": "Invalid operator ID"}), 400)

        # Execute the stored procedure
        cursor.callproc("ChargesBy", (tollOpID, date_from, date_to_query))
        result = cursor.fetchall()
        cursor.close()

        # Process results
        vOpList = [
            {"visitingOpID": row[0], "nPasses": row[1], "passesCost": row[2]}
            for row in result
        ]

        # Return 204 No Content if no visiting operators exist
        if not vOpList:
            return make_response('', 204)

        # Prepare JSON response
        response_data = {
            "tollOpID": tollOpID,
            "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "periodFrom": date_from,
            "periodTo": date_to,
            "vOpList": vOpList,
        }

        # Validate response format
        format_type = request.args.get("format", "json").lower()
        if format_type not in ["json", "csv"]:
            return make_response(jsonify({"status": "error", "message": "Invalid format type"}), 400)

        # Return CSV response
        if format_type == "csv":
            output = StringIO()
            writer = csv.writer(output)
            writer.writerow(["tollOpID", tollOpID])
            writer.writerow(["requestTimestamp", response_data["requestTimestamp"]])
            writer.writerow(["periodFrom", date_from])
            writer.writerow(["periodTo", date_to])
            writer.writerow(["vOpList Length", len(vOpList)])
            writer.writerow(["visitingOpID", "nPasses", "passesCost"])
            for row in vOpList:
                writer.writerow([row["visitingOpID"], row["nPasses"], row["passesCost"]])
            output.seek(0)
            return Response(output, mimetype="text/csv", status=200)

        # Return JSON response
        return make_response(jsonify(response_data), 200)

    except Exception as e:
        return make_response(jsonify({"status": "error", "message": str(e)}), 500)

#-------------------------- END NICK MOR --------------------------#

@app.route("/api/admin/usermod/<username>/<password>", methods=["POST"])
def usermod(username,password):
    try:
        if not username or not password:
            return make_response(jsonify({"status": "error", "message": "Missing username or password"}), 400)

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM User WHERE Username = %s", (username,))
        user = cursor.fetchone()

        if user:
            cursor.execute("UPDATE User SET Password = %s WHERE Username = %s", (password, username))
            message = "User password updated successfully."
        else:
            cursor.execute("INSERT INTO User (Username, Password, OperatorID) VALUES (%s, %s, 'admin')", (username, password))
            message = "New user created successfully."

        mysql.connection.commit()
        cursor.close()

        return make_response(jsonify({"status": "success", "message": message}), 200)
    except Exception as e:
        return make_response(jsonify({"status": "error", "message": str(e)}), 500)

@app.route("/api/admin/users", methods=["GET"])
def users():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT Username FROM User")
        users = [row[0] for row in cursor.fetchall()]
        cursor.close()

        if not users:
            return make_response('', 204)

        return make_response(jsonify({"status": "success", "users": users}), 200)
    except Exception as e:
        return make_response(jsonify({"status": "error", "message": str(e)}), 500)

@app.route("/api/payDebt/<payingOpID>/<receivingOpID>/<amount_paid>", methods=["POST"])
def pay_debt(payingOpID, receivingOpID, amount_paid):
    try:
        if not payingOpID or not receivingOpID or not amount_paid:
            return make_response(jsonify({"status": "error", "message": "Missing required parameters"}), 400)

        try:
            amount_paid = float(amount_paid)
        except ValueError:
            return make_response(jsonify({"status": "error", "message": "amount_paid must be a valid number"}), 400)

        cursor = mysql.connection.cursor()
        
        # Validate operators
        if not validate_operator(payingOpID, cursor) or not validate_operator(receivingOpID, cursor):
            cursor.close()
            return make_response(jsonify({"status": "error", "message": "Invalid operator ID"}), 400)
            
        cursor.callproc('PayDebt', (payingOpID, receivingOpID, amount_paid))
        mysql.connection.commit()
        cursor.close()

        return make_response(jsonify({"status": "success", "message": "Debt payment processed successfully."}), 200)

    except Exception as e:
        return make_response(jsonify({"status": "error", "message": str(e)}), 500)

@app.route("/api/showsDebtTo/<operatorID>", methods=["GET"])
def shows_debt(operatorID):
    try:
        cursor = mysql.connection.cursor()
        
        if not validate_operator(operatorID, cursor):
            cursor.close()
            return make_response(jsonify({"status": "error", "message": "Invalid operator ID"}), 400)

        cursor.callproc('ShowsDebtTo', (operatorID,))
        result = cursor.fetchall()
        cursor.close()

        debt_list = [
            {
                "Debtor": row[0],
                "Creditor": row[1],
                "DebtAmount": row[2],
                "DebtStartDate": row[3].strftime("%Y-%m-%d") if row[3] else None
            }
            for row in result
        ]

        if not debt_list:
            return make_response('', 204)

        return make_response(jsonify({
            "status": "success",
            "operatorID": operatorID,
            "debtList": debt_list,
            "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        }), 200)
    except Exception as e:
        return make_response(jsonify({"status": "error", "message": str(e)}), 500)

@app.route("/api/showsDebtFrom/<operatorID>", methods=["GET"])
def shows_debt_from(operatorID):
    try:
        cursor = mysql.connection.cursor()
        
        if not validate_operator(operatorID, cursor):
            cursor.close()
            return make_response(jsonify({"status": "error", "message": "Invalid operator ID"}), 400)

        cursor.callproc('ShowsDebtFrom', (operatorID,))
        result = cursor.fetchall()
        cursor.close()

        debt_list = [
            {
                "Debtor": row[0],
                "Creditor": row[1],
                "DebtAmount": round(row[2], 2),
                "DebtStartDate": row[3].strftime("%Y-%m-%d") if row[3] else None
            }
            for row in result
        ]

        if not debt_list:
            return make_response('', 204)

        return make_response(jsonify({
            "status": "success",
            "operatorID": operatorID,
            "debtList": debt_list,
            "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        }), 200)
    except Exception as e:
        return make_response(jsonify({"status": "error", "message": str(e)}), 500)

@app.route("/api/tollPasses/<tollStationID>/<passDate>", methods=["GET"])
def toll_passes_and_cost(tollStationID, passDate):
    try:
        cursor = mysql.connection.cursor()
        
        if not validate_toll_station(tollStationID, cursor):
            cursor.close()
            return make_response(jsonify({"status": "error", "message": "Invalid toll station ID"}), 400)
            
        try:
            passDate = datetime.strptime(passDate, "%Y%m%d").strftime("%Y-%m-%d")
        except ValueError:
            cursor.close()
            return make_response(jsonify({"status": "error", "message": "Invalid date format"}), 400)

        cursor.callproc('TotalPassesAndCost', (tollStationID, passDate))
        result = cursor.fetchone()
        cursor.close()

        if not result:
            return make_response('', 204)

        total_passes, total_cost = result
        
        # Note: zero values are valid results, not null
        return make_response(jsonify({
            "status": "success",
            "tollStationID": tollStationID,
            "passDate": passDate,
            "totalPasses": total_passes,
            "totalCost": total_cost,
            "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        }), 200)
    except Exception as e:
        return make_response(jsonify({"status": "error", "message": str(e)}), 500)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=9115)

