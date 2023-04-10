from flask import render_template, request, Blueprint

from models import Book


blueprint = Blueprint('admin', __name__)

@blueprint.route('/')
def show_admin_window():
    admin_book_info = Book.query.order_by(Book.id).all()
    return render_template('admin/admin.html', admin_book_info=admin_book_info)    

@blueprint.route('/', methods=['POST'])
def show_admin_window_sort():
    sort_category = request.form.get('sort_category')
    if sort_category=='経済学部人気順':
        admin_book_info = Book.query.order_by(Book.keizai.desc()).all()
    elif sort_category=='法学部人気順':
        admin_book_info = Book.query.order_by(Book.hougaku.desc()).all()    
    elif sort_category=='理学部人気順':
        admin_book_info = Book.query.order_by(Book.rigaku.desc()).all()
    elif sort_category=='工学部人気順':
        admin_book_info = Book.query.order_by(Book.kougaku.desc()).all()
    elif sort_category=='文学部人気順':
        admin_book_info = Book.query.order_by(Book.bungaku.desc()).all()
    elif sort_category=='医学部人気順':
        admin_book_info = Book.query.order_by(Book.igaku.desc()).all()    
    else:
        admin_book_info = Book.query.order_by(Book.id).all()
    return render_template('admin/admin.html', admin_book_info=admin_book_info)
