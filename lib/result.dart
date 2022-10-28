import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // const Result({super.key});
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore,this.resetHandler);

  String get resultPhrase {
    String resultText;
    if(resultScore<=8){
      resultText = 'You are awesome and innocent!';
    }
    else if(resultScore<=13){
      resultText = 'You are good!';
    }
    else if(resultScore<=17){
      resultText = 'You are ... strange!';
    }
    else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children:<Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: resetHandler, child: Text('Restart Quiz!'),
          )
        ],
      ),
    );
  }
}
