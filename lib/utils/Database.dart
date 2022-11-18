import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../provider/providers/UserProvider.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('users');
final CollectionReference _postCollection = _firestore.collection('post');
final listamegusta = [];

class Database {
  static String? userUid;
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
      "descripcion": descripcion,
    };
    await referencer.set(data).whenComplete(() {
      userUid = uid;
      print('Se agregó el usuario');
    }).catchError((e) => print(e));
  }

  static Future<void> addPost({
    required String usuario,
    required String fotoPost,
    required String fotoperfil,
    required String descripcion,
  }) async {
    DocumentReference referencerPost = _postCollection.doc();
    CollectionReference referenceComent =
        referencerPost.collection('comentarios');
    Map<String, dynamic> data = <String, dynamic>{
      "idUser": userUid,
      "fotoperfil": fotoperfil,
      "fotopost": fotoPost,
      "descripcion": descripcion,
      "usuario": usuario,
      "cantidadlikes": 0,
      "cantidadcomentarios": 0,
    };

    await referencerPost.set(data).whenComplete(() {
      print('Se agregó el post');
    }).catchError((e) => print(e));
  }

  //Temporal: como hago para traer los comentarios de un post en especifico
  static Future<void> addComentario(
      {required String foto,
      required String usuario,
      required String texto,
      required String postId}) async {
    DocumentReference referencePost =
        _postCollection.doc(postId).collection('comentarios').doc();

    Map<String, dynamic> data = <String, dynamic>{
      'usuario': usuario,
      'foto': foto,
      'texto': texto
    };
    await referencePost.set(data).whenComplete(() {
      print('Se agregó comentario');
    }).catchError((e) => print(e));
  }

  static Future getUser() async {
    //En esta solo necesitamos el ID para ir a buscarlo a la db
    //Nuevamente hacemos un DocumentReference y le decimos q busque el doc con el id
    DocumentReference documentReference = _mainCollection.doc(userUid);
    //Creamos una nueva instancia de CustomUser que es la que devolveremos
    Map<String, dynamic> dataa = {};
    await documentReference.get().then(
      //Ya sabemos que con .then() podemos hacer algo después de que la función termine
      //En este caso nos devuelve una DocumentSnapshot
      (DocumentSnapshot doc) {
        //Mapeamos esa data del snapshot para que sea más fácil sacarle los campos específicos
        final data = doc.data() as Map<String, dynamic>;
        dataa = data;
      },
    );
    //Devolvemos un objeto User full instanciado
    return dataa;
  }

  static Future<Map<String, dynamic>> readInfoUser(String userId) async {
    Database.userUid = userId;
    DocumentReference userInfo = _mainCollection.doc(userId);

    String nombre = "";
    String email = "";
    String usuario = "";
    String descripcion = "";
    Map<String, dynamic> dataa = <String, dynamic>{
      "name": nombre,
      "email": email,
      "Usuario": usuario,
      "descripcion": descripcion,
    };

    await userInfo.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        dataa = data;
      },
      onError: (e) => print("Error getting document: $e"),
    );

    return dataa;
  }

  static Stream<QuerySnapshot> readPost() {
    CollectionReference infopostCollection = _postCollection;

    return infopostCollection.snapshots();
  }

  static Stream<QuerySnapshot>? readPostPerfil() {
    CollectionReference infoperfilpostCollection = _postCollection;
    _firestore
        .collection('post')
        .where('idUser', isEqualTo: userUid)
        .get()
        .then(
          (res) => infoperfilpostCollection.snapshots(),
          onError: (e) => print("Error completing: $e"),
        );
    return infoperfilpostCollection.snapshots();
  }

  static Future<void> updateLikes({required int cantidadLikes, required String docID}) async {
    DocumentReference referenceLikes = _postCollection.doc(docID);
///se le pasa argumento al .doc para que sepa cuál documento vamos a actualizar.
///A la hora de crear, también se le puede pasar argumento (tipo String) para definirle manualmente el ID
    Map<String, dynamic> data = <String,dynamic>{} ;
    
    if(listamegusta.contains(userUid)){
      if(cantidadLikes <= 0){
        //return;
        listamegusta.remove(userUid);
      }else if(cantidadLikes > 0){
        data = <String, dynamic>{//Nuevos datos
          "cantidadlikes": cantidadLikes - 1,
        };
        listamegusta.remove(userUid);
      }
    }else{
      
      if(cantidadLikes < 0){
        //return;
      }else if (cantidadLikes >= 0){
        data = <String, dynamic>{//Nuevos datos
          "cantidadlikes": cantidadLikes + 1,
        };
        listamegusta.add(userUid);
      }
    }
    print(listamegusta);
    
    await referenceLikes
        .update(data)//Función para actualizar
        .catchError((e) => print(e));
        
  }
}
