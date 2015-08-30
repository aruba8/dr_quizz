(function () {
    'use strict';

    var app = angular.module('drqApp', []);

    app.controller('FormController', ['$scope', '$anchorScroll', '$http', '$log', function ($scope, $anchorScroll, $http, $log) {

        $scope.checkAllowed = false;
        $scope.restartQuiz = false;
        $scope.questions = null;
        $scope.inputDisabled = false;
        $scope.checkDisabled = false;
        $scope.rightAnswers = 0;
        $scope.numberOfCorrectAnswers = 0;
        $scope.showDialog = false;
        $scope.phrase = null;
        $scope.questionsLoading = false;
        $scope.resultsLoading = true;


        this.opts = [{
            qty: 5,
            name: '5 questions'
        }, {
            qty: 10,
            name: '10 questions'
        }, {
            qty: 20,
            name: '20 questions'
        }, {
            qty: 30,
            name: '30 questions'
        }, {
            qty: 35,
            name: '35 questions'
        }, {
            qty: 40,
            name: '40 questions'
        }];


        function reset() {
            $scope.questions = null;
            $scope.inputDisabled = false;
            $scope.checkDisabled = false;
            $scope.numberOfCorrectAnswers = 0;
            $scope.showDialog = false;
            $scope.phrase = null;
            $scope.questionsLoading = false;
            $scope.resultsLoading = true;

        }

        this.getQuestions = function (numberOfQuestions) {
            $scope.restartQuiz = true;
            $scope.checkAllowed = true;
            $scope.questionsLoading = true;
            $scope.questionsToShow = false;

            $http
                .get('/questions/' + numberOfQuestions)
                .success(function (data) {
                    reset();
                    var jsonData = angular.fromJson(data);
                    $scope.questions = jsonData.questions;
                    $scope.questionsToShow = true;
                    $scope.questionsLoading = false;
                });
        };

        this.check = function () {
            $scope.inputDisabled = true;
            $scope.checkDisabled = true;
            var questions = $scope.questions;
            $http.post('/check', {result: questions})
                .success(function (data) {
                    $scope.questions = data.result;
                    $scope.numberOfCorrectAnswers = $scope.calculateCorrectAnswers(data.result);
                    $scope.setPhrase();
                    $scope.resultsLoading = false;

                });
            $anchorScroll();
            $scope.showDialog = true;
        };

        $scope.calculateCorrectAnswers = function (questions) {
            var counter = 0;
            for (var i = 0; i < questions.length; i++) {
                if (questions[i].hasOwnProperty('correct') && questions[i].correct == true) {
                    counter = counter + 1;
                }
            }
            return counter;
        };

        this.closeDialog = function () {
            $scope.showDialog = false;
        };

        $scope.setPhrase = function () {
            var result = $scope.numberOfCorrectAnswers / $scope.numberOfQuestions;
            if (result == 1) {
                $scope.phrase = 'Excellent!';
            } else if (result < 1 && result >= 0.9) {
                $scope.phrase = 'Good!';

            } else if (result < 0.9) {
                $scope.phrase = 'Ok. I think you can better than this. Try again!';
            }
        };

        $scope.init = function () {
            var date = new Date();
            $scope.currentYear = date.getFullYear();
        };

    }]);

})();

