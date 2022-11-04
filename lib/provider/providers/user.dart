import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class User  with ChangeNotifier, DiagnosticableTreeMixin {
  String _nombre = 'Julian Ortiz Uribe';
  String _usuario = 'Ortiz_Uribe';
  String _correo = 'Julian@gmail.com';
  String _linkFoto = 
  'https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/FotoPerfil.png?alt=media&token=e4126886-2c3d-4b0e-8fb8-8fc80321d62b';

  void setNombre(String nuevoNombre){
    _nombre = nuevoNombre;
    notifyListeners();
  }

  String getNombre(){
    return _nombre;
  }

  void setUsuario(String nuevoUsuario){
    _usuario = nuevoUsuario;
    notifyListeners();
  }

  String getUsuario(){
    return _usuario;
  }

  void setCorreo(String nuevoCorreo){
    _correo = nuevoCorreo;
    notifyListeners();
  }

  String getCorreo(){
    return _correo;
  }

  void setFoto (String nuevaFoto){
    _linkFoto = nuevaFoto;
    notifyListeners();
  }

  String getFoto(){
    return _linkFoto;
  }


}