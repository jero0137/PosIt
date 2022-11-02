import 'package:flutter/material.dart';
import 'package:posit/vistas/agregarpost.dart';
import 'package:posit/vistas/configuracion.dart';

import '../widgets/widgets.dart';
import 'Feed.dart';
import 'perfil.dart';

class controlador extends StatefulWidget {
  const controlador({super.key});

  @override
  State<controlador> createState() => _controladorState();
}

class _controladorState extends State<controlador> {

  int currentIndex = 0;
  final screens = [Feed(),agregarpost(),perfil(),configuracion()]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppbar("PosIT",'https://img.freepik.com/vector-premium/papel-nota-ilustracion-icono-vector-dibujos-animados-lapiz_480044-364.jpg?w=740'),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = (index)),
        backgroundColor: const Color.fromRGBO(133, 130, 229, 90),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'New Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Configuracion',
          ),
        ],
      ),
      body: screens[currentIndex],
    
    );
  }
}