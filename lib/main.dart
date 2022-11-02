import 'package:flutter/material.dart';
import 'package:posit/vistas/Feed.dart';
import 'package:posit/vistas/agregarpost.dart';
import 'package:posit/vistas/comentario.dart';
import 'package:posit/vistas/configuracion.dart';
import 'package:posit/vistas/login.dart';
import 'package:posit/vistas/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: login(),
    );
  }
}
