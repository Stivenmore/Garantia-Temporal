import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pruebatecnica/domain/cubit/firebase_cubit.dart';
import 'package:pruebatecnica/ui/pages/splash/SplashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FirebaseCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Garantia Temporal',
          theme: ThemeData(accentColor: Colors.white, primaryColor: Color(0xffE04536),primarySwatch: Colors.red ),
          home: SplashScreen()),
    );
  }
}
