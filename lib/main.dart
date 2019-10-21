//importing needed classes for the app
import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//main method goes here
// void main() {
//   runApp(MyApp());
// }
void main() => runApp(MyApp());

//implementing class for widgets
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your name?',
      'answers': [
        {'text': 'Chinaza', 'score': 10},
        {'text': 'Max', 'score': 8},
        {'text': 'Placid', 'score': 3},
        {'text': 'Mary', 'score': 5}
      ],
    },
    {
      'questionText': 'What\' your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 7},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 3}
      ],
    },
    {
      'questionText': 'What\' your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 8},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 5}
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print('we have more questions');
    }
  }

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          backgroundColor: Colors.redAccent,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
