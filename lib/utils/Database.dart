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

  static Map<String,dynamic> readInfoUser() {

    DocumentReference userInfo = _mainCollection.doc(userUid);

    userInfo.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data;
      },
      onError: (e) => print("Error getting document: $e"),
    );

    String nombre = "";
    String email = "";
    String usuario = "";

    Map<String, dynamic> data = <String, dynamic>{
      "name": nombre,
      "email": email,
      "Usuario": usuario,
    };

    return data;
  }
}
