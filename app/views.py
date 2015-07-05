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
        questions_count = self.get_questions_count()
        questions_fromdb = self.get_questions_from_db()
        questions = self.get_questions(question_number, questions_count, questions_fromdb)
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

    def get_questions(self, number, questions_count, questions_fromdb):
        signed_qty, usual_qty = self.define_qty(number)
        signed_count, usual_count = questions_count
        signed_questions, usual_questions = questions_fromdb
        random_numbers_signed = self.generate_random_numbers(signed_count, signed_qty)
        random_numbers_usual = self.generate_random_numbers(usual_count, usual_qty)
        questions = []
        for number in random_numbers_usual:
            questions.append(usual_questions[number - 1])
        for number in random_numbers_signed:
            questions.append(signed_questions[number - 1])
        return questions

    def generate_random_numbers(self, count, qty):
        return random.sample(range(1, count + 1), qty)

    def get_questions_count(self):
        return Question.query.filter_by(signed=True).count(), Question.query.filter_by(signed=False).count()

    def get_questions_from_db(self):
        return Question.query.filter_by(signed=True).all(), Question.query.filter_by(signed=False).all()

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
