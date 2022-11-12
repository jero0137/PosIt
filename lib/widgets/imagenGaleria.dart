import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:posit/widgets/widgets.dart';
import 'package:image_picker/image_picker.dart';

class imagenGaleria extends StatefulWidget {
  
  @override
  _imagenGaleriaState createState() => _imagenGaleriaState();
}

class _imagenGaleriaState extends State<imagenGaleria> {
  
  
  final picker = ImagePicker();
  Future selImagen() async{
    var pickedFile;
    File imagen;

      pickedFile= await picker.pickImage(source: ImageSource.gallery);
    
    setState(() {
      if(pickedFile != null){
        imagen = File(pickedFile.path);
      }else{
        print('No seleccionaste');
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      imagen == null ? Center(): imagenGaleria.
    );
  }
  
}