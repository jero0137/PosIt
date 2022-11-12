import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:posit/widgets/campoLinea.dart';

class descripcion extends StatelessWidget {
  final String texto;
  const descripcion({super.key,required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
    width: 320,
    height: 240,
    margin: const EdgeInsets.only(bottom: 5, top: 5),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.transparent),
    child: Column(children: [
      SizedBox(
        height: 10,
      ),
      SizedBox(child:campoLinea (descripcion: texto))
      
    ]),
  );
  }
}

