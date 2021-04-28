import 'package:flutter/material.dart';

void main()
{
  // kicks off UI/widget rendering
  runApp(new OxyApp()); //exposed in material.dart
}
// above main() function with only one line of code could also be written as: void main() => runApp(new OxyApp());

class OxyApp extends StatelessWidget //  every widget has to extend either of the two: StatelessWidget or StatefulWidget
{
  @override
  Widget build(BuildContext context) // every widget is a Dart class with build method that returns widgets
  {
    List<String> names = ["Institution 1", "Institution 2", "Institution 3"];
    return new MaterialApp(home: new Scaffold(
      appBar: new AppBar(title: new Text("Oxygen cylinder services"),),
      body: new Column(children: [
        Text("List of institutions"),
        RaisedButton(child: new Text("Institution 1"), onPressed: null,),
        RaisedButton(child: new Text("Institution 2"), onPressed: null,),
        RaisedButton(child: new Text("Institution 3"), onPressed: null,),
      ],),
    ),); // scaffold is another widget in material.dart package to create base page design
  }
}