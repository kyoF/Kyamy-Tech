from flask import render_template, session, Blueprint
from sqlalchemy.sql import text

from database import db
from lib.login_check import login_check


blueprint = Blueprint('top', __name__)

@blueprint.route('/')
@login_check
def show_top(name, undergraduate):
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

@blueprint.route('/back')
@login_check
def back_top():
    undergraduate = session.get('undergraduate')
    gakubu_search_result = list(db.session.execute(t, {'undergraduate':undergraduate}))
    return render_template('top.html', name=session.get('name'), undergraduate=undergraduate, ranking=gakubu_search_result)
