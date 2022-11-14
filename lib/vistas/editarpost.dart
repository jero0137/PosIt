import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posit/widgets/descripcion.dart';
import 'package:posit/widgets/widgets.dart';

class editarpost extends StatelessWidget{
  const editarpost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      appBar: cabeceraFlecha('EDITAR PUBLICACIÓN',context),
      body: Center(
        child:SingleChildScrollView(
        child: Column(
          children: [
            postEditar(),
            SizedBox(
              child: descripcion(texto: 'Editar descripción') //Aquí va la descripción anterior
            ),
            
            
            SizedBox(
              child: button(() {}, 'Guardar cambios'),
            ),
            
          ]
        ),
      ),
      )
    );
  }
}
Widget postEditar() {
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
              //Aqui va la foto actual
            ]),
          ),
          Spacer(flex: 1)
        ],
      ));
}