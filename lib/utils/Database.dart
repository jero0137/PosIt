import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../provider/providers/user.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('users');
final CollectionReference _postCollection = _firestore.collection('post');

class Database {
  static String? userUid;
  static String? postPid;

  static Future<void> addUser(
      {required String email,
      required String uid,
      required String descripcion,
      required String nombre,
      required String usuario}) async {
    DocumentReference referencer = _mainCollection.doc(uid);

    Map<String, dynamic> data = <String, dynamic>{
      "name": nombre,
      "email": email,
      "Usuario": usuario,
      "descripcion" : descripcion,
    };
    await referencer.set(data).whenComplete(() {
      userUid = uid;
      print('Se agregó el usuario');
    }).catchError((e) => print(e));
  }

  static Future<void> addPost(
    {required String usuario,
    required String fotoPost,
    required String fotoperfil,
    required String descripcion,}) async{
      DocumentReference referencerPost = _postCollection.doc();

      Map<String, dynamic> data = <String, dynamic>{
        "usuario": userUid,
        "fotoperfil": fotoperfil,
        "foto": fotoPost,
        "descripcion": descripcion,
        "nombreUsuario": usuario,
        "cantidadLikes": 0,
        "cantidadComentarios" : 0,
      };
      await referencerPost.set(data).whenComplete(() {
        print('Se agregó el post');

      }).catchError((e) => print(e));
    }

  
  static Future<Map<String, dynamic>> readInfoUser() async {

    DocumentReference userInfo = _mainCollection.doc(userUid);

    String nombre = "";
    String email = "";
    String usuario = "";
    String descripcion = "";
    Map<String, dynamic> dataa = <String, dynamic>{
      "name": nombre,
      "email": email,
      "Usuario": usuario,
      "descripcion" : descripcion,
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

  static Stream<QuerySnapshot> readPost() {
    CollectionReference infopostCollection =
      _postCollection;

    return infopostCollection.snapshots();
  }

}
