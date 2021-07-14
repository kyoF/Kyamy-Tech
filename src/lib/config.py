import os
SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://{user}:{password}@{host}/Z_gen_lib'.format(**{
    'user' : os.getenv('DB_USER', 'kyosukefujiki'),
    'password' : os.getenv('DB_PASSWORD', 'mlpmlp'),
    'host' : os.getenv('DB_HOST', 'localhost:5432'),
})
SQLALCHEMY_TRACK_MODIFICATIONS = False

SECRET_KEY = 'secret_key'

