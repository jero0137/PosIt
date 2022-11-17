import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:posit/widgets/post.dart';

import '../utils/Database.dart';
import '../widgets/widgets.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF031630),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: StreamBuilder<QuerySnapshot>(
            stream: Database.readPost(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text(
                    'Hubo un error en la carga. Por favor intenta nuevamente en un rato');
              } else if (snapshot.hasData || snapshot.data != null) {
                return ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 16.0),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var postInfo = snapshot.data!.docs[index].data()!as Map<String, dynamic>;
                    String docID = snapshot.data!.docs[index].id;
                    String infusuario = postInfo['nombreUsuario'];
                    String fotop = postInfo['foto'];
                    String fotoperfilp = postInfo['fotoperfil'];
                    String descripcionp = postInfo['descripcion'];
                    int cantidadLikes = postInfo['cantidadLikes'];
                    int cantidadComentarios = postInfo['cantidadComentarios'];

                    return post(
                      docpostID: docID,
                      fotoPerfil: fotoperfilp,
                      usuario: infusuario, 
                      fotoPost: fotop, 
                      cantidadLikes: cantidadLikes, 
                      cantidadComentarios: cantidadComentarios, 
                      descripcion: descripcionp, 
                      context: context
                    );
                  }
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black,
                  ),
                ),
                
              );
            },
          ),
        ), 
      ),
    );
  }
  void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
}
