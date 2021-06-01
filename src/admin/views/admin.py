from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.models import History, Book ,User

from lib.db import db

admin = Blueprint('admin', __name__)

@admin.route('/')
def show_admin_window():
    # sort_category = request.form.get('sort_category')
    # print(sort_category)
    # if sort_category=='経済学部人気順':
    #     admin_book_info = Book.query.order_by(Book.title).all()
    # elif sort_category=='法学部人気順':
    #     admin_book_info = Book.query.order_by(Book.id.desc()).all()    
    # elif sort_category=='理学部人気順':
    #     admin_book_info = Book.query.order_by(Book.category).all()
    # elif sort_category=='工学部人気順':
    #     admin_book_info = Book.query.order_by(Book.category.desc()).all()
    # elif sort_category=='文学部人気順':
    #     admin_book_info = Book.query.order_by(Book.name).all()
    # elif sort_category=='医学部人気順':
    #     admin_book_info = Book.query.order_by(Book.name()).all()    
    # else:
    #     admin_book_info = Book.query.order_by(Book.id).all()
    admin_book_info = Book.query.order_by(Book.id).all()
    return render_template('admin/admin.html', admin_book_info=admin_book_info)