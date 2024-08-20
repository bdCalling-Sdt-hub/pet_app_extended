import 'dart:convert';

import 'package:felpus/app/common/Models/api_response_model.dart';
import 'package:felpus/app/model/pet_model.dart';
import 'package:get/get.dart';

import '../../../common/App_Urls/app_urls.dart';
import '../../../common/App_Utils/app_utils.dart';
import '../../../common/services/api_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  bool isLoading = false;

  List lostPetList = [];
  List foundPetList = [];
  List myPetList = [];

  Future getLostPetRepo() async {
    var response = await ApiService.getApi("${AppUrls.filterByTag}?find=lost");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      for (var item in data) {
        lostPetList.add(PetModel.fromJson(item));
      }
      update();
    } else {
      Utils.snackBarErrorMessage(
          response.statusCode.toString(), response.message);
    }
  }

  Future getFountPetRepo() async {
    var response = await ApiService.getApi("${AppUrls.filterByTag}?find=found");

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      for (var item in data) {
        foundPetList.add(PetModel.fromJson(item));
      }
      update();
    } else {
      Utils.snackBarErrorMessage(
          response.statusCode.toString(), response.message);
    }
  }

  Future getMyPetRepo() async {
    isLoading = true;
    update();
    var response = await ApiService.getApi(AppUrls.notification);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      for (var item in data) {
        myPetList.add(PetModel.fromJson(item));
      }
      update();
    } else {
      Utils.snackBarErrorMessage(
          response.statusCode.toString(), response.message);
    }

    isLoading = false;
    update();
  }

  wait() {
    isLoading = true;
    update();
    Future.wait([getFountPetRepo(), getLostPetRepo(), getMyPetRepo()]);
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    wait();
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
