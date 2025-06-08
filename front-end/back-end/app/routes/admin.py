# File: app/routes/admin.py
from flask import Blueprint, request, jsonify
from app.extensions import mysql

admin_bp = Blueprint('admin', __name__, url_prefix='/admin')

@admin_bp.route('/healthcheck', methods=['GET'])
def health_check():
    try:
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT COUNT(*) as n_stations FROM Toll_Station")
        n_stations = cursor.fetchone()[0]

        cursor.execute("SELECT COUNT(*) as n_passes FROM Pass")
        n_passes = cursor.fetchone()[0]
        cursor.close()

        format_type = request.args.get("format", "json").lower()

        if format_type == "csv":
            return "CSV response here"  # Placeholder
        else:
            return jsonify({
                "status": "OK",
                "dbconnection": "active",
                "n_stations": n_stations,
                "n_passes": n_passes
            })
    except Exception as e:
        return jsonify({"status": "failed", "error": str(e)}), 500
