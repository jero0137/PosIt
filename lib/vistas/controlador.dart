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
      appBar: mainAppbar("PosIT",'https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/FotoPerfil.png?alt=media&token=e4126886-2c3d-4b0e-8fb8-8fc80321d62b'),
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
            icon: Icon(Icons.manage_accounts),
            label: 'Configuracion',
          ),
        ],
      ),
      body: screens[currentIndex],
    
    );
  }
}