from selenium.webdriver import Firefox
from selenium.webdriver.support.ui import Select
from selenium.common.exceptions import NoSuchElementException
from app.models import Question, Answer
from app import db
import urllib


class Scrap:
    driver = Firefox()
    url = 'http://apps.mpi.mb.ca/dr_quiz/StartDrivingQuiz.asp'
    questions = {}

    def scrap(self):
        self.driver.get(self.url)
        select = Select(self.driver.find_element_by_xpath("//select[@name='noQue']"))
        select.select_by_value('20')
        self.driver.find_element_by_xpath('//input[@value="Start Quiz"]').click()
        table1 = self.driver.find_element_by_xpath('//form/table[1]')
        table2 = self.driver.find_element_by_xpath('//form/table[2]')
        self.parse_table1(table1)
        self.parse_table2(table2)

        self.check_every_second(table1)
        self.check_every_second(table2)

        self.driver.find_element_by_xpath("//input[@type='Button' and @name='Submit']").click()
        table = self.driver.find_element_by_xpath('//table[2]')
        print '#################'
        self.parse_table(table)
        self.questions = {}
        self.driver.quit()

    def parse_table1(self, table):
        rows = table.find_elements_by_xpath('.//tr')
        i = 0
        j = 0
        q = None
        for r in range(len(rows)):
            a = Answer()
            if i == 5:
                i = 0
                q = None
                continue
            if i == 0:
                real_id = int(rows[r].find_element_by_xpath('.//input').get_attribute('value'))
                question = rows[r].find_element_by_xpath('.//td[2]/strong').text
                q = Question.query.filter_by(real_id=real_id).first()
                if q is None:
                    q = Question()
                    q.real_id = real_id
                    q.question = question
                    db.session.add(q)
                    db.session.commit()
                self.questions[j] = q
            elif i == 1 or i == 2 or i == 3 or i == 4:

                if q is not None:
                    answers = Answer.query.filter_by(question_id=q.id).all()
                    if len(answers) < 4:
                        answer = rows[r].find_element_by_xpath('.//td[4]').text
                        a.answer = answer
                        a.question_id = q.id
                        db.session.add(a)
                        db.session.commit()
                if i == 4:
                    j += 1
            i += 1

    def parse_table2(self, table):
        rows = table.find_elements_by_xpath('.//tr')
        i = 0
        j = 13
        q = None
        for r in range(len(rows)):
            a = Answer()
            if i == 5:
                i = 0
                q = None
                continue
            if i == 0:
                real_id = int(rows[r].find_element_by_xpath('.//input').get_attribute('value'))
                question = rows[r].find_element_by_xpath('.//td[2]/strong').text
                q = Question.query.filter_by(real_id=real_id).first()
                if q is None:
                    q = Question()
                    q.real_id = real_id
                    q.question = question
                    db.session.add(q)
                    db.session.commit()
                self.questions[j] = q
            elif i == 1 or i == 2 or i == 3 or i == 4:
                if q is not None:
                    answers = Answer.query.filter_by(question_id=q.id).all()
                    if len(answers) < 4:
                        if i == 1:
                            q.sign_name = self.save_sign(q.real_id)
                            q.signed = True
                            db.session.add(q)
                            db.session.commit()

                        answer = rows[r].find_element_by_xpath('.//td[4]').text
                        a.answer = answer
                        a.question_id = q.id
                        db.session.add(a)
                        db.session.commit()
                if i == 4:
                    j += 1
            i += 1

    def parse_table(self, table):
        rows = table.find_elements_by_xpath('.//tr')
        i = 0
        j = 0
        q = None
        for r in range(len(rows)):

            if self.is_element_present(rows[r], './/td//hr'):
                i = 0
                continue
            if i == 0:
                # question_text = rows[r].find_element_by_xpath('.//td[2]').text
                # q = Question.query.filter_by(question=question_text).first()
                q = self.questions[j]
            elif i == 1 or i == 2 or i == 3 or i == 4:
                if self.is_element_present(rows[r], './/td[4]/img[contains(@src, "checkmark2.gif")]'):
                    answer_text = rows[r].find_element_by_xpath('.//td[4]').text
                    a = Answer.query.filter_by(question_id=q.id, answer=answer_text).first()

                    a.is_correct_answer = True
                    db.session.add(a)
                    db.session.commit()
                if i == 4:
                    j += 1
            i += 1

    def check_every_second(self, table):
        rows = table.find_elements_by_xpath('.//tr')
        i = 0
        for r in range(len(rows)):
            if i == 5:
                i = 0
                continue
            if i == 2:
                rows[r].find_element_by_xpath('.//input[@type="radio"]').click()
            i += 1

    def save_sign(self, question_real_id):
        number = str(question_real_id)
        with open('signs/RoadSign_'+number+'.gif', 'wb') as f:
            f.write(urllib.urlopen('http://apps.mpi.mb.ca/images/DriveQuiz/Class5/RoadSign_'+number+'.gif').read())
            f.close()
        return 'RoadSign_'+number+'.gif'

    def is_element_present(self, elem, xpath):
        try:
            elem.find_element_by_xpath(xpath)
        except NoSuchElementException:
            return False
        return True

def check():
    qs = Question.query.all()
    ass = Answer.query.all()
    print "Questions", len(qs)
    print "Answers", len(ass)
    scrap = Scrap()
    scrap.scrap()
    qs2 = Question.query.all()
    ass2 = Answer.query.all()
    a = len(qs2)
    b = len(ass2)
    print "Questions", a
    print "Answers", b
    if b/a != 4:
        print("WARN!!!!")
    else:
        print("OK")


if __name__ == '__main__':
    check()
