import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posit/widgets/widgets.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: cabecera("PosIT"),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF031630),
        ),
        child: Column(
          children: [
            Spacer(),
            Row(
              children: [
                Spacer(),
                Image.network(
                  'https://assets.stickpng.com/images/585e4beacb11b227491c3399.png',
                  fit: BoxFit.contain,
                  height: 142,
                  width: 152,
                ),
                Spacer()
              ],
            ),
            Spacer(
              flex: 1,
            ),
            SizedBox(width: 257, child: campo("Ingrese su usuario")),
            Spacer(),
            SizedBox(width: 257, child: campo("Ingrese su contraseña")),
            Spacer(
              flex: 2,
            ),
            SizedBox(
              child: button(() {}, "Iniciar sesion"),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Spacer(),
                Text(
                  '¿No tienes cuenta?',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
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
