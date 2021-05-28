from lib.db import db

class History(db.Model):

    __tablename__ = 'histories'

    id = db.Column(db.Integer, primary_key=True)
    book_id = db.Column(db.Integer, db.ForeignKey('books.id'))
    title = db.relationship('book', backref='history', uselist=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    name = db.relationship('user', backref='history', uselist=False)
    datetime = db.Column(db.Date, nullable=False)

    def __init__(self, book_id, user_id, datetime):
        self.book_id = book_id
        self.user_id = user_id
        self.datetime = datetime.today()
    

