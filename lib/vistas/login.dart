import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posit/vistas/Feed.dart';
import 'package:posit/vistas/signin.dart';
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
                Icon(
                  Icons.account_circle_sharp,
                  size: 200,
                  color: Color.fromARGB(255, 255, 255, 255),
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
              child: button(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Feed();
                }));
              }, "Iniciar sesion"),
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
                SizedBox(
                    child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return signin();
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
                        child: Text("Registrarse",
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
