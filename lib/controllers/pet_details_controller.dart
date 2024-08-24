import 'dart:convert';
import 'package:felpus/models/pet_model.dart';
import 'package:get/get.dart';

import '../services/api_service.dart';
import '../utils/App_Urls/app_urls.dart';
import '../utils/App_Utils/app_utils.dart';



class PetDetailsController extends GetxController {
  final count = 0.obs;

  static PetDetailsController get instance => Get.put(PetDetailsController());

  bool isLoading = false;

  PetModel petModel = PetModel.fromJson({}) ;

  Future getPetDetailsRepo({required String petId}) async {
    isLoading = true;
    update();
    var response = await ApiService.getApi("${AppUrls.pets}/$petId");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      petModel = PetModel.fromJson(data);


      update();
    } else {
      Utils.snackBarErrorMessage(
          response.statusCode.toString(), response.message);
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
