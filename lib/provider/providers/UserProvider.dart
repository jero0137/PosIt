import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:posit/utils/Database.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _nombre = '';
  String _usuario = '';
  String _correo = '';
  String _linkFoto =
      'https://firebasestorage.googleapis.com/v0/b/posit-afbe6.appspot.com/o/FotoPerfil.png?alt=media&token=e4126886-2c3d-4b0e-8fb8-8fc80321d62b';
  String descripcion = '';



  Future<void> inicializar(String userUid) async {
    var valores = await Database.readInfoUser(userUid);
    setNombre(valores['name']);
    setUsuario(valores['Usuario']);
    setCorreo(valores['email']);
    setDescripcion(valores['descripcion']);
  }

  void setNombre(String nuevoNombre) {
    _nombre = nuevoNombre;
    notifyListeners();
  }

  String getNombre() {
    return _nombre;
  }

  void setUsuario(String nuevoUsuario) {
    _usuario = nuevoUsuario;
    notifyListeners();
  }

  String getUsuario() {
    return _usuario;
  }

  void setCorreo(String nuevoCorreo) {
    _correo = nuevoCorreo;
    notifyListeners();
  }

  String getCorreo() {
    return _correo;
  }

  void setFoto(String nuevaFoto) {
    _linkFoto = nuevaFoto;
    notifyListeners();
  }

  String getFoto() {
    return _linkFoto;
  }

  void setDescripcion(String newDescripcion) {
    descripcion = newDescripcion;
    notifyListeners();
  }

  String getDescripcion() {
    return descripcion;
  }
}
