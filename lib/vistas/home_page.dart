import 'package:flutter/material.dart';
import 'package:posit/utils/Authentication.dart';
import 'package:posit/vistas/ChargingView.dart';
import 'package:posit/vistas/Feed.dart';
import 'package:posit/vistas/controlador.dart';
import 'package:posit/vistas/login.dart';
import 'package:provider/provider.dart';

import '../provider/providers/UserProvider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      //Hacemos un streamBuilder para saber el estado de login de nuestro user y así mantener la sesión luego de que se cierre la app
      stream: Authentication.streamFirebase(),
      //El stream lo metimos en una clase llamada CustomAuth para tener allá los métodos de Auth
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //Snapshot tiene el objeto user de firebase auth
        //Verificamos
        if (snapshot.hasError) {
          //En caso de que tenga error
          return const Text(
            "Ocurrió un error en la transmision de datos, disculpa la molestia, por favor reinicia la aplicación",
          );
        }
        if (snapshot.hasData) {
          //CUando tiene data, es decir cuando el usuario ya está logueado
          //Le decimos que llene la data del user desde la DB
          context.read<UserProvider>().inicializar(snapshot.data.uid);
          //Y que nos lleve a FeedPage
          return const controlador();
        } else if (snapshot.data == null) {
          //En caso de que no tenga datos, es decir lo envíamos a Loguearse
          return login();
        }
        return const ChargingView(
          //ChargingView es solo una vista que hice para unificar vistas de carga
          //Este es un return default, en caso de que ninguna verificación se cumpla
          text: "Cargando nuestra muy beautiful UI",
        );
      },
    );
  }
}