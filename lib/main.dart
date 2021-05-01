import 'package:flutter/material.dart';
import './services_list.dart';
import './service.dart';

void main()
{
  // kicks off UI/widget rendering
  runApp(new OxyApp()); //exposed in material.dart
}
// above main() function with only one line of code could also be written as: void main() => runApp(new OxyApp());

class OxyApp extends StatefulWidget // every widget class has to extend either of the two abstract classes: StatelessWidget or StatefulWidget
{
  // unlike in case of StatelessWidget we have 2 classes in case of StatefulWidget to ensure when external data changes, only OxyApp gets re-created while OxyAppState remains persistent/intact
  @override
  State<StatefulWidget> createState() {
    return new _OxyAppState();
  }
}

class _OxyAppState extends State<OxyApp> { // State is a generic class (of type OxyApp, here)
  int _listIndex = 0; // an '_' prefix ensures a class/var/function cannot be accessed outside the current file
  void _viewService() {
    setState(() { // setState: a State function that forces flutter to call the below build() function (re-render the below MaterialApp (though internally, not the entire widget but only the sub-widget affected by data change gets re-rendered))
      _listIndex = _listIndex + 1;
    });
    print ("Service $_listIndex details");
  }
  @override
  Widget build(BuildContext context) // every widget is a Dart class with build method that returns Widget
  {
    List<String> titles = ["List1", "List2", "List3"];
    List<String> names = ["Service 1", "Service 2", "Service 3"];
    return new MaterialApp( // MaterialApp class extends StatefulWidget which extends Widget
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Oxygen cylinder, concentrator, etc. services"),
        ),
        body: new Column(
          children: [
            new ServicesList(titles[_listIndex]),
            new Service(_viewService, names.elementAt(0)),
            new Service(_viewService, names[1]), // using anonymous function
            new Service(_viewService, names[2]), // using anonymous function
          ],
        ),
      ),
    ); // scaffold is another widget in material.dart package to create base page design
  }
}