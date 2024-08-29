import 'dart:convert';

import 'package:felpus/models/pagination_model.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/services/api_service.dart';
import 'package:felpus/utils/App_Urls/app_urls.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

class LostPetsController extends GetxController {
  //TODO: Implement LostPetsController

  final count = 0.obs;

  bool isLoading = false;
  Pagination? pagination;

  List<PetModel>lostPetList = [];

  bool isMoreLoading = false;


  ///<<<=================== Get Lost Pet Repo ============================>>>
  Future getLostPetRepo({int page = 1, int limit = 10}) async {

    if(page == 1){
      isLoading = true;
      update();
      lostPetList.clear();
    }else{
      isMoreLoading = true;
      update();
    }
    var response = await ApiService.getApi("${AppUrls.filterByTag}?find=lost&page=$page&limit=$limit");

    if (response.statusCode == 200) {
      print.log("Lost pet response---------------------------->>>>");
      var data = jsonDecode(response.body)['data'];
      var responseData = jsonDecode(response.body);

      final Pagination fetchedPagination = Pagination.fromJson(responseData['meta']);

      for (var item in data) {
        lostPetList.add(PetModel.fromJson(item));
      }
      pagination = fetchedPagination;
      update();

    } else {
      Utils.snackBarErrorMessage(
          response.statusCode.toString(), response.message);
    }
    isMoreLoading = false;
    update();
    isLoading = false;
    update();
  }


  @override
  void onInit() {
    getLostPetRepo();
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
