import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../vistas/signin.dart';
import 'Database.dart';

class Authentication {
  static late User? user;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static bool entro = false;


  static Future<void> register(
      {required String email,
      required String pass,
      required String nombre,
      required String usuario,
      required BuildContext context}) async {
    try {
      final User? user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,

      ))
          .user;

      
      if (user != null) {
        await Database.addUser(
            email: email, nombre: nombre, usuario: usuario, uid: user.uid);
            entro= true;
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(
          context, e.message!); 
    }

    /* if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.uid;
      });
    } else {
      setState(() {
        _success = true;
      });
    } */
  }

  static Future<void> signInWithEmailAndPassword(
      {required String email, required String pass,required BuildContext context}) async {
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      ))
          .user;
    
      entro = true;
      Database.userUid = user?.uid;
    } on FirebaseAuthException catch (e) {
      showSnackBar(
          context, e.message!); 
          user = null;
    }

    /* if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user!.email;
      });
    } else {
      setState(() {
        _success = false;
      });
    } */
  }
}
