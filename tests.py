import unittest
import json

from flask_testing import LiveServerTestCase

from app.views import QuestionList
from app.models import Question, Answer

json_string = """
{
  "result": [
    {
      "answers": [
        {
          "answer": "unnecessarily abuse the vehicle's charging system",
          "id": 1217
        },
        {
          "answer": "unnecessarily abuse the vehicle's electrical system",
          "id": 1218
        },
        {
          "answer": "significantly reduce the chances of an accident because your vehicle is easier to see",
          "id": 1219
        },
        {
          "answer": "none of the above",
          "id": 1220
        }
      ],
      "id": 305,
      "question": "By using your headlights during the daytime, you will:",
      "answer": 1218
    }
  ]
}
"""


class TestQuestionList(unittest.TestCase):
    def setUp(self):
        self.question_list = QuestionList()

    def prepare_questions(self):
        questions_unsigned = []
        questions_signed = []
        for i in range(100):
            q_unsigned = Question(id=i, real_id=i, signed=False, question='This is question ' + str(i))
            questions_unsigned.append(q_unsigned)
        for i in range(100):
            q_signed = Question(id=i, real_id=i, signed=True, sign_name='TestSignName' + str(i),
                                question='This is question ' + str(i))
            questions_signed.append(q_signed)
        return questions_signed, questions_unsigned

    def prepare_answers(self):
        answers = []
        for i in range(4):
            answer = Answer(id=i, question_id=i, is_correct_answer=False, answer='This is answer ' + str(i))
            answers.append(answer)
        return answers

    def test_define_qty(self):
        defined5 = self.question_list.define_qty(5)
        defined10 = self.question_list.define_qty(10)
        defined20 = self.question_list.define_qty(20)
        defined30 = self.question_list.define_qty(30)
        defined40 = self.question_list.define_qty(40)
        self.assertTrue(defined5[0] == 1 and defined5[1] == 4)
        self.assertTrue(defined10[0] == 4 and defined10[1] == 6)
        self.assertTrue(defined20[0] == 7 and defined20[1] == 13)
        self.assertTrue(defined30[0] == 10 and defined30[1] == 20)
        self.assertTrue(defined40[0] == 12 and defined40[1] == 28)

    def test_generate_random_numbers(self):
        count = 100
        qty = 10
        random_list = self.question_list.generate_random_numbers(count, qty)
        self.assertTrue(type(random_list) is list)
        self.assertEquals(len(random_list), 10)

    def test_get_questions(self):
        prepared_questions = self.prepare_questions()
        question_list = self.question_list.get_questions(20, (100, 100), prepared_questions)
        self.assertEquals(len(question_list), 20)
        self.assertIsInstance(question_list[10], Question)

    def test_create_json_from_questions(self):
        prepared_questions = self.prepare_questions()
        question_list = self.question_list.get_questions(10, (100, 100), prepared_questions)
        created_json = self.question_list.create_json_from_questions(question_list)
        self.assertIsInstance(created_json, dict)
        self.assertEquals(len(created_json['questions']), 10)

    def test_prepare_questions(self):
        prepared_questions = self.prepare_questions()
        question_list = self.question_list.get_questions(10, (100, 100), prepared_questions)
        answers_from_db = self.prepare_answers()
        question = self.question_list.prepare_questions(question_list[0], answers_from_db)
        self.assertEquals(len(question), 3)
        self.assertEquals(len(question['answers']), 4)
        self.assertEquals(question['answers'][2]['answer'], 'This is answer 2')
        self.assertEquals(question['answers'][2]['id'], 2)


from app import app


class TestView(unittest.TestCase):
    def setUp(self):
        self.app = app
        self.client = self.app.test_client()

    def test_get_questions(self):
        response = self.client.get("/questions/5")
        json_data = json.loads(response.data)
        self.assertEquals(len(json_data['questions']), 5)
        self.assertEquals(response.headers['Content-Type'], 'application/json')

    def test_check_answers(self):
        headers = [('Content-Type', 'application/json')]
        response = self.client.post('/check', data=json_string, headers=headers)
        self.assertEquals(response.status_code, 200)
        response_result = json.loads(response.data)
        self.assertEquals(len(response_result['result']), 1)
        self.assertEquals(response_result['result'][0]['correct'], False)
        self.assertEquals(response_result['result'][0]['correct_answer'], 1219)


import urllib2


class TestServerLive(LiveServerTestCase):
    def create_app(self):
        self.application = app
        app.config['TESTING'] = True
        return self.application

    def test_server_live_and_run(self):
        response = urllib2.urlopen(self.get_server_url())
        self.assertEquals(response.code, 200)


if __name__ == '__main__':
    unittest.main()
