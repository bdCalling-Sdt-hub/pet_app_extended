import 'dart:async';
import 'dart:convert';

import 'package:felpus/app/modules/forgot/views/verify_view.dart';
import 'package:felpus/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/App_Urls/app_urls.dart';
import '../../../common/App_Utils/app_utils.dart';
import '../../../common/services/api_service.dart';
import '../../complete_profile/views/complete_profile_view.dart';
import 'dart:developer' as print;

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

  Timer? timer;
  int start = 0;

  bool isLoadingEmail = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  ///<<<================= Timer Repo ========================>>>

  void startTimer() {
    start = 180;
    const oneSec = Duration(seconds: 1);
    timer =  Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
          update();
        }
      },
    );
  }

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


  ///==============>>> Verify Otp Repo <<<=================

  bool isLoading = false;
  verifyOtpRepo() async {
    isLoading = true;
    update();

    Map<String, String> body = {
      "otp" : otpController.text,
      "userToken" : "${SignupController.signUpToken}"
    };

    var response = await ApiService.postApi(AppUrls.verifyOtp, body,);

    if (response.statusCode == 200) {
      Get.to(() => CompleteProfileView());
      Utils.snackBarSuccessMessage("Success:", "Email verification completed.");

    } else {
      print.log(response.statusCode.toString());
      Utils.snackBarErrorMessage("Oops!", response.message);
    }
    isLoading = false;
    update();
  }
}
