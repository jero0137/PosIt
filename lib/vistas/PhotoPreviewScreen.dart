

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPreviewScreen extends StatefulWidget {
  
  @override
  _PhotoPreviewScreenState createState() => _PhotoPreviewScreenState();
}
class _PhotoPreviewScreenState extends State<PhotoPreviewScreen> {
  var imagePath;
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: Column(children: [
        Text('seleccione imagen'),
        (imagePath==null)?Container(): Image.file(File(imagePath)),
        RaisedButton(
          child: Text('load image'),
          onPressed:() async{
            final ImagePicker _picker = ImagePicker();
            PickedFile? _pickedFile = await _picker.getImage(source: ImageSource.camera);
            imagePath = _pickedFile?.path;
            setState(() {
              
            });
          })
      ],)
          
    );
  }
}