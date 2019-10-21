import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;

    if (resultScore <= 8) {
      resultText = 'You\'re Awesome and Innocent!';
    } else if (resultScore <= 12) {
      resultText = 'pretty Likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You\'re ... Strange!';
    } else {
      resultText = 'You\'re bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz!'),
            textColor: Colors.blueAccent,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
