import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pruebatecnica/data/repository/repository.dart';
import 'package:pruebatecnica/data/services/Servces.dart';
import 'package:pruebatecnica/domain/entities/model_data.dart';

part 'firebase_state.dart';

class FirebaseCubit extends Cubit<FirebaseState> {
  final Repository _repository;

  FirebaseCubit({Repository repository})
      : _repository = repository ?? Repository(FirebaseFirestore.instance),
        super(FirebaseInitial());

  Future<void> setData(
      {String name, String lastname, String date, List direction,}) async {
    emit(FirebaseInitial());
    ServiceResult result =
        await _repository.setDataforFirebase(name, lastname, date, direction);
    if (result.status == true) {
      emit(FirebaseSnapbar(snapbar: result.snapbar));
      print('agregado con exito');
    } else {
      emit(FirebaseError(message: result.message));
      print('no agregado');
    }
  }

  Future<void> getDate() async {
    emit(FirebaseInitial());
    ServiceResult<List<Register>> result =
        await _repository.getDatafrmFirebase();
    if (result.data != null) {
      print('Loaded');
      emit(FirebaseLoaded(register: result.data));
    } else if (result.status == true) {
      print('SnackBar, no hay usuarios');
      emit(FirebaseSnapbar(snapbar: result.message));
    } else {
      print('Error');
      emit(FirebaseError(message: result.message));
    }
  }
}
