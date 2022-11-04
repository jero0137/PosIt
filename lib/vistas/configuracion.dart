import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/providers/user.dart';
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
                  child: campo(context.watch<User>().getNombre()),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campo(context.watch<User>().getCorreo()),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campo(context.watch<User>().getUsuario()),
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
                  height: 20,
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
