import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('users');

class Database {
  static String? userUid;

  static Future<void> addUser(
      {required String email,
      required String uid,
      required String nombre,
      required String usuario}) async {
    DocumentReference referencer = _mainCollection.doc(uid);

    Map<String, dynamic> data = <String, dynamic>{
      "name": nombre,
      "email": email,
      "Usuario": usuario,
    };
    await referencer.set(data).whenComplete(() {
      userUid = uid;
      print('Se agregó el usuario');
    }).catchError((e) => print(e));
  }

  static Future<Map<String, dynamic>> readInfoUser() async {

    DocumentReference userInfo = _mainCollection.doc(userUid);

    String nombre = "";
    String email = "";
    String usuario = "";
    Map<String, dynamic> dataa = <String, dynamic>{
      "name": nombre,
      "email": email,
      "Usuario": usuario,
    };

    await userInfo.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        dataa= data;
      },
      onError: (e) => print("Error getting document: $e"),
    );

    return dataa;
  }
}
