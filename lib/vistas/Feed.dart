import 'package:flutter/material.dart';

import '../widgets/widgets.dart';




class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFF031630),
      appBar: appBar("PosIT",'https://img.freepik.com/vector-premium/papel-nota-ilustracion-icono-vector-dibujos-animados-lapiz_480044-364.jpg?w=740', context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [            
              post('https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
              'Jen0101010','https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',10),
              post('https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
              'Jen0101010','https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',10),
              post('https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
              'Jen0101010','https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',10),
              post('https://img.freepik.com/fotos-premium/joven-mujer-bonita-caucasica-blanco_1187-75943.jpg?w=2000',
              'Jen0101010','https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',10),
            ],
          ),
        ),
      ),
    );
  }
}