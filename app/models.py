from . import db

class Question(db.Model):
    __tablename__ = 'question'
    id = db.Column(db.Integer, primary_key=True)
    real_id = db.Column(db.Integer, nullable=False)
    signed = db.Column(db.Boolean, default=False)
    sign_name = db.Column(db.String(length=100))
    question = db.Column(db.String(length=1000))


class Answer(db.Model):
    __tablename__ = 'answer'
    id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, db.ForeignKey('question.id'))
    answer = db.Column(db.String(length=1000))
    is_correct_answer = db.Column(db.Boolean, default=False)