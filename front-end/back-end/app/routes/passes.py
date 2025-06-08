# File: app/routes/passes.py
from flask import Blueprint, request, jsonify, Response
from app.extensions import mysql
import csv
from io import StringIO
from datetime import datetime

passes_bp = Blueprint('passes', __name__, url_prefix='/passes')
## if you se an error it's probably because i changed analysis => passAnalysis
@passes_bp.route('/passAnalysis/<stationOpID>/<tagOpID>/<date_from>/<date_to>', methods=['GET'])
def pass_analysis(stationOpID, tagOpID, date_from, date_to):
    try:
        cursor = mysql.connection.cursor()
        cursor.callproc('PassAnalysis', (stationOpID, tagOpID, date_from, date_to))
        result = cursor.fetchall()
        cursor.close()

        format_type = request.args.get("format", "json").lower()
        nPasses = len(result)

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
            return Response(output, mimetype="text/csv")
        else:
            return jsonify({
                "stationOpID": stationOpID,
                "tagOpID": tagOpID,
                "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                "periodFrom": date_from,
                "periodTo": date_to,
                "nPasses": nPasses,
                "passList": [
                    {
                        "passIndex": index + 1,
                        "passID": row[0],
                        "stationID": row[1],
                        "timestamp": row[2],
                        "tagID": row[3],
                        "passCharge": row[4]
                    } for index, row in enumerate(result)
                ]
            })
    except Exception as e:
        return jsonify({"status": "failed", "error": str(e)}), 500