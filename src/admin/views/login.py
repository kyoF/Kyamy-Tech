from flask import render_template, request, url_for, session, redirect, flash

from admin import app

from functools import wraps

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
        if request.form.get('user_id') != app.config['USER_ID']:
            flash('ユーザIDが違います。', 'error')
        elif request.form.get('password') != app.config['PASSWORD']:
            flash('パスワードが違います。', 'error')
        else:
            session['logged_in'] = True
            flash('ログインしました。', 'success')
            return redirect(url_for('top'))
    return render_template('login/login.html')

#ログアウト
@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    print('ログアウトしました。')
    return redirect(url_for('login'))

@app.route('/top')
@login_check
def top():
    return render_template('top.html')