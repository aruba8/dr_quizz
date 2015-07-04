import unittest
from app.views import QuestionList, Check

class TestQuestionList(unittest.TestCase):

    def setUp(self):
        self.question_list = QuestionList()

    def test_define_qty(self):
        defined5 = self.question_list.define_qty(5)
        defined10 = self.question_list.define_qty(10)
        defined20 = self.question_list.define_qty(20)
        defined40 = self.question_list.define_qty(40)
        self.assertTrue(defined5[0] == 1 and defined5 [1] == 4)
        self.assertTrue(defined10[0] == 4 and defined10 [1] == 6)
        self.assertTrue(defined20[0] == 7 and defined20 [1] == 13)
        self.assertTrue(defined40[0] == 10 and defined40 [1] == 30)

class TestCheck(unittest.TestCase):

    def setUp(self):
        self.check = Check()


if __name__ == '__main__':
    unittest.main()
