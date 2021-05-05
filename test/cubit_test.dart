import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pruebatecnica/domain/cubit/firebase_cubit.dart';

void main() {
  blocTest('This test is to check the wrong answer from the server',
      build: () => FirebaseCubit(),
      act: (FirebaseCubit cubit) async {
        await cubit.setData(name: '',lastname: '',date: '', direction: []);
      },
      expect: ()=> [isA<FirebaseInitial>(), isA<FirebaseError>()]
      );
    
  blocTest('This test is to check from the server',
      build: () => FirebaseCubit(),
      act: (FirebaseCubit cubit) async {
        await cubit.setData(name: 'Noah',lastname: 'Morelo',date: 'May 6 2000', direction: []);
      },
      expect: ()=> [isA<FirebaseInitial>(), isA<FirebaseSnapbar>()]
      );
   blocTest('getData',
      build: () => FirebaseCubit(),
      act: (FirebaseCubit cubit) async {
        await cubit.getDate();
      },
      expect: ()=> [isA<FirebaseInitial>(), isA<FirebaseLoaded>()]
      );   
}
