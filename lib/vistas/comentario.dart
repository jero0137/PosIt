import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class comentario extends StatelessWidget {
  const comentario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      appBar: cabeceraFlecha('COMENTARIOS'),
      body: Center(
        child: SingleChildScrollView(
          child:Column(
            children: [
              Column(
                children: [
                  comentarios('','jenn','textooooo'),
                  comentarios('', 'negritolindo22', 'como estaás de linda'),
                  comentarios('', 'prueba', 'holaaa'),

                ]  
                
              ),
              SizedBox(
                child: button(() {}, "Escribe un comentario"),
              ),
            ]
            
            
          ),
          
        ),
        
      ),
      
    );
  }
}