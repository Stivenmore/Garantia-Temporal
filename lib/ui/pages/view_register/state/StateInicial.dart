import 'package:flutter/material.dart';

class StateViewInitial extends StatefulWidget {
  StateViewInitial({Key key}) : super(key: key);

  @override
  _StateViewInitialState createState() => _StateViewInitialState();
}

class _StateViewInitialState extends State<StateViewInitial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text('Initial')
      ),
    );
  }
}
