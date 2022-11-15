import 'dart:developer';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class PickImage {
  static Future<File?> pickImageGallery({required ImageSource source}) async {
    late File image;
    try {
      final pickedImage = await ImagePicker().pickImage(
        source: source,
      );

      if (pickedImage == null) return null;

      image = File(pickedImage.path);
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
    return image;
  }
}