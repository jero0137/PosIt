import 'package:flutter/material.dart';
import 'package:posit/utils/Database.dart';
import 'package:posit/vistas/comentarios.dart';

import 'imagenCircular.dart';

class post extends StatelessWidget {
  final String docpostID;
  final String fotoPerfil;
  final String usuario;
  final String fotoPost;
  final int cantidadLikes;
  final int cantidadComentarios;
  final BuildContext context;
  final String descripcion;

  const post(
      {super.key,
      required this.docpostID,
      required this.fotoPerfil,
      required this.usuario,
      required this.fotoPost,
      required this.cantidadLikes,
      required this.cantidadComentarios,
      required this.descripcion,
      required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 390,
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.transparent,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: const Color.fromRGBO(133, 130, 229, 90),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              imagenCircular(width: 50, imagen: fotoPerfil),
              const SizedBox(
                width: 10,
              ),
              Text(
                usuario,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: 270,
            height: 250,
            child: Image.network(
              fotoPost,
              fit: BoxFit.cover,
            ),
          ),
          
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              //
              GestureDetector(
                onTap: () => {
                  Database.updateLikes(
                      cantidadLikes: cantidadLikes, docID: docpostID),
                },
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/like.png?alt=media&token=033e25e3-4e8f-444c-8d36-f6666ddb1123',
                  width: 30,
                  height: 30,
                ),
              ),
              //

              const SizedBox(
                width: 6,
              ),
              Text(
                '$cantidadLikes',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(
                flex: 2,
              ),
              GestureDetector(
                onTap: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => comentarios(
                                docpostID: docpostID,
                              )))
                },
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/keyboard.png?alt=media&token=fd323da9-47f5-490d-9647-fd3bef130271',
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                '$cantidadComentarios',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(5),
            child: Text(
              descripcion,
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
