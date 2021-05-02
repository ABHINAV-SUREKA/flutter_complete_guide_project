import 'package:flutter/material.dart';

// it's a good practice to have one widget per file
class Result extends StatelessWidget {
  final int resultScore;
  final Function callbackFunction;

  Result(this.resultScore, this.callbackFunction);

  String get resultPhrase { // a getter is a mixture of property/member and method (without arguments) // a Dart feature
    String resultText = "You have selected $resultScore services";
    if (resultScore == 0) {
      resultText = "You haven't selected any services";
    }
    return resultText; // you always have to return something in getter
  }

  @override
  Widget build (BuildContext context) { // gets rebuild when setState() forces the affected ServicesList widget (through the external ServicesList() constructor call) to re-render (in main.dart)
    return new Center(
      child: new Column(
        children: [
          new Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          new OutlinedButton(
              onPressed: callbackFunction,
              child: new Text("Go back to main page"),
              style: OutlinedButton.styleFrom(
                primary: Colors.lightBlue,
                side: new BorderSide(color: Colors.lightBlue),
              ),
          )
        ],
      )
    );
  }
}