import 'dart:convert';

import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/services/api_service.dart';
import 'package:felpus/utils/App_Urls/app_urls.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;

  static ProfileController get instance => Get.put(ProfileController());

  bool isLoading = false;

  UserModel userModel = UserModel.fromJson({});

  Future getProfileRepo() async {
    isLoading = true;
    update();

    var response = await ApiService.getApi("${AppUrls.users}/${PrefsHelper.userId}");

    if (response.statusCode == 200) {
      print.log("Get Profile response---------------------------->>>>");
      var data = jsonDecode(response.body)['data'];
      userModel = UserModel.fromJson(data);

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
