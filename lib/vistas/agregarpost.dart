
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:posit/utils/Database.dart';

import 'package:posit/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../provider/providers/UserProvider.dart';

class agregarpost extends StatefulWidget {
  const agregarpost({super.key});

  @override
  State<agregarpost> createState() => _agregarpostState();
}

File? _selectedPicture;

class _agregarpostState extends State<agregarpost> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controllerDescripcion = TextEditingController();
    var nombre = context.watch<UserProvider>().getUsuario();
    var foto = context.watch<UserProvider>().getFoto();
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
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
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromRGBO(133, 130, 229, 90),
                      ),
                      child: Column(children: [
                        SizedBox(height: 10,),
                        SizedBox(
                          
                          child: GestureDetector(
                              child: Image(
                                image: getFoto(),
                                height: 200,
                                width: 200,
                              ),
                                  onTap: () async {
                                    var image = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);

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
                    context: context,
                    usuario: nombre,
                    fotoDelPost:
                        _selectedPicture,
                    fotoperfil: foto,
                    descripcion: _controllerDescripcion.text);
              }, "Añadir"),
            ),
            SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}

ImageProvider<Object> getFoto(){
  if(_selectedPicture != null) return Image.file(_selectedPicture!).image;
    return Image.network("https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/agregarFoto.png?alt=media&token=f06b7a9c-5962-4b03-bf2d-facfae4b7bbd").image;
}
