import 'dart:convert';

import 'package:felpus/models/pagination_model.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/services/api_service.dart';
import 'package:felpus/utils/App_Urls/app_urls.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

class AdoptionController extends GetxController {
  //TODO: Implement AdoptionController

  final count = 0.obs;

  static AdoptionController get instance => Get.put(AdoptionController());

  bool isLoading = false;
  Pagination? pagination;

  List<PetModel>adoptPetList = [];

  bool isMoreLoading = false;
  ///<<<=================== Get Adopt Pet Repo ===========================>>>

  Future getAdoptPetRepo({int page = 1, int limit = 10}) async {
    if(page == 1){
      adoptPetList.clear();
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
        adoptPetList.add(PetModel.fromJson(item));
      }
      pagination = fetchedPagination;
      update();
    } else {
      Utils.snackBarErrorMessage(
          response.statusCode.toString(), response.message);
    }
    isMoreLoading = false;
    update();
  }


  @override
  Future<void> onInit() async {
    isLoading = true;
    update();
    await getAdoptPetRepo();
    isLoading = false;
    update();
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
