from flask import render_template, request, url_for, session, redirect, flash, Blueprint

# from ..app import app

from functools import wraps

from database import db
from models import User, Book

from sqlalchemy.sql import text

from views.top import top

blueprint = Blueprint('login', __name__)



#ログイン
@blueprint.route('/login', methods=['GET', 'POST'])
def login():
    if request.method =='POST':
        try:
            user_id = request.form.get('user_id')
            user_info = User.query.filter_by(user_id = user_id).first()
            if user_info is None:
                flash('ユーザIDが違います。', 'error')
            elif not user_info.password == request.form.get('password'):
                flash('パスワードが違います。', 'error')
            else:
                session['logged_in'] = True
                session['user_table_id'] = user_info.id
                session['user_id'] = user_info.user_id
                session['name'] = user_info.name
                session['undergraduate'] = user_info.undergraduate
                flash('ログインしました。', 'success')
                flash('ようこそ'+session['name']+'さん！', 'success')
                return top(session.get('name'), session.get('undergraduate'))
        except ValueError:
            flash('適切なユーザIDを入力してください', 'error')
    return render_template('login/login.html')

#ログアウト
@blueprint.route('/logout')
def logout():
    session.pop('logged_in', None)
    session.clear()
    flash('ログアウトしました。', 'success')
    return redirect(url_for('login'))
