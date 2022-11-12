import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:posit/widgets/widgets.dart';

class campoLinea extends StatelessWidget {
  final String descripcion;
  const campoLinea({super.key,required this.descripcion});

  @override
  Widget build(BuildContext context) {
    return TextField(
    decoration: InputDecoration.collapsed(
      fillColor: Colors.white,
      hintText: descripcion,
      hintStyle: TextStyle(color: Colors.white),
    ),
    textAlign: TextAlign.start,
    maxLines: null,
    style: TextStyle(color: Colors.white),
    autofocus: false,
  );
  }
}