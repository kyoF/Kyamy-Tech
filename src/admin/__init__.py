#Flaskインポート
from flask import Flask
#init_dbインポート
from lib.db import init_db

#Flaskを定義
app = Flask(__name__)


app.config.from_object('admin.config')
app.config.from_object('lib.config')

init_db(app)
from admin.views import login, search, carts, signup

app.register_blueprint(search.search, url_prefix='/search')
app.register_blueprint(carts.cart, url_prefix='/carts')