import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'imagenCircular.dart';

class comentario extends StatelessWidget {
  final String foto;
  final String usuario;
  final String texto;
  const comentario(
      {super.key,
      required this.foto,
      required this.usuario,
      required this.texto});

  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  width: 200,
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    texto,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
