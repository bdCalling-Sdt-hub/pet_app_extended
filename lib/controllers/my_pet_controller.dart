
import 'dart:convert';

import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/services/api_service.dart';
import 'package:felpus/utils/App_Urls/app_urls.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

class MyPetController extends GetxController{
  
  bool isLoading = false;
  
  List<PetModel> myPetList = [];

  static MyPetController get instance => Get.put(MyPetController());

  Future<void> getMyPet() async {
    isLoading = true;
    update();

    var response = await ApiService.getApi("${AppUrls.myPet}${PrefsHelper.userId}");

    print.log("Create Lost Pet Response: ${response.message}, ${response.body}");

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);

      myPetList = List<PetModel>.from(responseData['data'].map((json) => PetModel.fromJson(json)));

      print.log("My pet list: $myPetList");
      

    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }


  @override
  void onInit() {
    getMyPet();
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
}