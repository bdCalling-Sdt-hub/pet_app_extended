import 'dart:convert';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/models/pagination_model.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:get/get.dart';

import '../services/api_service.dart';
import '../utils/App_Urls/app_urls.dart';
import '../utils/App_Utils/app_utils.dart';
import 'dart:developer' as print;


class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  bool isLoading = false;
  Pagination? pagination;

  List<PetModel>lostPetList = [];
  List foundPetList = [];
  List myPetList = [];


  ///<<<=================== Get Lost Pet Repo ============================>>>
  Future getLostPetRepo({int page = 1, int limit = 10}) async {

    var response = await ApiService.getApi("${AppUrls.filterByTag}?find=lost");

    if (response.statusCode == 200) {
      print.log("Lost pet response---------------------------->>>>");
      var data = jsonDecode(response.body)['data'];
      var responseData = jsonDecode(response.body);

      final Pagination fetchedPagination = Pagination.fromJson(responseData['meta']);

      for (var item in data) {
        lostPetList.add(PetModel.fromJson(item));
      }
      update();
      pagination = fetchedPagination;

    } else {
      Utils.snackBarErrorMessage(
          response.statusCode.toString(), response.message);
    }
  }

  Future getFoundPetRepo() async {
    var response = await ApiService.getApi("${AppUrls.filterByTag}?find=found");

    if (response.statusCode == 200) {
      print.log("Found pet response---------------------------->>>>");
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

    var response = await ApiService.getApi("${AppUrls.myPets}${PrefsHelper.userId}");

    if (response.statusCode == 200) {
      print.log("My pet response---------------------------->>>>");
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
    Future.wait([getFoundPetRepo(), getLostPetRepo(), getMyPetRepo()]);
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
