import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/Authentication.dart';
import '../utils/Functions.dart';
import '../utils/Validator.dart';
import '../widgets/cabecera.dart';
import '../widgets/widgets.dart';
import 'login.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

final TextEditingController _controllerEmail = TextEditingController();
final TextEditingController _controllerPass = TextEditingController();
final TextEditingController _controllerConfirmarPass = TextEditingController();
final TextEditingController _controllerUsuario = TextEditingController();
final TextEditingController _controllerNombre = TextEditingController();
final TextEditingController _controllerDescripcion = TextEditingController();
File? _selectedPicture;

class _signinState extends State<signin> {
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
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 257,
                      child: TextFormField(
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
                        validator: (String? value) =>
                            Validator.validateField(value: value!),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 257,
                      child: TextFormField(
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
                        validator: (String? value) =>
                            Validator.validateField(value: value!),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 257,
                      child: TextFormField(
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
                        validator: (String? value) =>
                            Validator.validateField(value: value!),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        alignment: Alignment.center,
                        width: 320,
                        height: 240,
                        margin: const EdgeInsets.only(bottom: 5, top: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 220,
                              margin: const EdgeInsets.only(bottom: 5, top: 5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Color.fromRGBO(133, 130, 229, 90),
                              ),
                              child: Column(children: [
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  child: GestureDetector(
                                    child: Image(
                                      image: getFotoPerfil(),
                                      height: 200,
                                      width: 200,
                                    ),
                                    onTap: () async {
                                      var image = await ImagePicker().pickImage(
                                          source: ImageSource.gallery);

                                      setState(() {
                                        _selectedPicture = File(image!.path);
                                      });
                                    },
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        )),
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
                          child: TextFormField(
                            decoration: InputDecoration.collapsed(
                              fillColor: Colors.white,
                              hintText: 'Añade una descripción para tu perfil',
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            textAlign: TextAlign.start,
                            maxLines: null,
                            style: TextStyle(color: Colors.white),
                            autofocus: false,
                            controller: _controllerDescripcion,
                            validator: (String? value) =>
                                Validator.validateField(value: value!),
                          ),
                        ),
                      ]),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 257,
                      child: TextFormField(
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
                        validator: (String? value) =>
                            Validator.validateField(value: value!),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 257,
                      child: TextFormField(
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
                        validator: (String? value) =>
                            Validator.validateField(value: value!),
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
                                  fotoPerfil: _selectedPicture!,
                                  email: _controllerEmail.text,
                                  descripcion: _controllerDescripcion.text,
                                  nombre: _controllerNombre.text,
                                  pass: _controllerPass.text,
                                  usuario: _controllerUsuario.text,
                                  context: context)
                              .then((value) => Navigator.pop(context));
                        } else
                          Functions.showSnackBar(
                              context, "Las contraseñas deben de ser iguales");
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
              ),
            )),
      ),
    );
  }
}

ImageProvider<Object> getFotoPerfil() {
  if (_selectedPicture != null) return Image.file(_selectedPicture!).image;
  return Image.network(
          "https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/agregarFoto.png?alt=media&token=f06b7a9c-5962-4b03-bf2d-facfae4b7bbd")
      .image;
}
