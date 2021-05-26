#Flaskインポート
from flask import Flask
#init_dbインポート
from lib.db import init_db

#Flaskを定義
app = Flask(__name__)


app.config.from_object('admin.config')
app.config.from_object('lib.config')

init_db(app)
import admin.views