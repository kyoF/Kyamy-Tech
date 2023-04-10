from flask import render_template, request, session, Blueprint

from models import Book
from database import db
from views import account, search


blueprint = Blueprint('details', __name__)

@blueprint.route('/<string:id>', methods=['POST'])
def show_details(id):
    book_info = Book.query.get(id)
    global before_url
    before_url = request.referrer
    return render_template('details/details.html', book_info=book_info)

@blueprint.route('/back')
def back_before_url():
    judge = before_url[(before_url.rfind('/')):]
    if judge == '/' or judge == '/back':
        undergraduate = session.get('undergraduate')
        ranking = list(db.session.execute(account.t, {'undergraduate':undergraduate}))
        return render_template('top.html', name=session.get('name'), undergraduate=undergraduate, ranking=ranking)
    else:
        return render_template('search/result.html', categories=search.categories)
