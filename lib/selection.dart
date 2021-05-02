import 'package:flutter/material.dart';
import './service_type_text.dart';
import './institution.dart';

// it's a good practice to have one widget per file
class Selection extends StatelessWidget {
  final List<Map<String,Object>> serviceListMap;
  final int listIndex;
  final Function callbackFunction;

  Selection({ // note: named params can't start with '_'
    @required this.serviceListMap,
    @required this.listIndex,
    @required this.callbackFunction
  }); // constructor that accepts pointer to a callback function

  @override
  Widget build (BuildContext context) { // gets rebuild when setState() forces the affected ServicesList widget (through the external ServicesList() constructor call) to re-render (in main.dart)
    return new Column(
      children: [
        new ServiceTypeText(serviceListMap[listIndex]["serviceType"]),
        ...(serviceListMap[listIndex]["institutions"] as List<Map<String,Object>>).map((institution) { // using 'as List<String>' to convert Object type (as we have mentioned value as Object in Map) to List<String>  //.map() generates a new list based on old list
          return new Institution(
                  (){return callbackFunction(institution["num_of_services"]);}, institution["text"],
                  // here instead of forwarding pointer to the callbackFunction, we are creating an anonymous function on fly, and passing pointer/address to that function. Thus, 'Institution' widget still gets a function with no argument. // when 'onPressed' is triggered, the anonymous function will be executed and the 'callbackFunction' inside will be called
                  // note: we could have also created a named function like abc(){return callbackFunction(institution["num_of_services"]);} and then referenced that function above.
          ); // returns Institution (Button) widget
        }).toList() // using toList() as .map() doesn't return a List<Institution> but an Iterable which is a parent class of all the iterables like List
        // '...': spread operator that takes all the values out of a list and add them to a surrounding list as individual items/values
      ],
    );
  }
}