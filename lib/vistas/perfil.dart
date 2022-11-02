import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:posit/vistas/configuracion.dart';
import 'package:posit/widgets/widgets.dart';

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
                  "UserName",
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
                  'https://preview.redd.it/4it14bdxt4d81.jpg?auto=webp&s=401898ae73f8ccc53d8d921cf0c38540eade4b28',
                  150),
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
                  'https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
                  'Jen0101010',
                  'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',
                  10),
              post(
                  'https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
                  'Jen0101010',
                  'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',
                  10),
              post(
                  'https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
                  'Jen0101010',
                  'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',
                  10),
              post(
                  'https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
                  'Jen0101010',
                  'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',
                  10),
            ]),
          ),
        ),
      ),
    );
  }
}
