
import 'dart:convert';

import 'package:felpus/models/pagination_model.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/services/api_service.dart';
import 'package:felpus/utils/App_Urls/app_urls.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

class FoundPetsController extends GetxController{

  bool isLoading = false;
  Pagination? pagination;

  List<PetModel>foundPetList = [];
  List myPetList = [];

  bool isMoreLoading = false;

  ///<<<=================== Get Found Pet Repo ===========================>>>

  Future getFoundPetRepo({int page = 1, int limit = 10}) async {
    if(page == 1){
      isLoading = true;
      update();
      foundPetList.clear();
    }else{
      isMoreLoading = true;
      update();
    }

    var response = await ApiService.getApi("${AppUrls.filterByTag}?find=found&page=$page&limit=$limit");

    if (response.statusCode == 200) {
      print.log("Found pet response---------------------------->>>>");
      var data = jsonDecode(response.body)['data'];
      var responseData = jsonDecode(response.body);
      final Pagination fetchedPagination = Pagination.fromJson(responseData['meta']);

      for (var item in data) {
        foundPetList.add(PetModel.fromJson(item));
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
    // TODO: implement onInit
    getFoundPetRepo();
    super.onInit();
  }
}