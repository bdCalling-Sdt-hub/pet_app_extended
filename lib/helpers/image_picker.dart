import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'dart:developer' as print;


class ImagePickerController extends GetxController {

  static ImagePickerController get instance => Get.put(ImagePickerController());

  var selectedImagePath = ''.obs;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Read the image
      img.Image? image = img.decodeImage(await imageFile.readAsBytes());

      if (image != null) {
        // Resize the image (adjust the width as needed)
        img.Image resizedImage = img.copyResize(image, width: 1080);  // Set desired width

        // Get a temporary directory for the resized image
        final tempDir = await getTemporaryDirectory();
        final tempPath = path.join(tempDir.path, '${DateTime.now().millisecondsSinceEpoch}.jpg');

        // Save the resized image to a temporary file
        File resizedFile = File(tempPath)..writeAsBytesSync(img.encodeJpg(resizedImage, quality: 85));  // Adjust quality

        // Update with the resized image path
        selectedImagePath.value = resizedFile.path;
      }
    } else {
      selectedImagePath.value = '';  // Handle when no image is selected
    }
  }
}
