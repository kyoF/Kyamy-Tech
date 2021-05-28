from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.db import db

from .login import login_check

cart = Blueprint('carts', __name__)

@cart.route('/cart')
@login_check
def index():
    return render_template('carts/index.html')
