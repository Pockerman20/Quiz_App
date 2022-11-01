import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() => runApp(MyApp());
void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  //in question by using MAP
  final _questions = const [
    {
      'questionText': 'What\'s your favourite number?',
      'answer': [
        {'text': 'Three', 'score': 10},
        {'text': 'Eighteen', 'score': 7},
        {'text': 'Twenty', 'score': 4},
        {'text': 'Seven', 'score': 2},
      ],
    },
    {
      'questionText': 'What\'s your favourite food?',
      'answer': [
        {'text': 'Chicken Biryani', 'score': 4},
        {'text': 'Pav Bhaji', 'score': 7},
        {'text': 'Rasam Chawal', 'score': 10},
        {'text': 'Litti Chokha', 'score': 2},
      ],
    },
    {
      'questionText': 'What\'s your favourite color?',
      'answer': [
        {'text': 'Green', 'score': 7},
        {'text': 'Blue', 'score': 10},
        {'text': 'Orange', 'score': 2},
        {'text': 'Black', 'score': 4},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answer': [
        {'text': 'Lion', 'score': 2},
        {'text': 'Horse', 'score': 4},
        {'text': 'Dog', 'score': 7},
        {'text': 'Tiger', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
    _questionIndex = 0;
    _totalScore = 0;
    });
  }
  void _answerQuestion(int score) {
  // void _answerQuestion() {
    // bool aval = true;
    // aval = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Yet We have more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // _questions = []; // will not work if _questions is const

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
