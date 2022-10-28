import 'package:flutter/material.dart';

AppBar appBar(String titulo) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(
          flex: 1,
        ),
        Image.network(
          'https://img.freepik.com/vector-premium/papel-nota-ilustracion-icono-vector-dibujos-animados-lapiz_480044-364.jpg?w=740',
          height: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Container(padding: const EdgeInsets.all(8.0), child: Text(titulo)),
        Spacer(
          flex: 4,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: const Image(
            image: NetworkImage(
                'https://img.freepik.com/vector-premium/papel-nota-ilustracion-icono-vector-dibujos-animados-lapiz_480044-364.jpg?w=740'),
            width: 30,
          ),
        ),
        Spacer(
          flex: 1,
        ),
      ],
    ),
    backgroundColor: Color.fromRGBO(133, 130, 229, 90),
    toolbarHeight: 45,
  );
}

ClipRRect imagenCircular(String url,double longitud,double altura) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30.0),
    child: Image(
      image: NetworkImage(url),
      width: longitud,
      height: altura,
    ),
  );
}

Container post(String fotoPerfil, String usuario, String fotoPost) {
  return Container(
    width: 350,
    height: 350,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Color.fromRGBO(133, 130, 229, 90),
    ),
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            imagenCircular(fotoPerfil,50,50),
            Text(
              usuario,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Image.network(
          fotoPost,
          width: 330,
          height: 280,
        ),
        Row(),
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
      child: Center(child: Text(text, style: TextStyle(color: Colors.white))),
    ),
  );
}
