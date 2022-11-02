import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/widgets.dart';

class configuracion extends StatefulWidget {
  const configuracion({super.key});

  @override
  State<configuracion> createState() => _configuracionState();
}

class _configuracionState extends State<configuracion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      appBar: cabeceraFlecha2('Configuración', context),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campo('Julian Ortiz'),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campo('Julian.ortix@corre.com'),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campo('Julio_Ortiz'),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campo('Contraseña'),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campo('Nueva Contraseña'),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: 150,
                      child: button(() {}, "Guardar Cambios"),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: 150,
                      child: button(() {}, "Descartar"),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
