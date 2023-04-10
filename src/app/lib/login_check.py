from flask import url_for, session, redirect, flash
from functools import wraps


def login_check(view):
    @wraps(view)
    def inner(*args, **kwargs):
        if not session.get('logged_in'):
            #ログインしないまま操作したときのflash
            flash('ログインしてください。', 'error')
            return redirect(url_for('account.login'))
        return view(*args, **kwargs)
    return inner