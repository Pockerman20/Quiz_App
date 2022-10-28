import 'package:flutter/material.dart';

import './questions.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  // const Quiz({super.key});

  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'].toString(),
        ),
        ...(questions[questionIndex]['answer'] as List<Map<String,Object>>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text'].toString());
        }).toList()
      ],
    );
  }
}
