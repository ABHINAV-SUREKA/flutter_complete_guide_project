import 'package:flutter/material.dart';

void main()
{
  // kicks off UI/widget rendering
  runApp(new OxyApp()); //exposed in material.dart
}
// above main() function with only one line of code could also be written as: void main() => runApp(new OxyApp());

class OxyApp extends StatelessWidget //  every widget has to extend either of the two: StatelessWidget or StatefulWidget
{
  int listIndex = 0;
  void viewDetails() {
    listIndex = listIndex + 1;
    print ("Institution n details");
    print (listIndex);
  }
  @override
  Widget build(BuildContext context) // every widget is a Dart class with build method that returns widgets
  {
    List<String> titles = ["List1", "List2", "List3"];
    List<String> names = ["Institution 1", "Institution 2", "Institution 3"];
    return new MaterialApp(home: new Scaffold(
      appBar: new AppBar(title: new Text("Oxygen cylinder services"),),
      body: new Column(children: [
        Text(titles[listIndex]),
        RaisedButton(child: new Text(names.elementAt(0)), onPressed: viewDetails,),
        RaisedButton(child: new Text(names.elementAt(1)), onPressed: (){print ("Institution 2 details");},), // using anonymous function
        RaisedButton(child: new Text(names[2]), onPressed: (){print ("Institution 3 details");},), // using anonymous function
      ],),
    ),); // scaffold is another widget in material.dart package to create base page design
  }
}