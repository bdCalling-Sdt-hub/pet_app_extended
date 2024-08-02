import 'package:felpus/app/modules/forgot/views/verify_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/App_Urls/app_urls.dart';
import '../../../common/App_Utils/app_utils.dart';
import '../../../common/services/api_service.dart';

class ForgotController extends GetxController {

  static ForgotController get instance => Get.put(ForgotController());
  //TODO: Implement ForgotController

  final count = 0.obs;
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

  bool isLoadingEmail = false;
  TextEditingController emailController = TextEditingController();

  Future<void> forgotPasswordRepo() async {
  // Get.toNamed(AppRoutes.verifyEmail);
  // return;
  isLoadingEmail = true;
  update();

  Map<String, String> body = {
    "email": emailController.text,
  };
  var response = await ApiService.postApi(AppUrls.forgotPassword, body);

  if (response.statusCode == 200) {
    Utils.toastMessage(message: response.message);
    Get.to(()=> const VerifyView());

  } else {
    Utils.snackBarErrorMessage(response.statusCode.toString(), response.message);
  }
  isLoadingEmail = false;
  update();
}
}
