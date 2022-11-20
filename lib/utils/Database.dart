import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posit/vistas/agregarpost.dart';
import 'package:uuid/uuid.dart';

import '../provider/providers/UserProvider.dart';
import 'Functions.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final FirebaseStorage storage = FirebaseStorage.instance;
final CollectionReference _mainCollection = _firestore.collection('users');
final CollectionReference _postCollection = _firestore.collection('post');
final listamegusta = [];

class Database {
  static String? userUid;
  static Future<void> addUser(
      {
      required File? fotoPerfil,
      required String email,
      required String uid,
      required String? descripcion,
      required String nombre,
      required BuildContext context,
      required String usuario}) async {
    DocumentReference referencer = _mainCollection.doc(uid);

    if (fotoPerfil != null || descripcion != null) {

      var imageName = Uuid().v1();
      var imagePath = "/postImagenes/$userUid/$imageName.jpg";
      
      Reference ref = storage.ref().child(imagePath);
      
      await ref.putFile(fotoPerfil!);

      String linkDeLaFoto = await ref.getDownloadURL();

    Map<String, dynamic> data = <String, dynamic>{
      "name": nombre,
      "email": email,
      "Usuario": usuario,
      "descripcion": descripcion,
      "fotoperfil" : linkDeLaFoto,
    };
    await referencer.set(data).whenComplete(() {
      userUid = uid;
      print('Se agregó el usuario');
    }).catchError((e) => print(e));
    } else {
      Functions.showSnackBar(context, 'Complete toda la información');
    }
  }

  static Future<void> addPost({
    required String usuario,
    required String fotoperfil,
    required String? descripcion,
    required File? fotoDelPost,
    required BuildContext context,
  }) async {
    if (fotoDelPost != null || descripcion != null) {

      var imageName = Uuid().v1();
      var imagePath = "/postImagenes/$userUid/$imageName.jpg";
      
      Reference ref = storage.ref().child(imagePath);
      
      await ref.putFile(fotoDelPost!);

      String linkDeLaFoto = await ref.getDownloadURL();

      DocumentReference referencerPost = _postCollection.doc();

      Map<String, dynamic> data = <String, dynamic>{
        "idUser": userUid,
        "fotoperfil": fotoperfil,
        "fotopost": linkDeLaFoto,
        "descripcion": descripcion,
        "usuario": usuario,
        "cantidadlikes": 0,
        "cantidadcomentarios": 0,
      };

      await referencerPost.set(data).whenComplete(() {
        Functions.showSnackBar(context, 'Se agregó el post');
      }).catchError((e) => print(e));
    } else {
      Functions.showSnackBar(context, 'Complete toda la información');
    }
  }

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
      updateCantidadComentarios(postId);
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
    String linkFoto = "";
    Map<String, dynamic> dataa = <String, dynamic>{
      "name": nombre,
      "email": email,
      "Usuario": usuario,
      "descripcion": descripcion,
      "fotoperfil": linkFoto
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

  static Stream<QuerySnapshot>? readComentarios(String postID) {
    CollectionReference comentarios =
        _postCollection.doc(postID).collection('comentarios');

    return comentarios.snapshots();
  }

  static Stream<QuerySnapshot> readPostPerfil() {
    CollectionReference infoperfilpostCollection = _postCollection;

    return infoperfilpostCollection
        .where('idUser', isEqualTo: userUid)
        .snapshots();
  }

  static Future<void> updateCantidadComentarios(String idPost) async {
    DocumentReference referenceLikes = _postCollection.doc(idPost);

    int cantidadcomentarios = 0;

    await referenceLikes.get().then(
      //Ya sabemos que con .then() podemos hacer algo después de que la función termine
      //En este caso nos devuelve una DocumentSnapshot
      (DocumentSnapshot doc) {
        //Mapeamos esa data del snapshot para que sea más fácil sacarle los campos específicos
        final data = doc.data() as Map<String, dynamic>;
        cantidadcomentarios = data['cantidadcomentarios'];
      },
    );

  Map<String, dynamic> data = <String, dynamic>{
    "cantidadcomentarios" : cantidadcomentarios + 1
  };

    await referenceLikes
        .update(data) //Función para actualizar
        .catchError((e) => print(e));
  }

  static Future<void> updateLikes(
      {required int cantidadLikes, required String docID}) async {
    DocumentReference referenceLikes = _postCollection.doc(docID);

    ///se le pasa argumento al .doc para que sepa cuál documento vamos a actualizar.
    ///A la hora de crear, también se le puede pasar argumento (tipo String) para definirle manualmente el ID
    Map<String, dynamic> data = <String, dynamic>{};

    

    if (listamegusta.contains(userUid)) {
      if (cantidadLikes <= 0) {
        //return;
        listamegusta.remove(userUid);
      } else if (cantidadLikes > 0) {
        data = <String, dynamic>{
          //Nuevos datos
          "cantidadlikes": cantidadLikes - 1,
        };
        listamegusta.remove(userUid);
      }
    } else {
      if (cantidadLikes < 0) {
        //return;
      } else if (cantidadLikes >= 0) {
        data = <String, dynamic>{
          //Nuevos datos
          "cantidadlikes": cantidadLikes + 1,
        };
        listamegusta.add(userUid);
      }
    }
    print(listamegusta);

    await referenceLikes
        .update(data) //Función para actualizar
        .catchError((e) => print(e));
  }
}
