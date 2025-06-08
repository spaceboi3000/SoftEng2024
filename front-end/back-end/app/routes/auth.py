
# File: app/routes/auth.py
from flask import Blueprint, request, jsonify, make_response
from app.extensions import mysql, jwt
from flask_jwt_extended import create_access_token, decode_token

auth_bp = Blueprint('auth', __name__, url_prefix='/auth')

@auth_bp.route('/login', methods=['POST'])
def login():
    try:
        username = request.form.get("username")
        password = request.form.get("password")

        cursor = mysql.connection.cursor()
        query = "SELECT ID FROM User WHERE Username = %s AND Password = %s"
        cursor.execute(query, (username, password))
        user = cursor.fetchone()
        cursor.close()

        if user:
            token = create_access_token(identity=username)
            return jsonify({"token": token}), 200
        else:
            return make_response(jsonify({"error": "Invalid username or password"}), 401)
    except Exception as e:
        return make_response(jsonify({"error": str(e)}), 500)

@auth_bp.route('/logout', methods=['POST'])
def logout():
    try:
        token = request.headers.get("X-OBSERVATORY-AUTH")
        if not token:
            return make_response(jsonify({"error": "Missing token"}), 401)

        try:
            decode_token(token)
        except Exception:
            return make_response(jsonify({"error": "Invalid or expired token"}), 401)

        return "", 200
    except Exception as e:
        return make_response(jsonify({"error": str(e)}), 500)