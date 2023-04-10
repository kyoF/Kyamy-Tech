#Flaskインポート
from flask import Flask
#init_dbインポート
from database import init_db
# from lib.db import init_db
from views import login, signup, search, carts, details, admin

#Flaskを定義
app = Flask(__name__, static_url_path='/static')

# @app.route("/")
# def hello():
#     return 'Hello World!'

app.config.from_object('config.Config')

init_db(app)

app.register_blueprint(search.search, url_prefix='/search')

app.register_blueprint(carts.cart, url_prefix='/carts')

app.register_blueprint(signup.signup, url_prefix='/signup')

app.register_blueprint(details.detail, url_prefix='/detail')

app.register_blueprint(admin.admin, url_prefix='/admin')
