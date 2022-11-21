import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:posit/widgets/imagenCircular.dart';
import 'package:posit/widgets/infoUser.dart';
import 'package:posit/widgets/postPerfil.dart';
import '../utils/Database.dart';
import 'package:provider/provider.dart';

import '../provider/providers/UserProvider.dart';

class perfil extends StatelessWidget {
  perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nombre = context.watch<UserProvider>().getNombre();
    var foto = context.watch<UserProvider>().getFoto();
    var descripcion = context.watch<UserProvider>().getDescripcion();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: infoUser(
        nombre: nombre,
        imagen: foto,
        descripcion: descripcion,
      ),
      backgroundColor: Color(0xFF031630),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF031630),
          ),
          child: Padding(
              padding: const EdgeInsets.all(12),
              child: StreamBuilder<QuerySnapshot>(
                stream: Database.readPostPerfil(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text(
                        'Hubo un error en la carga. Por favor intenta nuevamente en un rato');
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return ListView.separated(
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10.0),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var postInfo = snapshot.data!.docs[index].data()!
                              as Map<String, dynamic>;

                          String docID = snapshot.data!.docs[index].id;
                          String fotoperfilp = postInfo['fotoperfil'];
                          String fotop = postInfo['fotopost'];
                          String descripcionp = postInfo['descripcion'];
                          String usuario = postInfo['usuario'];
                          int cantidadLikes = postInfo['cantidadlikes'];
                          int cantidadComentarios =
                              postInfo['cantidadcomentarios'];

                          return postPerfil(
                              docpostID: docID,
                              fotoPerfil: fotoperfilp,
                              usuario: usuario,
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
              )),
        ),
      ),
    );
  }
}
