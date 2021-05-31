from flask import render_template, request, url_for, session, redirect, flash, Blueprint

from lib.models import User

from lib.db import db

from functools import wraps

signup = Blueprint('signup', __name__)

@signup.route('/')
def sign_up():
    return render_template('signup/signup.html')

#新規登録処理

@signup.route('/complete', methods=['POST'])
def create():
    user = User(
        name=request.form.get('name'),
        user_id=request.form.get('user_id'),
        password=request.form.get('password'),
        graduate=request.form.get('graduate'),
        undergraduate=request.form.get('undergraduate'),
    )
    test =  User.query.filter(User.user_id == user.user_id).all()
    print(test)
    if User.query.filter(User.user_id == user.user_id).all():
        flash('これはすでに登録されているIDです', 'error')
        return render_template('signup/signup.html')
    else:
        try:
            db.session.add(user)    #不備があった際の例外処理
            db.session.commit()
        except:
            flash('入力した情報を再度確認してください', 'error')
            return render_template('signup/signup.html')
        flash('アカウントが作成されました', 'success')
        return render_template('login/login.html')    