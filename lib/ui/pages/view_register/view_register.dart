import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/domain/cubit/firebase_cubit.dart';

class ViewRegister extends StatefulWidget {
  ViewRegister({Key key}) : super(key: key);

  @override
  _ViewRegisterState createState() => _ViewRegisterState();
}

class _ViewRegisterState extends State<ViewRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FirebaseCubit, FirebaseState>(
        builder: (context, state) {
          return Center();
        },
      ),
    );
  }
}
