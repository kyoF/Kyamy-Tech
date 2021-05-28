from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.models import User

from lib.db import db

signup = Blueprint('signup', __name__)

@signup.route('/')
def sign_up():
    return render_template('signup/signup.html')

