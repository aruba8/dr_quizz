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

        function reset() {
            $scope.questions = null;
            $scope.inputDisabled = false;

        }

        this.getQuestions = function (numberOfQuestions) {
            $scope.restartQuiz = true;
            $scope.checkAllowed = true;
            $http
                .post('/questions', {number: numberOfQuestions})
                .success(function (data) {
                    reset();
                    $scope.questions = data;
                });
        };

        this.check = function () {
            $log.debug($scope.questions);
            $scope.inputDisabled = true;
            var questions = $scope.questions;
            $http.post('/check', {result: questions}).success(function (data) {
                $log.debug(data);
            });

        }

    }]);

})();

