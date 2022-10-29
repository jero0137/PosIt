import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posit/widgets/widgets.dart';

class agregarpost extends StatelessWidget{
  const agregarpost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      appBar: cabeceraFlecha2('NUEVA PUBLICACIÓN',context),
      body: Center(
        child: Column(
          children: [
            postAgregar(''),
          ]
        ),
      ),
    );
  }
}