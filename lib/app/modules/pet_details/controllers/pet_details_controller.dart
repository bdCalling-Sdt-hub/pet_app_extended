import 'dart:convert';

import 'package:felpus/app/common/Models/api_response_model.dart';
import 'package:felpus/app/common/helper/prefs_helper.dart';
import 'package:felpus/app/model/pet_model.dart';
import 'package:get/get.dart';

import '../../../common/App_Urls/app_urls.dart';
import '../../../common/App_Utils/app_utils.dart';
import '../../../common/services/api_service.dart';

class PetDetailsController extends GetxController {
  final count = 0.obs;

  bool isLoading = false;

  PetModel petModel = PetModel.fromJson({}) ;

  Future getMyPetRepo({required String petId}) async {
    isLoading = true;
    update();
    var response = await ApiService.getApi("${AppUrls.pet}/$petId");

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
