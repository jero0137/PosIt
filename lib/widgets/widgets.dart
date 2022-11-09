import 'package:flutter/material.dart';
import 'package:posit/vistas/comentario.dart';
import 'package:posit/widgets/imagenCircular.dart';

Container postAgregar(String foto) {
  return Container(
      width: 320,
      height: 240,
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Spacer(flex: 1),
          Container(
            width: 300,
            height: 220,
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(133, 130, 229, 90),
            ),
            child: Column(children: [
              //Falta buscar como insertar la foto ahí
            ]),
          ),
          Spacer(flex: 1)
        ],
      ));
}

Container descripcion(String texto) {
  return Container(
    width: 320,
    height: 240,
    margin: const EdgeInsets.only(bottom: 5, top: 5),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.transparent),
    child: Column(children: [
      SizedBox(
        height: 10,
      ),
      camposinlinea(' ' + texto),
    ]),
  );
}

TextField camposinlinea(String descripcion) {
  return TextField(
    decoration: InputDecoration.collapsed(
      fillColor: Colors.white,
      hintText: descripcion,
      hintStyle: TextStyle(color: Colors.white),
    ),
    textAlign: TextAlign.start,
    maxLines: null,
    style: TextStyle(color: Colors.white),
    autofocus: false,
  );
}

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

Container comentarios(String foto, String usuario, String texto) {
  return Container(
      width: 300,
      height: 66,
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Color.fromRGBO(133, 130, 229, 90),
      ),
      child: Row(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              imagenCircular(width: 50, imagen: foto),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                usuario,
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.left,
              ),
              Text(
                texto,
                style: TextStyle(color: Colors.white, fontSize: 17),
                textAlign: TextAlign.left,
              )
            ],
          )
        ],
      ));
}
