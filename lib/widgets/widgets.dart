import 'package:flutter/material.dart';

AppBar appBar(String titulo) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 1,
        ),
        Image.network(
          'https://img.freepik.com/vector-premium/papel-nota-ilustracion-icono-vector-dibujos-animados-lapiz_480044-364.jpg?w=740',
          height: 30,
        ),
        const SizedBox(
          width: 10,
        ),
        Container(padding: const EdgeInsets.all(8.0), child: Text(titulo)),
        const Spacer(
          flex: 4,
        ),
        imagenCircular(
            'https://img.freepik.com/vector-premium/papel-nota-ilustracion-icono-vector-dibujos-animados-lapiz_480044-364.jpg?w=740',
            30),
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

Container post(String fotoPerfil, String usuario, String fotoPost) {
  return Container(
    width: 350,
    height: 400,
    margin: const EdgeInsets.only(bottom: 5, top: 5),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Color.fromRGBO(133, 130, 229, 90),
    ),
    child: Column(
      children: [
        SizedBox(
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
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
        Image.network(
          fotoPost,
          width: 330,
          height: 330,
        ),
        Row(
          children: [
            Image.network(
              'https://www.pngmart.com/files/15/Valentines-Day-Heart-Red-PNG.png',
              width: 10,
              height: 10,
            )
          ],
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
    style: TextStyle(color: Colors.white),
    autofocus: true,
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
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20))),
    ),
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
          'https://img.freepik.com/vector-premium/papel-nota-ilustracion-icono-vector-dibujos-animados-lapiz_480044-364.jpg?w=740',
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
