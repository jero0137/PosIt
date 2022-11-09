import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class imagenCircular extends StatelessWidget {
  final double width;
  final String imagen;

  const imagenCircular({super.key, required this.width, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: width / 2,
      backgroundImage: NetworkImage(imagen),
    );
  }
}
