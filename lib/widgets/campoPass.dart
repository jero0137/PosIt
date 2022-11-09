import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class campoPass extends StatelessWidget {
  final String hint;
  const campoPass({super.key, required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: hint,
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
    );
  }
}
