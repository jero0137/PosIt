class Validator {
  static String? validateField({required String value}) {
    if (value.isEmpty) {
      return '¡Esto no puede estar vacío!';
    } else if (value.length < 7) {
      return 'Ingresa más de siete caracteres';
    }

    return null;
  }

  static String? validateUserID({required String uid}) {
    if (uid.isEmpty) {
      return 'El ID no puede estar vacío';
    } else if (uid.length <= 3) {
      return 'El ID debe ser mayor a 3 caracteres';
    }

    return null;
  }

  static bool validateAll({required List<String?> fields}) {
    for (var element in fields) {
      if (validateField(value: element ?? '') != null) {
        return false;
      }
    }
    return true;
  }
}