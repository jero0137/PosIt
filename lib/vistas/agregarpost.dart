//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posit/widgets/widgets.dart';

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
            postAgregar(''),
            descripcion('Añade una descripción'),
           // Spacer(),
            SizedBox(
              child: button(() {}, "Agregar post"),
            ),
           // Spacer(),
          ]),
        ),
      ),
    );
  }
}
