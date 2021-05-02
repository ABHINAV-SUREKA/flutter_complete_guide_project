import 'package:flutter/material.dart';

// it's a good practice to have one widget per file
class Result extends StatelessWidget {
  @override
  Widget build (BuildContext context) { // gets rebuild when setState() forces the affected ServicesList widget (through the external ServicesList() constructor call) to re-render (in main.dart)
    return new Center(
      child: new Text(
          "End of Services"
      ),
    );
  }
}