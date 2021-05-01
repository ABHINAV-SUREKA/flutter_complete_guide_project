import 'package:flutter/material.dart';

// it's a good practice to have one widget per file
class ServicesList extends StatelessWidget {
  final String servicesListText; // 'final' tells Dart this variable's value will never change internally once initialised in the constructor

  ServicesList(this.servicesListText); // short form of constructor definition: List(String listText) {this.listText = listText;}

  @override
  Widget build (BuildContext context) { // gets rebuild when setState() forces the affected ServicesList widget (through the external ServicesList() constructor call) to re-render (in main.dart)
    return new Container(
      width: double.infinity, // ensures container takes as much size (width) as possible
      margin: EdgeInsets.all(10), // Dart allows creation of multiple special constructors (eg: here, EdgeInsets.all(), EdgeInsets.only())
      child: new Text(
        servicesListText,
        style: new TextStyle(
            fontSize: 25
        ),
        textAlign: TextAlign.center,
      ),
  );
  }
}