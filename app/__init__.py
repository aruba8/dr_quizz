from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_script import Manager
from flask_migrate import Migrate, MigrateCommand
from flask_restful import Api

app = Flask(__name__, static_folder='static')
app.config.from_object('config')
api = Api(app)

db = SQLAlchemy(app)
migrate = Migrate(app, db)
manager = Manager(app)
manager.add_command('db', MigrateCommand)

from views import index
from views import QuestionList, Check

api.add_resource(QuestionList, '/questions/<int:question_number>')
api.add_resource(Check, '/check')