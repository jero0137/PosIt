import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providers/UserProvider.dart';
import '../widgets/imagenCircular.dart';
import '../widgets/widgets.dart';

class comentarios extends StatelessWidget {
  const comentarios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      appBar: cabeceraFlecha('COMENTARIOS', context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    width: 180,
                    child: camposinlinea(' ' 'Escribe un comentario'),
                  ),
                  SizedBox(width: 50, child: botonConIcono(context)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}

Widget camposinlinea(String descripcion) {
  return TextField(
    decoration: InputDecoration(
      fillColor: Colors.white,
      hintText: descripcion,
      hintStyle: TextStyle(color: Colors.white),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    textAlign: TextAlign.start,
    maxLines: null,
    style: TextStyle(color: Colors.white),
    autofocus: false,
  );
}

Widget botonConIcono(BuildContext context) {
  return Material(
    color: Colors.transparent,
    child: Center(
      child: Ink(
        decoration: const ShapeDecoration(
          color: Color(0xFF37A557),
          shape: CircleBorder(),
        ),
        child: IconButton(
          icon: const Icon(Icons.send),
          color: Colors.white,
          onPressed: () {},
        ),
      ),
    ),
  );
}
