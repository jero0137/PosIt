import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providers/user.dart';
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

/*
Container Escribircomentario(String texto) {
  return Container(
    
    width: 300,
    height: 50,
    margin: const EdgeInsets.only(bottom: 5, top: 5),
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.transparent
    ),
    child: Column(children: [
      
      camposinlinea(' ' + texto),
    ]),
  );
}
*/
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