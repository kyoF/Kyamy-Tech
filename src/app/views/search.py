from flask import render_template, request, Blueprint
from sqlalchemy import or_

from models import Book
from lib.login_check import login_check


blueprint = Blueprint('search', __name__)

@blueprint.route('/')
@login_check
def window():
    return render_template('search/window.html')

@blueprint.route('/result', methods=['POST'])
@login_check
def search_result():
    search_category = request.form.get('search_category')
    search_word = request.form.get('search_word')
    global categories
    if not search_category and not search_word:
        categories = Book.query.order_by(Book.category.desc())
    elif not search_category:
        categories = Book.query.order_by(Book.category.desc()).filter(or_(Book.title.like(f'%\\{search_word}%'), Book.name.like(f'%\\{search_word}%')))
    elif not search_word:
        categories = Book.query.order_by(Book.category.desc()).filter(Book.category==search_category)
    else:
        categories = Book.query.order_by(Book.category.desc()).filter(Book.category==search_category).filter(Book.title.like(f'%\\{search_word}%'))
    return render_template('search/result.html', categories=categories)
