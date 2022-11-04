import 'package:flutter/material.dart';
import 'package:posit/vistas/comentario.dart';
import 'package:posit/vistas/perfil.dart';

AppBar mainAppbar(String titulo, String fotoPerfil) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 1,
        ),
        Image.network(
          'https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/Logo.png?alt=media&token=fdd54a50-f264-4a16-960b-23ad499290f9',
          height: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(padding: const EdgeInsets.all(8.0), child: Text(titulo)),
        const Spacer(
          flex: 4,
        ),
        imagenCircular(fotoPerfil, 40),
        const Spacer(
          flex: 1,
        ),
      ],
    ),
    backgroundColor: Color.fromRGBO(133, 130, 229, 90),
    toolbarHeight: 45,
  );
}

CircleAvatar imagenCircular(String imagen, double width) {
  return CircleAvatar(
    radius: width / 2,
    backgroundImage: NetworkImage(imagen),
  );
}

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

Container post(String fotoPerfil, String usuario, String fotoPost,
    int cantidadLikes, int cantidadComentarios,BuildContext context) {
  return Container(
    width: 350,
    height: 390,
    margin: const EdgeInsets.only(bottom: 5, top: 5),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.transparent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: const Color.fromRGBO(133, 130, 229, 90),
    ),
    child: Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            imagenCircular(fotoPerfil, 50),
            const SizedBox(
              width: 10,
            ),
            Text(
              usuario,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Image.network(
          fotoPost,
          width: 330,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Spacer(
              flex: 1,
            ),
            Image.network(
              'https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/like.png?alt=media&token=033e25e3-4e8f-444c-8d36-f6666ddb1123',
              width: 30,
              height: 30,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              '$cantidadLikes',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Spacer(
              flex: 2,
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const comentario()))
              },
              child: Image.network(
                'https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/keyboard.png?alt=media&token=fd323da9-47f5-490d-9647-fd3bef130271',
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              '$cantidadComentarios',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: const Text(
            'Despues de una mal farrita en el ultra en vez de ir con mis amigos de fiesta',
            style: TextStyle(color: Colors.white, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}

TextField campo(String hint) {
  return TextField(
    decoration: InputDecoration(
      fillColor: Colors.white,
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.white),
    autofocus: false,
  );
}

TextField campoPass(String hint) {
  return TextField(
    decoration: InputDecoration(
      fillColor: Colors.white,
      hintText: hint,
      hintStyle: TextStyle(color: Colors.white),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    textAlign: TextAlign.center,
    style: TextStyle(color: Colors.white),
    autofocus: false,
    obscureText: true,
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

AppBar cabecera(String titulo) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 1,
        ),
        Image.network(
          'https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/Logo.png?alt=media&token=fdd54a50-f264-4a16-960b-23ad499290f9',
          height: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(padding: const EdgeInsets.all(8.0), child: Text(titulo)),
        const Spacer(
          flex: 4,
        ),
        const Spacer(
          flex: 1,
        ),
      ],
    ),
    backgroundColor: Color(0xFF031630),
    toolbarHeight: 45,
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
              imagenCircular(foto, 50),
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
