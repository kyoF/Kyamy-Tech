from database import db


class User(db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.String(64), nullable=False)
    name = db.Column(db.String(64), nullable=False)
    password = db.Column(db.String(64), nullable=False)
    graduate = db.Column(db.Integer, nullable=False)
    undergraduate = db.Column(db.String(64), nullable=False)

    def __init__(self, user_id, name, password, graduate, undergraduate):
        self.user_id = user_id
        self.name = name
        self.password = password
        self.graduate = graduate
        self.undergraduate = undergraduate
