import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageController {
  static Future pickImageByGallery() async {
    var imageFile =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      return File(imageFile.path);
    }
  }
}
