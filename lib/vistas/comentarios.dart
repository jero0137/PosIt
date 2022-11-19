import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posit/widgets/comentario.dart';
import 'package:provider/provider.dart';

import '../provider/providers/UserProvider.dart';
import '../utils/Database.dart';
import '../widgets/imagenCircular.dart';
import '../widgets/widgets.dart';

class comentarios extends StatelessWidget {
  final String docpostID;
  comentarios({super.key, required this.docpostID});

  final TextEditingController _controllerComment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var user = context.watch<UserProvider>().getUsuario();
    var foto = context.watch<UserProvider>().getFoto();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF031630),
      appBar: cabeceraFlecha('COMENTARIOS', context),
      body: Center(
        child: Container(
          child: ListView(children: [
            Column(children: [
              //listapost
              SizedBox(
                  height: (MediaQuery.of(context).size.height),
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: StreamBuilder<QuerySnapshot>(
                        stream: Database.readComentarios(docpostID),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return const Text(
                                'Hubo un error en la carga. Por favor intenta nuevamente en un rato');
                          } else if (snapshot.hasData ||
                              snapshot.data != null) {
                            return ListView.separated(
                                //shrinkWrap: true,
                                //scrollDirection: Axis.vertical,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 16.0),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  var commentInfo = snapshot.data!.docs[index]
                                      .data()! as Map<String, dynamic>;
                                  String foto = commentInfo['foto'];
                                  String texto = commentInfo['texto'];
                                  String usuario = commentInfo['usuario'];

                                  return comentario(
                                    foto: foto,
                                    usuario: usuario,
                                    texto: texto,
                                  );
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
              Row(
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  SizedBox(
                    width: 180,
                    child: TextField(
                      controller: _controllerComment,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Agregue un comentario',
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      textAlign: TextAlign.start,
                      maxLines: null,
                      style: TextStyle(color: Colors.white),
                      autofocus: false,
                    ),
                  ),
                  SizedBox(
                      width: 50,
                      child: Material(
                        color: Colors.transparent,
                        child: Center(
                          child: Ink(
                            decoration: const ShapeDecoration(
                              color: Color(0xFF37A557),
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.send),
                              color: Colors.white,
                              onPressed: () {
                                Database.addComentario(
                                    foto: foto,
                                    usuario: user,
                                    texto: _controllerComment.text,
                                    postId: docpostID);
                              },
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
