
import 'dart:convert';

import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/services/api_service.dart';
import 'package:felpus/utils/App_Urls/app_urls.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

class MyPetController extends GetxController{
  
  bool isLoading = false;
  
  List<PetModel> myPetList = [];

  static MyPetController get instance => Get.put(MyPetController());

  ///<<<=============== Get My Pet List =============================>>>
  static String petType = '';

  Future<void> getMyPet() async {
    isLoading = true;
    update();

    var response = await ApiService.getApi("${AppUrls.myPets}${PrefsHelper.userId}?forPets=$petType");

    print.log("Get my Pet Response: ${response.message}, ${response.body}");

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);

      myPetList = List<PetModel>.from(responseData['data'].map((json) => PetModel.fromJson(json)));

      print.log("My pet list: $myPetList");
      petType = '';

    } else {
      Get.snackbar(response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  ///<<<==================== Delete My Pet =======================>>>

  Future<void> deleteMyPet({required String petId, String petStatus = 'delete'}) async {
    isLoading = true;
    update();

    var response = await ApiService.deleteApi("${AppUrls.pets}/$petId");

    print.log("Delete Pet Response: ${response.message}, ${response.body}");

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);

      if(petStatus == 'delete'){
        Utils.snackBarSuccessMessage("Success:", "Your pet named '${responseData["data"]["petName"]}' has been deleted");
      }else if(petStatus == 'lost'){
        Utils.snackBarSuccessMessage("Success:", "Your pet has been found the pet, named '${responseData["data"]["petName"]}'");
      }else if(petStatus == 'found'){
        Utils.snackBarSuccessMessage("Success:", "You returned the pet, named '${responseData["data"]["petName"]}'");
      }
      getMyPet();
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