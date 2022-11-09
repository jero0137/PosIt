import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posit/vistas/login.dart';
import 'package:posit/widgets/widgets.dart';

import '../widgets/cabecera.dart';
import '../widgets/campoFormulario.dart';

class signin extends StatelessWidget {
  const signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: cabecera(
        titulo: 'PosIT',
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF031630),
        ),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            SizedBox(
                width: 257,
                child: campoFormulario(hint: 'Ingrese su nombre Completo')),
            Spacer(flex: 2),
            SizedBox(
                width: 257, child: campoFormulario(hint: 'Ingrese un correo')),
            Spacer(
              flex: 2,
            ),
            SizedBox(
                width: 257, child: campoFormulario(hint: 'Ingrese un usuario')),
            Spacer(
              flex: 2,
            ),
            SizedBox(
                width: 257,
                child: campoFormulario(hint: 'Ingrese una contraseña')),
            Spacer(
              flex: 2,
            ),
            SizedBox(
                width: 257,
                child: campoFormulario(hint: 'Confirme la contraseña')),
            Spacer(
              flex: 2,
            ),
            SizedBox(
              child: button(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return login();
                }));
              }, "Registrarse"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  '¿Ya tienes cuenta?',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return login();
                      }),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Color(0xFF031630),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                        child: Text("Iniciar sesion",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color(0xFF8582E5),
                                fontWeight: FontWeight.bold,
                                fontSize: 14))),
                  ),
                )),
                Spacer()
              ],
            ),
            Spacer(),
          ],
        ),
      )),
    );
  }
}
