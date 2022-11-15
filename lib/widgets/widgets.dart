import 'package:flutter/material.dart';
import 'package:posit/vistas/comentario.dart';
import 'package:posit/widgets/imagenCircular.dart';


GestureDetector button(VoidCallback function, String text) {
  return GestureDetector(
    onTap: function,
    child: Container(
      width: 261,
      height: 52,
      decoration: BoxDecoration(
        color: Color(0xFF37A557),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
          child: Text(text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
    ),
  );
}

AppBar cabeceraFlecha(String titulo, BuildContext context) {
  return AppBar(
    backgroundColor: const Color(0xFF031630),
    toolbarHeight: 45,
    leading: IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(titulo),
    centerTitle: false,
    leadingWidth: 20,
  );
}


