import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posit/widgets/imagenCircular.dart';
import 'package:posit/widgets/postPerfil.dart';
import '../utils/Database.dart';
import '../widgets/post.dart';
import 'package:provider/provider.dart';

import '../provider/providers/UserProvider.dart';

class perfil extends StatelessWidget {
  perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF031630),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF031630),
          ),
          child: ListView(children: [
            Column(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  imagenCircular(
                      width: 150, imagen: context.watch<UserProvider>().getFoto()),
                  SizedBox(
                    height: 20,
                  ),
                  Spacer(),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: Text(
                          context.watch<UserProvider>().getNombre(),
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        child: Container(
                          width: 200,
                          child: Text(
                            context.watch<UserProvider>().getDescripcion(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //listapost
              SizedBox(
                  height: (MediaQuery.of(context).size.height),
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: Database.readPostPerfil(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text(
                                'Hubo un error en la carga. Por favor intenta nuevamente en un rato');
                          } else if (snapshot.hasData ||
                              snapshot.data != null) {
                            return ListView.separated(
                                //shrinkWrap:true,
                                //scrollDirection: Axis.vertical,

                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 16.0),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  var postInfo = snapshot.data!.docs[index]
                                      .data()! as Map<String, dynamic>;
                                  String docID = snapshot.data!.docs[index].id;
                                  String infusuario = postInfo['nombreUsuario'];
                                  String fotop = postInfo['foto'];
                                  String fotoperfilp = postInfo['fotoperfil'];
                                  String descripcionp = postInfo['descripcion'];
                                  int cantidadLikes = postInfo['cantidadLikes'];
                                  int cantidadComentarios =
                                      postInfo['cantidadComentarios'];

                                  return post(
                                      docpostID: docID,
                                      fotoPerfil: fotoperfilp,
                                      usuario: infusuario,
                                      fotoPost: fotop,
                                      cantidadLikes: cantidadLikes,
                                      cantidadComentarios: cantidadComentarios,
                                      descripcion: descripcionp,
                                      context: context);
                                });
                          }
                          return const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.black,
                              ),
                            ),
                          );
                        },
                      ))),
            ]),
          ]),
        ),
      ),
    );
  }
}
