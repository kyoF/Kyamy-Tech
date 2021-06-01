from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.models import Book

from lib.db import db

from .login import login_check

detail = Blueprint('details', __name__)

@detail.route('/')
@login_check
def to_details():
    return render_template('details/details.html')

@detail.route('/<string:id>', methods=['POST'])
def show_details(id):
    book_info = Book.query.get(id)
    return render_template('details/details.html', book_info=book_info)

