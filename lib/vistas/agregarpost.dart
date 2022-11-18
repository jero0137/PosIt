import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posit/utils/Database.dart';
import 'package:posit/utils/pick_image.dart';
import 'package:posit/widgets/descripcion.dart';
import 'package:posit/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../provider/providers/UserProvider.dart';
import '../widgets/campoLinea.dart';

class agregarpost extends StatefulWidget {
  agregarpost({super.key});

  @override
  State<agregarpost> createState() => _agregarpostState();
}

class _agregarpostState extends State<agregarpost> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerDescripcion = TextEditingController();
    var nombre = context.watch<UserProvider>().getNombre();
    var foto = context.watch<UserProvider>().getFoto();
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            postAgregar(),
            SizedBox(
                //child: descripcion(texto: 'Añade una descripción')
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
            SizedBox(height: 20),
            SizedBox(
              child: button(() async {
                Database.addPost(
                    usuario: nombre,
                    fotoPost:
                      'https://img.freepik.com/foto-gratis/retrato-hermoso-mujer-joven-posicion-pared-gris_231208-10760.jpg?w=2000',
                    fotoperfil: foto,
                    descripcion: _controllerDescripcion.text);
              }, "Añadir"),
            ),
          ]),
        ),
      ),
    );
  }
}

Widget postAgregar() {
  return Container(
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
          Spacer(flex: 1),
          Container(
            width: 300,
            height: 220,
            margin: const EdgeInsets.only(bottom: 5, top: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromRGBO(133, 130, 229, 90),
            ),
            child: Column(children: [
              SizedBox(
                height: 70,
              ),
              SizedBox(
                child: botonFoto(),
              ),
            ]),
          ),
          Spacer(flex: 1)
        ],
      ));
}

Widget botonFoto() {
  return GestureDetector(
      child: Container(
    child: Center(
      child: Ink(
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
        ),
        child: IconButton(
          iconSize: 50.0,
          icon: const Icon(Icons.photo),
          color: Colors.white,
          onPressed: () {
            PickImage.pickImageGallery(source: ImageSource.gallery)
                .then((File) {});
          },
        ),
      ),
    ),
  ));
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
