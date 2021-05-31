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
    try:
        db.session.add(user)    #不備があった際の例外処理
        db.session.commit()
    except:
        flash('入力した情報を再度確認してください', 'error')
        # return redirect(url_for('sign_up'))
        return render_template('signup/signup.html')


    flash('アカウントが作成されました', 'success')
    # return redirect(url_for('signup'))
    return render_template('login/login.html')    
