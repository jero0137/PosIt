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
          fit: BoxFit.contain,
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
            image: NetworkImage('https://img.freepik.com/vector-premium/papel-nota-ilustracion-icono-vector-dibujos-animados-lapiz_480044-364.jpg?w=740'),
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

Container post() {
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
  );
}