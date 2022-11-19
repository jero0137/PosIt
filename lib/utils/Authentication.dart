import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/providers/UserProvider.dart';
import 'Database.dart';
import 'Functions.dart';

class Authentication {

  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Stream<User?> streamFirebase() {
    //Este es el stream
    final streamAuth = FirebaseAuth.instance.authStateChanges();
    return streamAuth;
  }


  static Future<void> register(
      {required String email,
      required File fotoPerfil,
      required String pass,
      required String nombre,
      required String usuario,
      required String descripcion,
      required BuildContext context}) async {
    late User? user;    
    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,

      ))
          .user;

    } on FirebaseAuthException catch (e) {
      Functions.showSnackBar(
          context, e.message!); 
    }

    if (user != null) {


        await Database.addUser(
            email: email,descripcion: descripcion ,nombre: nombre, usuario: usuario, uid: user.uid,fotoPerfil: fotoPerfil,context: context);

        await Provider.of<UserProvider>(context, listen: false)
                              .inicializar(user.uid);    
      }


  }

  static Future<void> signInWithEmailAndPassword(
      {required String email, required String pass,required BuildContext context}) async {
    late User? user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      ))
          .user;

    } on FirebaseAuthException catch (e) {
      Functions.showSnackBar(
          context, e.message!); 
          user = null;
    }

    if(user != null){
      await context.read<UserProvider>().inicializar(user.uid);
    }

  }

  static signOut({required BuildContext context}) async {
    //La función más fácil del universo, para cerrar sesión. El Stream auto detecta que no hay más data
    await _auth.signOut();
    //Limpiamos la data del provider
    context.read<UserProvider>().clearData();
  }

}
