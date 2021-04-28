import 'package:flutter/material.dart';

void main()
{
  // Kicks off UI/widget rendering
  runApp(new OxyApp()); //exposed in material.dart
}

class OxyApp extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return new MaterialApp(home: Text('Institutions'),);
  }
}