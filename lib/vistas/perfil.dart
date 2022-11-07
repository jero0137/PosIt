import 'package:flutter/material.dart';
import 'package:posit/widgets/imagenCircular.dart';
import 'package:posit/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../provider/providers/user.dart';
import '../widgets/post.dart';

class perfil extends StatelessWidget {
  perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      //AppBar
      //Body
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF031630),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Text(
                  context.watch<User>().getNombre(),
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              imagenCircular(
                  width: 150, imagen: context.watch<User>().getFoto()),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: Container(
                  width: 300,
                  //Creo que queda mejor sin borde
                  /*
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        */
                  child: Text(
                    "Chococrispi con yogurt de guayaban",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              post(
                  fotoPerfil:
                      'https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
                  usuario: 'Jen0101010',
                  fotoPost:
                      'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',
                  cantidadLikes: 9,
                  cantidadComentarios: 8,
                  descripcion: 'Texto de prueba para un post, foto posando para un post',
                  context: context),
              post(
                  fotoPerfil:
                      'https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
                  usuario: 'Jen0101010',
                  fotoPost:
                      'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',
                  cantidadLikes: 9,
                  cantidadComentarios: 8,
                  descripcion: 'Texto de prueba para un post, foto posando para un post',
                  context: context),
              post(
                  fotoPerfil:
                      'https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
                  usuario: 'Jen0101010',
                  fotoPost:
                      'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',
                  cantidadLikes: 9,
                  cantidadComentarios: 8,
                  descripcion: 'Texto de prueba para un post, foto posando para un post',
                  context: context)
            ]),
          ),
        ),
      ),
    );
  }
}
