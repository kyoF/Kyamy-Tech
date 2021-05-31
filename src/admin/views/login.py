from flask import render_template, request, url_for, session, redirect, flash

from admin import app

from functools import wraps

from lib.db import db
from lib.models import User, Book

#ログインチェック処理
def login_check(view):
    @wraps(view)
    def inner(*args, **kwargs):
        if not session.get('logged_in'):
            flash('ログインしてください。', 'error')  #ログインしないまま操作したときのflash
            return redirect(url_for('login'))
        return view(*args, **kwargs)
    return inner

#ログイン
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method =='POST':
        try:
            user_id = request.form.get('user_id')
            user_info = User.query.filter_by(user_id = user_id).first()
            print(type(user_info))
            if user_info is None:
                flash('ユーザIDが違います。', 'error')
            elif not user_info.password == request.form.get('password'):
                flash('パスワードが違います。', 'error')
            else:
                session['logged_in'] = True
                session['user_id'] = user_info.user_id
                session['name'] = user_info.name
                session['undergraduate'] = user_info.undergraduate
                flash('ログインしました。', 'success')
                return top(session.get('name'), session.get('undergraduate'))
        except ValueError:
            flash('適切なユーザIDを入力してください', 'error')
    return render_template('login/login.html')

#ログアウト
@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    print('ログアウトしました。')
    return redirect(url_for('login'))

@app.route('/top')
@login_check
def top(name, underguraduate):
    global gakubu_search_result 
    gakubu_search_result = ''
    if underguraduate == '経済学部':
        gakubu_search_result = Book.query.order_by(Book.keizai.desc()).limit(10).offset(0).all()
    elif underguraduate == '法学部':
        gakubu_search_result = Book.query.order_by(Book.hougaku.desc()).limit(10).offset(0).all()
    elif underguraduate == '理学部':
        gakubu_search_result = Book.query.order_by(Book.rigaku.desc()).limit(10).offset(0).all()
    elif underguraduate == '工学部':
        gakubu_search_result = Book.query.order_by(Book.kougaku.desc()).limit(10).offset(0).all()
    elif underguraduate == '文学部':
        gakubu_search_result = Book.query.order_by(Book.bungaku.desc()).limit(10).offset(0).all()
    else:
        gakubu_search_result = Book.query.order_by(Book.igaku.desc()).limit(10).offset(0).all()
    return render_template('top.html', name=name, underguraduate=underguraduate, ranking=gakubu_search_result)

@app.route('/return_top')
@login_check
def return_top():
    return render_template('top.html', name=session.get('name'), underguraduate=session.get('underguraduate'), ranking=gakubu_search_result)
