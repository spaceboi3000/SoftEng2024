from flask import Flask, jsonify, request, Response
import mysql.connector
import csv
from datetime import datetime, timezone

app = Flask(__name__)

# Database configuration
db_config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'root',
    'database': 'softeng_07',
    'port': 8889,
    'unix_socket': '/Applications/MAMP/tmp/mysql/mysql.sock'
}

def get_db_connection():
    return mysql.connector.connect(**db_config)

@app.route("/")
def home():
    return "Softeng-07 project"

@app.route("/passesCost/<tollOpID>/<tagOpID>/<date_from>/<date_to>", methods=["GET"])
def passes_cost(tollOpID, tagOpID, date_from, date_to):
    try:
        # Parse date inputs
        period_from = date_from[:4] + "-" + date_from[4:6] + "-" + date_from[6:]
        period_to = date_to[:4] + "-" + date_to[4:6] + "-" + date_to[6:]

        # Determine the response format
        format_param = request.args.get("format", "json").lower()
        if format_param not in ["json", "csv"]:
            return jsonify({"error": "Invalid format specified. Use 'json' or 'csv'."}), 400

        # Connect to the database
        connection = get_db_connection()
        cursor = connection.cursor()

        # SQL query
        query = """
        SELECT
            o.ID AS tollOpID,
            o2.ID AS tagOpID,
            %s AS periodFrom,
            %s AS periodTo,
            COUNT(p.ID) AS nPasses,
            ROUND(SUM(p.Amount), 2) AS passesCost
        FROM Pass p
        JOIN Toll_Station ts ON p.Toll_StationID = ts.ID
        JOIN Operator o ON ts.OperatorID = o.ID
        JOIN Tag t ON p.TagID = t.ID
        JOIN Operator o2 ON t.OperatorID = o2.ID
        WHERE o.ID = %s
          AND o2.ID = %s
          AND p.Timestamp BETWEEN %s AND %s
        """

        params = (period_from, period_to, tollOpID, tagOpID, period_from, period_to)

        # Execute query
        cursor.execute(query, params)
        result = cursor.fetchone()

        # Close connection
        cursor.close()
        connection.close()

        # Generate UTC timestamp in Python
        utc_timestamp = datetime.now(timezone.utc).strftime("%a, %d %b %Y %H:%M:%S GMT")

        # Build the response data
        if result:
            response_data = {
                "tollOpID": result[0],
                "tagOpID": result[1],
                "requestTimestamp": utc_timestamp,
                "periodFrom": period_from,
                "periodTo": period_to,
                "nPasses": result[4],
                "passesCost": float(result[5])
            }
        else:
            response_data = {
                "tollOpID": tollOpID,
                "tagOpID": tagOpID,
                "requestTimestamp": utc_timestamp,
                "periodFrom": period_from,
                "periodTo": period_to,
                "nPasses": 0,
                "passesCost": 0.0
            }

        # Return response in the requested format
        if format_param == "json":
            return jsonify(response_data), 200
        elif format_param == "csv":
            # Generate CSV response
            csv_output = "tollOpID,tagOpID,requestTimestamp,periodFrom,periodTo,nPasses,passesCost\n"
            csv_output += f"{response_data['tollOpID']},{response_data['tagOpID']},\"{response_data['requestTimestamp']}\",{response_data['periodFrom']},{response_data['periodTo']},{response_data['nPasses']},{response_data['passesCost']}"
            return Response(csv_output, mimetype="text/csv", headers={"Content-Disposition": "attachment; filename=passes_cost.csv"})

    except Exception as e:
        print(f"Error: {e}")
        return jsonify({"error": str(e)}), 500


if __name__ == "__main__":
    app.run(debug=True, port=9115)
