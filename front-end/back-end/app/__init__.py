# File: app/__init__.py
from flask import Flask
from app.config import Config
from app.extensions import mysql, jwt
from app.routes import register_routes

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Initialize extensions
    mysql.init_app(app)
    jwt.init_app(app)

    # Register routes
    register_routes(app)

    return app