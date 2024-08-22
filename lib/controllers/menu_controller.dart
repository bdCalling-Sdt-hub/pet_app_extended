
import 'package:felpus/core/app_routes.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
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
  final List<String> pets = [
    'Choose Your Pet',
    'Dogs',
    'Cats',
    'Birds',
    'Fish',
    'Rodents',
    'Rabbits',
    'Reptiles',
    'Invertebrates',
    'Ferrets',
    'Hedgehogs',
    'Horse'
  ];


  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController microchipNumberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController petTypeController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  ///<<<============ Additional text editing field to add adaptation pet =================>>>

  TextEditingController healthConditionController = TextEditingController();
  TextEditingController neuterController = TextEditingController();
  TextEditingController vaccineController = TextEditingController();
  TextEditingController temperController = TextEditingController();
  TextEditingController activityLevelController = TextEditingController();
  TextEditingController behaviorController = TextEditingController();
  TextEditingController specialNeedsController = TextEditingController();
  TextEditingController petHistoryController = TextEditingController();
  TextEditingController contactInfoController = TextEditingController();

  selectPet(value) {
    selectedPet = value ?? 'Choose Your Pet';
    update();
    petTypeController.text = value;
  }

  selectImage() async {
    image = await OtherHelper.openGallery();
    update();
  }


  ///<<<=================== Add Lost/ Found Pet Repo ======================>>>
  Future<void> addLostOrFoundPetRepo({required String forPets}) async {
    isLoading = true;
    update();

    Map<String, String> header = {
      'Authorization': PrefsHelper.token,
    };

    Map<String, String> body = {
      "userId": PrefsHelper.userId,
      "forPets": forPets,
      "age": ageController.text,
      "breed": breedController.text,
      "sex": genderController.text,
      "address": addressController.text,
      "description": descriptionController.text,
      "petName": nameController.text,
      "petType": petTypeController.text,
      "color" : colorController.text,
      "weight" : weightController.text,
      "microchipNumber" : microchipNumberController.text,

      ///<<<============ Additional information to add adaptation pet =================>>>
      "healthCondition" : healthConditionController.text,
      "neuter" : neuterController.text,
      "vaccine" : vaccineController.text,
      "temper" : temperController.text,
      "activityLevel" : activityLevelController.text,
      "behavior" : behaviorController.text,
      "specialNeeds" : specialNeedsController.text,
      "petHistory" : petHistoryController.text,
      "contactInformation" : contactInfoController.text
    };

    var response = await ApiService.multipartRequest(
      url: AppUrls.petAdd,
      body: body,
      method: "POST",
      imageName: "photo",
      imagePath: image,
      header: header
    );

    print.log("Create Lost Pet Response: ${response.message}, ${response.body}");

    if (response.statusCode == 200) {
      Get.back();
      Utils.snackBarSuccessMessage("Success:", response.message);
      makeEmptyTextField();
    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  ///<<<================== Make Empty All Text Editing Field ===================>>>

  makeEmptyTextField(){
   nameController.clear();
    ageController.clear();
    breedController.clear();
    genderController.clear();
    addressController.clear();
    microchipNumberController.clear();
    descriptionController.clear();
    petTypeController.clear();
    colorController.clear();
    weightController.clear();

    healthConditionController.clear();
    neuterController.clear();
    vaccineController.clear();
    temperController.clear();
    activityLevelController.clear();
    behaviorController.clear();
    specialNeedsController.clear();
    petHistoryController.clear();
    contactInfoController.clear();
  }

  ///<<<==================

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
