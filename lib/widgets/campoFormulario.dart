import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class campoFormulario extends StatelessWidget {

  final String hint;
  const campoFormulario({super.key,required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
    decoration: InputDecoration(
      fillColor: Colors.white,
      hintText: hint,
      hintStyle: const TextStyle(color: Colors.white),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    textAlign: TextAlign.center,
    style: const TextStyle(color: Colors.white),
    autofocus: false,
  );
  }
}