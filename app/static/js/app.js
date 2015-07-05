(function () {
    'use strict';

    var app = angular.module('drqApp', []);

    app.controller('FormController', ['$scope', '$element', '$http', '$log', function ($scope, $element, $http, $log) {
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
            qty: 40,
            name: '40 questions'
        }];

        $scope.checkAllowed = false;
        $scope.restartQuiz = false;
        $scope.questions = null;
        $scope.srcImg = null;
        $scope.inputDisabled = false;
        $scope.checkDisabled = false;
        $scope.rightAnswers = 0;
        $scope.numberOfCorrectAnswers = 0;

        function reset() {
            $scope.questions = null;
            $scope.inputDisabled = false;
            $scope.checkDisabled = false;
            $scope.numberOfCorrectAnswers = 0;

        }

        this.getQuestions = function (numberOfQuestions) {
            $scope.restartQuiz = true;
            $scope.checkAllowed = true;
            $http
                .get('/questions/' + numberOfQuestions)
                .success(function (data) {
                    reset();
                    var jsonData = angular.fromJson(data);
                    $scope.questions = jsonData.questions;
                    $scope.questionsToShow = true;
                });
        };

        this.check = function () {
            $scope.inputDisabled = true;
            $scope.checkDisabled = true;
            var questions = $scope.questions;
            $http.post('/check', {result: questions})
                .success(function (data) {
                    var jsonData = angular.fromJson(data);
                    $scope.questions = jsonData.result;
                    $scope.numberOfCorrectAnswers = $scope.calculateCorrectAnswers(jsonData.result);
                });

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

    }]);

})();

