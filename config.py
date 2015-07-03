import os

basedir = os.path.abspath(os.path.dirname(__file__))

DEBUG = False
TESTING = False

CSRF_ENABLED = True
SECRET_KEY = 'you-will-never-guess'
SQLALCHEMY_DATABASE_URI = 'postgresql://dr_quiz_db:dr_quiz_db@localhost:5432/dr_quiz_db'
SQLALCHEMY_MIGRATE_REPO = os.path.join(basedir, 'db_repository')