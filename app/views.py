import random
from flask import request, send_file, jsonify

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
        questions_count = self.get_questions_count()
        questions_fromdb = self.get_questions_from_db()
        questions = self.get_questions(question_number, questions_count, questions_fromdb)
        json_with_questions = self.create_json_from_questions(questions)
        return jsonify(json_with_questions)

    def create_json_from_questions(self, questions):
        question_list = []
        for question in questions:
            answers_from_db = self.get_answers_by_question_id(question.id)
            question_list.append(self.prepare_questions(question, answers_from_db))
        return {"questions": question_list}

    def prepare_questions(self, question, answers_from_db):
        answers = []
        for answer in answers_from_db:
            answers.append({"id": answer.id, "answer": answer.answer})

        question_to_return = {"id": question.id, "question": question.question}

        if question.signed:
            question_to_return['signed'] = question.signed
            question_to_return['sign'] = question.sign_name

        question_to_return["answers"] = answers

        return question_to_return

    def get_answers_by_question_id(self, question_id):
        return Answer.query.filter_by(question_id=question_id).order_by(Answer.id).all()

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
        elif number == 30:
            signed_qty, usual_qty = 10, 20
        elif number == 40:
            signed_qty, usual_qty = 12, 28
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
