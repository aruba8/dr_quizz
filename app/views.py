import random
import json

from flask import request, send_file, jsonify, Response
import logging

from app import app
from app.models import Question, Answer


@app.route('/', methods=['GET'])
@app.route('/index', methods=['GET'])
@app.route('/index.html', methods=['GET'])
def index():
    return send_file('templates/index.html')


@app.route('/questions', methods=['POST'])
def questions_route():
    if request.json:
        data = []
        number = request.json['number']
        questions = get_questions(number)
        for question in questions:
            data.append(add_answers(question))
        return json.dumps(data)


@app.route('/check', methods=['POST'])
def check_route():
    result = request.json
    logging.debug(request.json)

    return Response(jsonify(check_answers(request.json)))

def check_answers(result):
    res = result
    for question in result['result']:
        question_id = question['id']
        answer_id = int(question['answer'])
        correct_answer = Answer.query.filter_by(question_id=question_id, is_correct_answer=True).first()
        if answer_id == correct_answer.id:
            question['correct'] = True
        else:
            question['correct'] = False

    return result



def add_answers(question):
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


def get_questions(number):
    questions = []
    signed_qty, usual_qty = define_qty(number)
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


def define_qty(number):
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
