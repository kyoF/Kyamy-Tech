from functools import wraps

from flask import render_template, request, url_for, session, redirect, flash, Blueprint

#ログインチェック処理
def login_check(view):
    @wraps(view)
    def inner(*args, **kwargs):
        if not session.get('logged_in'):
            flash('ログインしてください。', 'error')  #ログインしないまま操作したときのflash
            return redirect(url_for('login.login'))
        return view(*args, **kwargs)
    return inner