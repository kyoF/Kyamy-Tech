from flask import render_template, request, url_for, session, redirect, flash, Blueprint

# from ..app import app

from functools import wraps

from database import db
from models import User, Book

from sqlalchemy.sql import text

app = Blueprint('', __name__)

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
@app.route('/', methods=['GET', 'POST'])
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
@app.route('/logout')
def logout():
    session.pop('logged_in', None)
    session.clear()
    flash('ログアウトしました。', 'success')
    return redirect(url_for('login'))

@app.route('/top')
@login_check
def top(name, undergraduate):
    global t
    t = text("\
        select b.id, b.title, b.name, b.category \
        from histories h \
            inner join books b \
                on h.book_id = b.id \
        where h.user_id in ( \
            select u.id \
            from users u \
            where u.undergraduate = :undergraduate)  \
        and h.datetime between current_date - integer '30' and current_date \
        group by b.id, b.title, b.name, b.category  \
        order by count(h.*) desc \
        limit (10) offset (0); \
    ")
    gakubu_search_result = list(db.session.execute(t, {'undergraduate':undergraduate}))
    if gakubu_search_result == []:
        if undergraduate=='経済学部':
            t = text("select id, title, name, category from books order by keizai limit(10);")
            gakubu_search_result = list(db.session.execute(t, {'undergraduate':undergraduate}))
        elif undergraduate=='法学部':
            t = text("select id, title, name, category from books order by hougaku limit(10);")
            gakubu_search_result = list(db.session.execute(t, {'undergraduate':undergraduate}))
        elif undergraduate=='理学部':
            t = text("select id, title, name, category from books order by rigaku limit(10);")
            gakubu_search_result = list(db.session.execute(t, {'undergraduate':undergraduate}))
        elif undergraduate=='工学部':
            t = text("select id, title, name, category from books order by kougaku limit(10);")
            gakubu_search_result = list(db.session.execute(t, {'undergraduate':undergraduate}))
        elif undergraduate=='文学部':
            t = text("select id, title, name, category from books order by bungaku limit(10);")
            gakubu_search_result = list(db.session.execute(t, {'undergraduate':undergraduate}))
        elif undergraduate=='医学部':
            t = text("select id, title, name, category from books order by igaku limit(10);")
            gakubu_search_result = list(db.session.execute(t, {'undergraduate':undergraduate}))
        else:
            t = text("select id, title, name, category from books limit(10);")
            gakubu_search_result = list(db.session.execute(t, {'undergraduate':undergraduate}))
    return render_template('top.html', name=name, undergraduate=undergraduate, ranking=gakubu_search_result)

@app.route('/return_top')
@login_check
def return_top():
    undergraduate = session.get('undergraduate')
    gakubu_search_result = list(db.session.execute(t, {'undergraduate':undergraduate}))
    return render_template('top.html', name=session.get('name'), undergraduate=undergraduate, ranking=gakubu_search_result)
