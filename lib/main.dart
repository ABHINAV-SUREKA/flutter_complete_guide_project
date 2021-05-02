import 'package:flutter/material.dart';
import './selection.dart';
import './result.dart';

void main()
{
  // kicks off UI/widget rendering
  runApp(new OxyApp()); //exposed in material.dart
}
// above main() function with only one line of code could also be written as: void main() => runApp(new OxyApp());

class OxyApp extends StatefulWidget { // every widget class has to extend either of the two abstract classes: StatelessWidget or StatefulWidget
  // unlike in case of StatelessWidget we have 2 classes in case of StatefulWidget to ensure when external data changes, only OxyApp gets re-created while OxyAppState remains persistent/intact
  @override
  State<StatefulWidget> createState() {
    return new _OxyAppState();
  }
}

class _OxyAppState extends State<OxyApp> { // State is a generic class (of type OxyApp, here)
  int _listIndex = 0; // an '_' prefix ensures a class/var/function cannot be accessed outside the current file
  static const List<Map<String,Object>> _serviceListMap = [
    {
      "serviceType": "Oxygen Cylinder",
      "institutions": ["Institute 11", "Institute 21", "Institute 31"],
    },
    {
      "serviceType": "Oxygen Concentrator",
      "institutions": ["Institute 12", "Institute 22", "Institute 32"],
    },
    {
      "serviceType": "Medicines",
      "institutions": ["Institute 13", "Institute 23", "Institute 33"],
    },
  ];

  void _viewInstitutions() {
    setState(() { // setState: a State function that forces flutter to call the below build() function (re-render the below MaterialApp (though internally, not the entire widget but only the sub-widget affected by data change gets re-rendered))
      print ("Service $_listIndex details");
      _listIndex = _listIndex + 1;
    });
    if (_listIndex < _serviceListMap.length) {
      print ("We have more services");
    }
  }

  @override
  Widget build(BuildContext context) { // every widget is a Dart class with build method that returns Widget

    return new MaterialApp( // MaterialApp class extends StatefulWidget which extends Widget
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Oxygen cylinder, concentrator, etc. services"),
        ),
        body: _listIndex < _serviceListMap.length ? new Selection(
          callbackFunction: _viewInstitutions,
          listIndex: _listIndex,
          serviceListMap: _serviceListMap,
        ) : new Result(),
      ),
    ); // 'scaffold' is another widget in material.dart package to create base page design
  }
}