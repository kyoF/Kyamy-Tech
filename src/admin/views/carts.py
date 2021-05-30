from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.models import Book

from lib.db import db

cart = Blueprint('carts', __name__)

# カート画面を表示
@cart.route('/cart')
def index():
    cart=session.get('cart')
    cart_details = list()

    if type(cart) is dict:
        for book_id in cart.items():
            book=Book.query.get(book_id)
            cart_details.append({ 'book': book })
 
    return render_template('carts/index.html',cart_details=cart_details)

@cart.route('/create',methods=['POST'])
def create():
    book_id=request.form.get('book_id') or ""

    # if Book.query.get(book_id)==None:
    #     flash('対象の商品はありません','error')
    #     return redirect(url_for('carts.index'))
        
    cart=session.get('cart')

    if type(cart) is dict:
        origin_book=cart.get(book_id) or 0
        cart[book_id]=origin_book
        
    else:
        cart={book_id}
        
    session['cart']=cart
    flash('カートに追加しました','success')
    return redirect(url_for('carts.index'))

@cart.route('/<string:book_id>/delete',methods=['POST'])
def delete(book_id):
    if book_id=='all':
        session.pop('cart',None)
    else:
        cart=session.get('cart')
        cart.pop(book_id,None)
        session['cart']=cart

    flash('商品が削除されました','success')
    return redirect(url_for('carts.index'))

