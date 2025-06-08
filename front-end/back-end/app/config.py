
# File: app/config.py
class Config:
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'root'
    MYSQL_PASSWORD = ''
    MYSQL_PORT = 3306
    MYSQL_DB = 'softeng_07'
    JWT_SECRET_KEY = 'Softeng-07'
    JWT_TOKEN_LOCATION = ['headers']
    JWT_HEADER_NAME = 'X-OBSERVATORY-AUTH'
    JWT_HEADER_TYPE = 'Bearer'