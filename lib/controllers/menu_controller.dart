
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

import '../helpers/other_helper.dart';
import '../helpers/prefs_helper.dart';
import '../services/api_service.dart';
import '../utils/App_Urls/app_urls.dart';


class MenuDataController extends GetxController {
  //TODO: Implement MenuController

  final count = 0.obs;

  bool isLoading = false;
  String? image;

  String selectedPet = 'Choose Your Pet';
  final List<String> pets = ['Choose Your Pet', 'Dog', 'Cat', 'Bird', 'Fish'];

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController microchipNumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  selectPet(value) {
    selectedPet = value ?? 'Choose Your Pet';
    update();
  }

  selectImage() async {
    image = await OtherHelper.openGallery();
    update();
  }

  Future<void> addLostPetRepo() async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "userId": PrefsHelper.userId,
      "forPets": "lost",
      "age": ageController.text,
      "breed": breedController.text,
      "sex": genderController.text,
      "address": addressController.text,
      "description": descriptionController.text,
      "petName": nameController.text,
    };

    var response = await ApiService.multipartRequest(
      url: AppUrls.petAdd,
      body: body,
      imageName: "photo",
      imagePath: image,
    );

    if (response.statusCode == 200) {
      print.log(response.body) ;
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
