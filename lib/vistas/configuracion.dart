import 'package:flutter/material.dart';
import 'package:posit/utils/Authentication.dart';
import 'package:posit/widgets/campoFormulario.dart';
import 'package:provider/provider.dart';

import '../provider/providers/UserProvider.dart';
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
                  child: campoFormulario(hint: context.watch<UserProvider>().getNombre(),),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campoFormulario(hint: context.watch<UserProvider>().getCorreo(),),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campoFormulario(hint: context.watch<UserProvider>().getUsuario(),),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campoFormulario(hint: 'Contraseña',),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 257,
                  child: campoFormulario(hint: 'Nueva contraseña'),
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
                SizedBox(height: 10,),
                Row(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      width: 330,
                      child: button(() {Authentication.signOut(context: context);}, "Cerrar sesión"),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                  ],
                ),
                SizedBox(height: 10,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
