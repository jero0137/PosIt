import 'package:flutter/material.dart';
import 'package:posit/utils/Authentication.dart';
import 'package:posit/vistas/login.dart';
import 'package:posit/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../provider/providers/user.dart';
import '../utils/Functions.dart';
import '../widgets/cabecera.dart';
import 'controlador.dart';

class signin extends StatelessWidget {
  signin({Key? key}) : super(key: key);

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerConfirmarPass =
      TextEditingController();
  final TextEditingController _controllerUsuario = TextEditingController();
  final TextEditingController _controllerNombre = TextEditingController();
  final TextEditingController _controllerDescripcion = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const cabecera(
        titulo: 'PosIT',
      ),
      body: Center(
        child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF031630),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
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
                  SizedBox(
                    height: 20,
                  ),
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
                  SizedBox(
                    height: 20,
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      child: Container(
                    width: 320,
                    height: 240,
                    margin: const EdgeInsets.only(bottom: 5, top: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.transparent),
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            fillColor: Colors.white,
                            hintText: 'Añade una descripción',
                            hintStyle: TextStyle(color: Colors.white),
                          ),
                          textAlign: TextAlign.start,
                          maxLines: null,
                          style: TextStyle(color: Colors.white),
                          autofocus: false,
                          controller: _controllerDescripcion,
                        ),
                      ),
                    ]),
                  )),
                  SizedBox(
                    height: 20,
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
                  SizedBox(
                    height: 20,
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
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: button(() async {
                      if (Functions.contrasenasIguales(_controllerPass.text,
                          _controllerConfirmarPass.text)) {
                        await Authentication.register(
                            email: _controllerEmail.text,
                            descripcion: _controllerDescripcion.text,
                            nombre: _controllerNombre.text,
                            pass: _controllerPass.text,
                            usuario: _controllerUsuario.text,
                            context: context);

                        if (Authentication.entro == true) {
                          Provider.of<User>(context, listen: false)
                              .inicializar();

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return controlador();
                          }));
                        }
                      } else {
                        showSnackBar(context, 'Contraseñas iguales');
                      }
                    }, "Registrarse"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 85,
                      ),
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
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
