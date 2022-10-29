import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posit/widgets/widgets.dart';

class editarpost extends StatelessWidget{
  const editarpost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      appBar: cabeceraFlecha('EDITAR PUBLICACIÓN',context),
      body: Center(
        child: Column(
          children: [
            postAgregar(''), 
            descripcion('Editar descripción'),//Aquí va la descripción anterior
            Spacer(),
            SizedBox(
                child: button(() {}, "Guardar cambios"),
            ),
            Spacer(),
          ]
        ),
      ),
    );
  }
}