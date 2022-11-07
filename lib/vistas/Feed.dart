import 'package:flutter/material.dart';
import 'package:posit/widgets/post.dart';

import '../widgets/widgets.dart';




class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      backgroundColor: Color(0xFF031630),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [     
              post(
                fotoPerfil: 'https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000', 
                usuario: 'Jen0101010', 
                fotoPost: 'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000', 
                cantidadLikes: 9, 
                cantidadComentarios: 8, 
                descripcion: 'Texto de prueba para un post, foto posando para un post', 
                context: context),
              post(
                fotoPerfil: 'https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000', 
                usuario: 'Jen0101010', 
                fotoPost: 'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000', 
                cantidadLikes: 9, 
                cantidadComentarios: 8, 
                descripcion: 'Texto de prueba para un post, foto posando para un post', 
                context: context)  
            ],
          ),
        ),
      ),
    );
  }
}