import os

class DevelopmentConfig:
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://{user}:{password}@{host}/{database}?charset=utf8mb4'.format(**{
        'user': os.getenv('DB_USER', 'zgl'),
        'password': os.getenv('DB_PASSWORD', 'zgl'),
        'host': os.getenv('DB_HOST', 'z-generation-library'),
        'database': os.getenv('DB_DATABASE', 'zgl'),
    })
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    DEBUG = True
    SECRET_KEY = 'secret_key'

Config = DevelopmentConfig
