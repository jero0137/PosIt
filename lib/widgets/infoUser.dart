import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'imagenCircular.dart';

class infoUser extends StatelessWidget with PreferredSizeWidget {
  final String imagen;
  final String descripcion;
  final String nombre;

  @override
  Size get preferredSize => const Size.fromHeight(120);

  const infoUser({
    super.key,
    required this.imagen,
    required this.descripcion,
    required this.nombre,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(children: [
        Row(
          children: [
            imagenCircular(
              width: 100,
              imagen: imagen,
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    nombre,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: Container(
                    width: 200,
                    child: Text(
                      descripcion,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ]),
      backgroundColor: Color(0xFF031630),
      toolbarHeight: 200,
    );
  }
}
