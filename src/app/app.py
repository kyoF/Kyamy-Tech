from flask import Flask

from database import init_db
from views import account, signup, search, carts, details, admin, top

#Flaskを定義
app = Flask(__name__, static_url_path='/static')
app.config.from_object('config.DevelopmentConfig')

init_db(app)
app.register_blueprint(top.blueprint, url_prefix='/top')

app.register_blueprint(account.blueprint, url_prefix='/account')

app.register_blueprint(search.search, url_prefix='/search')

app.register_blueprint(carts.cart, url_prefix='/carts')

app.register_blueprint(signup.signup, url_prefix='/signup')

app.register_blueprint(details.detail, url_prefix='/detail')

app.register_blueprint(admin.admin, url_prefix='/admin')
