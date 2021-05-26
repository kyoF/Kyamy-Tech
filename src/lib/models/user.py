from lib.db import db

class User(db.Model):

    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64), nullable=False)
    password = db.Column(db.String(64), nullable=False)
    graduate = db.Column(db.String(64), nullable=False)
    underguraduate = db.Column(db.String(64), nullable=False)

    def __init__(self, name, password, graduate, underguraduate):
        self.name = name
        self.password = password
        self.graduate = graduate
        self.underguraduate = underguraduate
