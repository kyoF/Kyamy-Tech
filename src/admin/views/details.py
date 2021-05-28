from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.models import Book

from lib.db import db

detail = Blueprint('details', __name__)

@detail.route('/<string:id>', methods=['POST'])
def show_details(id):
    book_info = Book.query.get(id)
    return render_template('details/details.html', book_info=book_info)

