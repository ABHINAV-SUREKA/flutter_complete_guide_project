import 'package:flutter/material.dart';

// it's a good practice to have one widget per file
class Institution extends StatelessWidget {
  final Function callbackFunction;
  final String institutionName;

  Institution(this.callbackFunction, this.institutionName); // constructor that accepts pointer to a callback function

  @override
  Widget build (BuildContext context) { // gets rebuild when setState() forces the affected ServicesList widget (through the external ServicesList() constructor call) to re-render (in main.dart)
    return new Container(
      width: double.infinity, // 'infinity' is a static constant variable of 'double' class which extends 'num' class // ensures container takes as much width space as possible
      child: new RaisedButton(
        color: Colors.cyanAccent, // 'cyanAccent' is a static constant variable of 'Colors' class
        textColor: Colors.white,
        child: new Text(institutionName),
        onPressed: callbackFunction,
      ),
    );
  }
}