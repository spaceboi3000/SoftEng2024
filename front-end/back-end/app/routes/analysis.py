# File: app/routes/analysis.py
from flask import Blueprint, request, jsonify
from app.extensions import mysql
import csv
from io import StringIO
from datetime import datetime

analysis_bp = Blueprint('analysis', __name__, url_prefix='/analysis')

@analysis_bp.route('/chargesBy/<tollOpID>/<date_from>/<date_to>', methods=['GET'])
def charges_by(tollOpID, date_from, date_to):
    try:
        cursor = mysql.connection.cursor()
        cursor.callproc("chargesBy", (tollOpID, date_from, date_to))
        result = cursor.fetchall()
        cursor.close()

        format_type = request.args.get("format", "json").lower()
        vOpList = [
            {
                "visitingOpID": row[0],
                "nPasses": row[1],
                "passesCost": row[2],
            } for row in result
        ]

        response_data = {
            "tollOpID": tollOpID,
            "requestTimestamp": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "periodFrom": date_from,
            "periodTo": date_to,
            "vOpList": vOpList,
        }

        if format_type == "csv":
            output = StringIO()
            writer = csv.writer(output)
            writer.writerow(["tollOpID", tollOpID])
            writer.writerow(["requestTimestamp", datetime.now().strftime("%Y-%m-%d %H:%M:%S")])
            writer.writerow(["periodFrom", date_from])
            writer.writerow(["periodTo", date_to])
            writer.writerow(["vOpList Length", len(vOpList)])
            writer.writerow(["visitingOpID", "nPasses", "passesCost"])

            for row in vOpList:
                writer.writerow([row["visitingOpID"], row["nPasses"], row["passesCost"]])

            output.seek(0)
            return Response(output, mimetype="text/csv")
        else:
            return jsonify(response_data)
    except Exception as e:
        return jsonify({"status": "failed", "error": str(e)}), 500