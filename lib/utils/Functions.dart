import 'package:flutter/material.dart';

class Functions {
  static bool contrasenasIguales(String pass, String pass2) {
    return pass == pass2;
  }

  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }
}
