from flask import Flask

from database import init_db
from views import account, signup, search, carts, details, admin, top

#Flaskを定義
app = Flask(__name__)
app.config.from_object('config.DevelopmentConfig')

init_db(app)

app.register_blueprint(top.blueprint, url_prefix='/top')
app.register_blueprint(account.blueprint, url_prefix='/account')
app.register_blueprint(search.blueprint, url_prefix='/search')
app.register_blueprint(carts.blueprint, url_prefix='/carts')
app.register_blueprint(signup.blueprint, url_prefix='/signup')
app.register_blueprint(details.blueprint, url_prefix='/detail')
app.register_blueprint(admin.blueprint, url_prefix='/admin')
