from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.models import Book

from lib.db import db

from .login import login_check

from admin.views import login
from admin.views import search

detail = Blueprint('details', __name__)

@detail.route('/<string:id>', methods=['POST'])
def show_details(id):
    book_info = Book.query.get(id)
    global before_url
    before_url = request.referrer
    return render_template('details/details.html', book_info=book_info)

@detail.route('/back')
def back_before_url():
    judge = before_url[(before_url.rfind('/')):]
    if judge == '/' or judge == '/return_top':
        return render_template('top.html', name=session.get('name'), undergraduate=session.get('undergraduate'), ranking=login.gakubu_search_result)
    else:
        return render_template('search/result.html', categories=search.categories)
