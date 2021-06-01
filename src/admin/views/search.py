from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.models import Book

from lib.db import db

from .login import login_check

search = Blueprint('search', __name__)

@search.route('/')
@login_check
def window():
    return render_template('search/window.html')

@search.route('/result', methods=['POST'])
@login_check
def search_result():
    get_search_result = []
    search_category = request.form.get('search_category')
    search_word = request.form.get('search_word')

    if not search_category and not search_word:
        categories = Book.query.order_by(Book.category.desc())

    elif not search_category:
        categories = Book.query.order_by(Book.category.desc()).filter(Book.title.like(f'%\\{search_word}%'))

    elif not search_word:
        categories = Book.query.order_by(Book.category.desc()).filter(Book.category==search_category)

    else:
        categories = Book.query.order_by(Book.category.desc()).filter(Book.category==search_category).filter(Book.title.like(f'%\\{search_word}%'))

    return render_template('search/result.html', categories=categories)