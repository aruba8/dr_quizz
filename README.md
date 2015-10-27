[![Build Status](https://travis-ci.org/biomaks/dr_quizz.svg?branch=master)](https://travis-ci.org/biomaks/dr_quizz)
# dr_quizz v0.05

### REST API:


#### Get questions:

`<number>` can be `5, 10, 20, 30, 35, 40`

request:
```HTTP
GET /questions/<number> HTTP/1.1
User-Agent: MyClient/1.0.0
Host: drquiz.zapto.org
```

response:
```HTTP
HTTP/1.1 200 OK
Content-Type: application/json
```
```JSON
{
  "questions": [
    {
      "question": "If your ability to drive is impaired by alcohol, you should know that:",
      "id": 53,
      "answers": [
        {
          "answer": "you can drive better",
          "id": 209
        },
        {
          "answer": "you'll have to drive slower",
          "id": 211
        },
        {
          "answer": "all of the above",
          "id": 212
        },
        {
          "answer": "a charge of impaired driving can be laid regardless of what level of ",
          "id": 210
        }
      ]
    },
    ...
    ...
    ...
  ]
}
```

#### Check questions:

to check question you should add field `answer` with value of chosen answer id to every question, and send back post request as :

```JSON
{
  "result": [
    {
      "question": "In Manitoba, to act as a supervising driver for a new Class 5 driver, a driver must be fully licenced in Class 5 for what period of time?",
      "id": 147,
      "answers": [
        {
          "answer": "5 years",
          "id": 585,
        },
        {
          "answer": "2 years",
          "id": 587,
        },
        {
          "answer": "1 year",
          "id": 588,
        },
        {
          "answer": "3 years",
          "id": 586,
        }
      ],
      "answer": "586"
    },
    ...
    ...
    ...
  ]
}
```

if answer on question is correct than question will have field `correct: true` and `correct_answer: 160`, otherwise only `correct: false`

request:
```HTTP
POST /check HTTP/1.1
User-Agent: MyClient/1.0.0
Host: drquiz.zapto.org
```

response:
```HTTP
HTTP/1.1 200 OK
Content-Type: application/json
```

```JSON
{
  "result": [
    {
      "correct": true,
      "correct_answer": 160,
      "id": 40,
      "question": "An inattentive driver:",
      "answer": "160",
      "answers": [
        {
          "answer": "daydreams or gazes at objects off the roadway while driving",
          "id": 157
        },
        ...
        ...
        ...
      ],   
    },
    ...
    ...
    ...
  ]
}
```




###For frontend development:

in `frontend` directory:

* `npm install`
* `bower i`
* `gulp watch`

###Possible issues:


If your node version is 4 and you are using gulp-sass, then try

```
npm uninstall --save-dev gulp-sass

npm install --save-dev gulp-sass@2
```




