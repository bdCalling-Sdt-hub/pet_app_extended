import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerController extends GetxController {

  static ImagePickerController get instance => Get.put(ImagePickerController());

  var selectedImagePath = ''.obs;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      selectedImagePath.value = '';
    }
  }
}
