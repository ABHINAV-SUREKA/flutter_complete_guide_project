import 'package:flutter/material.dart';
import './services_list.dart';
import './institution.dart';

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

  void _viewInstitutions() {
    setState(() { // setState: a State function that forces flutter to call the below build() function (re-render the below MaterialApp (though internally, not the entire widget but only the sub-widget affected by data change gets re-rendered))
      _listIndex = _listIndex + 1;
    });
    print ("Service $_listIndex details");
  }

  @override
  Widget build(BuildContext context) { // every widget is a Dart class with build method that returns Widget
    const List<Map<String,Object>> serviceListMap = [
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

    return new MaterialApp( // MaterialApp class extends StatefulWidget which extends Widget
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Oxygen cylinder, concentrator, etc. services"),
        ),
        body: new Column(
          children: [
            new ServicesList(serviceListMap[_listIndex]["serviceType"]),
            ...(serviceListMap[_listIndex]["institutions"] as List<String>).map((institution) { // using 'as List<String>' to convert Object type (as we have mentioned value as Object in Map) to List<String>  //.map() generates a new list based on old list
              return new Institution(_viewInstitutions, institution); // returns Institution (Button) widget
            }).toList() // using toList() as .map() doesn't return a List but an Iterable which is a parent class of all the iterables like List
            // '...': spread operator that takes all the values out of a list and add them to a surrounding list as individual items/values
          ],
        ),
      ),
    ); // scaffold is another widget in material.dart package to create base page design
  }
}