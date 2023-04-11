from database import db


class Book(db.Model):
    __tablename__ = 'books'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(64), nullable=False)
    category = db.Column(db.String(64), nullable=False)
    name = db.Column(db.String(64), nullable=False)
    place = db.Column(db.String(64), nullable=False)
    keizai = db.Column(db.Integer)
    hougaku = db.Column(db.Integer)
    rigaku = db.Column(db.Integer)
    kougaku = db.Column(db.Integer)
    bungaku = db.Column(db.Integer)
    igaku = db.Column(db.Integer)

    def __init__(self, title, category, name, place, keizai, hougaku, rigaku, kougaku, bungaku, igaku):
        self.title = title
        self.category = category
        self.name = name
        self.place = place
        self.keizai = keizai
        self.hougaku = hougaku
        self.rigaku = rigaku
        self.kougaku = kougaku
        self.bungaku = bungaku
        self.igaku = igaku
