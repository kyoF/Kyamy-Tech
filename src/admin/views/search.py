from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.db import db

from .login import login_check

search = Blueprint('search', __name__)

@search.route('/')
@login_check
def window():
    return render_template('search/window.html')

# @search.route('/result', methods=['POST'])
@search.route('/result')
@login_check
def search_result():
    return render_template('search/result.html')