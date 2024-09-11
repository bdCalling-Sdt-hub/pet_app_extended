import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class ImagePickerController extends GetxController {

  static ImagePickerController get instance => Get.put(ImagePickerController());

  var selectedImagePath = ''.obs;
  RxBool isLoading = false.obs;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source, imageQuality: 5);

    isLoading.value = true;
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
        selectedImagePath.value = imageFile.path;
      }
    else {
      selectedImagePath.value = '';  // Handle when no image is selected
    }
    isLoading.value = false;
  }
}
