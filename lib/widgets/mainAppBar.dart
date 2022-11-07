

import 'package:flutter/material.dart';
import 'package:posit/widgets/imagenCircular.dart';
import 'package:posit/widgets/widgets.dart';

class mainAppBar extends StatelessWidget with PreferredSizeWidget{
  
  @override
  Size get preferredSize => const Size.fromHeight(45);

  final String titulo;
  final String fotoPerfil;

  const mainAppBar({super.key,required this.titulo,required this.fotoPerfil});
  
  @override
  Widget build(BuildContext context) {
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
        imagenCircular(width: 40, imagen: fotoPerfil),
        const Spacer(
          flex: 1,
        ),
      ],
    ),
    backgroundColor: Color.fromRGBO(133, 130, 229, 90),
    toolbarHeight: 45,
  );
  
  }
}
