import random
import json

from flask import request, send_file

from flask_restful import Resource, reqparse

from app import app
from app.models import Question, Answer


@app.route('/', methods=['GET'])
@app.route('/index', methods=['GET'])
@app.route('/index.html', methods=['GET'])
def index():
    return send_file('templates/index.html')


class QuestionList(Resource):
    def get(self, question_number):
        question_list = []
        questions = self.get_questions(question_number)
        for question in questions:
            question_list.append(self.add_answers(question))
        return json.dumps({"questions": question_list})

    def add_answers(self, question):
        answers_from_db = Answer.query.filter_by(question_id=question.id).all()
        answers = []
        for answer in answers_from_db:
            answers.append({"id": answer.id, "answer": answer.answer})

        question_to_return = {"id": question.id, "question": question.question}

        if question.signed:
            question_to_return['signed'] = question.signed
            question_to_return['sign'] = question.sign_name

        question_to_return["answers"] = answers

        return question_to_return

    def get_questions(self, number):
        questions = []
        signed_qty, usual_qty = self.define_qty(number)
        signed_count = Question.query.filter_by(signed=True).count()
        usual_count = Question.query.filter_by(signed=False).count()
        signed_questions = Question.query.filter_by(signed=True).all()
        usual_questions = Question.query.filter_by(signed=False).all()
        random_numbers_signed = [random.randint(1, signed_count) for r in range(signed_qty)]
        random_numbers_usual = [random.randint(1, usual_count) for r in range(usual_qty)]
        for number in random_numbers_usual:
            questions.append(usual_questions[number - 1])
        for number in random_numbers_signed:
            questions.append(signed_questions[number - 1])
        return questions

    def define_qty(self, number):
        signed_qty, usual_qty = 0, 0
        if number == 5:
            signed_qty, usual_qty = 1, 4
        elif number == 10:
            signed_qty, usual_qty = 4, 6
        elif number == 20:
            signed_qty, usual_qty = 7, 13
        elif number == 40:
            signed_qty, usual_qty = 10, 30
        return signed_qty, usual_qty


class Check(Resource):
    def __init__(self):
        self.parser = reqparse.RequestParser()
        self.parser.add_argument('result')

    def post(self):
        result = request.json
        return self.check_answers(result)

    def check_answers(self, result):
        for question in result['result']:
            if 'answer' in question:
                question_id = question['id']
                answer_id = int(question['answer'])
                correct_answer = Answer.query.filter_by(question_id=question_id, is_correct_answer=True).first()
                question['correct_answer'] = correct_answer.id
                if answer_id == correct_answer.id:
                    question['correct'] = True
                else:
                    question['correct'] = False
        return result
