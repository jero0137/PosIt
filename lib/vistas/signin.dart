import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posit/provider/providers/user.dart';
import 'package:posit/utils/Authentication.dart';
import 'package:posit/vistas/login.dart';
import 'package:posit/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../utils/Functions.dart';
import '../widgets/cabecera.dart';
import '../widgets/campoFormulario.dart';
import 'controlador.dart';

class signin extends StatelessWidget {
  signin({Key? key}) : super(key: key);

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerConfirmarPass =
      TextEditingController();
  final TextEditingController _controllerUsuario = TextEditingController();
  final TextEditingController _controllerNombre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const cabecera(
        titulo: 'PosIT',
      ),
      body: Center(
          child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF031630),
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 2,
            ),
            SizedBox(
              width: 257,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Ingrese su nombre completo',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                controller: _controllerNombre,
              ),
            ),
            const Spacer(flex: 2),
            SizedBox(
              width: 257,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Ingrese un correo',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                controller: _controllerEmail,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            SizedBox(
              width: 257,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Ingrese un usuario',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                controller: _controllerUsuario,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            SizedBox(
              width: 257,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Ingrese una contraseña',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                obscureText: true,
                controller: _controllerPass,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            SizedBox(
              width: 257,
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Confirme la contraseña',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                autofocus: false,
                obscureText: true,
                controller: _controllerConfirmarPass,
              ),
            ),
            Spacer(
              flex: 2,
            ),
            SizedBox(
              child: button(() {
                if (Functions.contrasenasIguales(
                    _controllerPass.text, _controllerConfirmarPass.text)) {
                  Authentication.register(
                    email: _controllerEmail.text,
                    nombre: _controllerNombre.text,
                    pass: _controllerPass.text,
                    usuario: _controllerUsuario.text,
                  );

                  //context.read<User>().Inicializar();

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return controlador();
                  }));
                } else {}
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
