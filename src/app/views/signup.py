from flask import render_template, request, flash, Blueprint

from models import User
from database import db


blueprint = Blueprint('signup', __name__)

@blueprint.route('/')
def sign_up():
    return render_template('signup/signup.html')

@blueprint.route('/', methods=['POST'])
def create():
    user = User(
        name=request.form.get('name'),
        user_id=request.form.get('user_id'),
        password=request.form.get('password'),
        graduate=request.form.get('graduate'),
        undergraduate=request.form.get('undergraduate'),
    )
    if User.query.filter(User.user_id == user.user_id).all():
        flash('これはすでに登録されているIDです', 'error')
        return render_template('signup/signup.html')
    elif not user.name:
        flash('名前を入力してください', 'error')
        return render_template('signup/signup.html')
    elif not user.user_id:
        flash('ユーザIDを入力してください', 'error')
        return render_template('signup/signup.html')
    elif not user.password:
        flash('パスワードを入力してください', 'error')
        return render_template('signup/signup.html')
    else:
        try:
            db.session.add(user)
            db.session.commit()
        except:
            flash('入力した情報を再度確認してください', 'error')
            return render_template('signup/signup.html')
        flash('アカウントが作成されました', 'success')
        return render_template('account/login.html')    
