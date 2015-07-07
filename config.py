import os

basedir = os.path.abspath(os.path.dirname(__file__))

DB_HOST = os.getenv('DB_PORT_5432_TCP_ADDR')
DB_PORT = os.getenv('DB_PORT_5432_TCP_PORT')

CSRF_ENABLED = True
SECRET_KEY = 'you-will-never-guess'
SQLALCHEMY_DATABASE_URI = 'postgresql://dr_quiz_db:dr_quiz_db@'+DB_HOST+':'+DB_PORT+'/dr_quiz_db'
SQLALCHEMY_MIGRATE_REPO = os.path.join(basedir, 'db_repository')