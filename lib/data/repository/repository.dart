import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pruebatecnica/data/services/Servces.dart';
import 'package:pruebatecnica/domain/entities/model_data.dart';

class Repository implements Services {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Repository(this._firestore);

  Future<ServiceResult> setDataforFirebase(
      String name, String lastname, String date, List direction) async {
    try {
      print('entramos en envio de data');
      //Pense en validar con el nombre y apellido si el usuario ya estaba registrado
      //Pero no es necesario dado que ello no se pide

      //valido si ya existe un usuario con esas credenciales
      //valido con el nombre y apellido
      //si existe le informo que ya esta registrado, de lo contrario lo registro

      await _firestore.collection('Register').doc().set({
        'name': name,
        'lastname': lastname,
        'date': date,
        'direction': direction
      });
      print('Usuario agregado');
      return ServiceResult(snapbar: 'Usuario agregado', status: true);
    } catch (e) {
      print(e.toString());
      print('hubo un error');
      return ServiceResult(message: 'Hubo un error en el registro');
    }
  }

  // ignore: missing_return
  Future<ServiceResult<List<Register>>> getDatafrmFirebase() async {
    List<DocumentSnapshot> doc;
    var list;
    try {
      print('Entramos en el try');
      final resp = await _firestore.collection('Register').get();
      doc = resp.docs;
      list = doc.map((DocumentSnapshot documentSnapshot) {
        return (documentSnapshot.data());
      }).toList();
      if (resp.docs.isEmpty == false) {
        List<Register> register =
            (list as Iterable).map((e) => Register.fromFirebase(e)).toList();
        print('enviamos data');
        return ServiceResult(data: register);
      } else {
        print('no hay registros');
        return ServiceResult(
            status: true, snapbar: 'No hay usuarios registrados');
      }
    } catch (e) {
      print(e.toString());
      return ServiceResult(status: false, message: e.toString());
    }
  }

  //Estos dos metodos manejarian la inicializacion de consultas y determinarian cuando terminan
  // pero no es obligatorio usarlos, los implemento solo por buenas practicas
  @override
  void dispones() {}

  @override
  void init() {}
}
