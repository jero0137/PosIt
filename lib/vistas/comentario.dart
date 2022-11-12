import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providers/user.dart';
import '../widgets/imagenCircular.dart';
import '../widgets/widgets.dart';

class comentario extends StatelessWidget {
  const comentario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      appBar: cabeceraFlecha('COMENTARIOS', context),
      body: Center(
        child: SingleChildScrollView(
          child:Column(
            children: [
              Column(
                children: [
                  comentarios(context.watch<User>().getFoto(),'jenn','textooooo'),
                  comentarios(context.watch<User>().getFoto(), 'negritolindo22', 'como estaás de linda'),
                  comentarios(context.watch<User>().getFoto(), 'prueba', 'holaaa'),
                  comentarios(context.watch<User>().getFoto(), 'lindo22', 'como estaás de linda'),
                  comentarios(context.watch<User>().getFoto(), 'negritolindo22', 'como estaás de linda'),
                  comentarios(context.watch<User>().getFoto(), 'negritolindo22', 'como estaás de linda'),
                  comentarios(context.watch<User>().getFoto(), 'negritolindo22', 'como estaás de linda'),

                  Row(children: [
                    SizedBox(
                      width: 100,
                    ),
                    SizedBox(
                      width: 180,
                      child: camposinlinea(' ' + 'Escribe un comentario'),
                    ),
                    
                    SizedBox(
                      width: 50,
                      child: botonConIcono(context)
                    ),
                   
                  ],),
                SizedBox(
                  height: 20,
                ),  
                ]  
                
              ),
              
              
            ]
            
            
            
          ),
          
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

Widget comentarios(String foto, String usuario, String texto) {
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