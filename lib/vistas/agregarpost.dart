//import 'dart:html';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posit/widgets/descripcion.dart';
import 'package:posit/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../provider/providers/user.dart';
import '../widgets/imagenGaleria.dart';

class agregarpost extends StatelessWidget {
  const agregarpost({super.key});

/*
  imgFromCamera() async {
    
  File image = await ImagePicker.pickImage(
      source: ImageSource.camera, imageQuality: 50
  );
  setState(() {
    image = image;
  });
}

_imgFromGallery() async {
  File image = await ImagePicker.pickImage(
      source: ImageSource.gallery, imageQuality: 50
  );

  setState(() {
    image = image;
  });
}
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      body: Center(
        child: SingleChildScrollView(
          child: Column(children: [
            postAgregar(' '),
            SizedBox(
              child: descripcion(texto: 'Añade una descripción')
            ),
           
            SizedBox(
              child: imagenGaleria()

            ),
           
          ]),
        ),
      ),
    );
  }
}


/*

Future pickImageGallery() async{
  
    final image = await
    ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null) return;

    final newImage = File(image.path);
    
}*/

Widget postAgregar(String foto) {
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
              //Aqui va agregar foto
            ]),
          ),
          Spacer(flex: 1)
        ],
      ));
}