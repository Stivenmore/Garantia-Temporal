import 'package:flutter/material.dart';

class StateViewSnack extends StatefulWidget {
  final String snackview;
  StateViewSnack({Key key, this.snackview}) : super(key: key);

  @override
  _StateViewSnackState createState() => _StateViewSnackState();
}

class _StateViewSnackState extends State<StateViewSnack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Text('No hay usuarios registrados'),
        ),
    );
  }
}
