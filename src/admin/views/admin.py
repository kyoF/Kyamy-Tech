from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.models import History, Book

from lib.db import db

admin = Blueprint('admin', __name__)

@admin.route('/')
def show_admin_window():
    admin_book_info = Book.query.order_by(Book.id).all()
    
    return render_template('admin/admin.html', admin_book_info=admin_book_info)
