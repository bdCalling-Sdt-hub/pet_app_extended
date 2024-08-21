import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

import '../helpers/other_helper.dart';
import '../services/api_service.dart';
import '../utils/App_Urls/app_urls.dart';
import '../utils/App_Utils/app_utils.dart';
import '../views/screens/Verify/verify_view.dart';

class SignupController extends GetxController {
  var isChecked = false.obs;

  static SignupController get instance => Get.put(SignupController());

  void toggleRememberMe(bool value) {
    isChecked.value = value;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? image;
  static String? signUpToken;

openGallery() async {
  image = await OtherHelper.openGallery();
  update();
}

  Timer? _timer;
  int start = 0;

  String time = "";
  void startTimer() {
    _timer?.cancel(); // Cancel any existing timer
    start = 180; // Reset the start value
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start > 0) {
        start--;
        final minutes = (start ~/ 60).toString().padLeft(2, '0');
        final seconds = (start % 60).toString().padLeft(2, '0');

        time = "$minutes:$seconds";
        update();
      } else {
        _timer?.cancel();
      }
    });
  }

bool isLoading = false;


///==============>>> Signup Repo <<<=====================

signUpRepo() async {
  isLoading = true;
  update();

  Map<String, String> body = {
    "email": emailController.text,
    "password": passwordController.text,
    "role": "user"
  };

  var response = await ApiService.postApi(AppUrls.signUp, body,);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    signUpToken = data['data']['signupToken'];


    print.log("Sign Up Token: $signUpToken");
    Get.to(() => const VerifyView());  VerifyView.purpose = "sign up";
    Utils.toastMessage(message: "OTP is sent to your email");
  } else {
    Utils.snackBarErrorMessage(response.statusCode.toString(), response.message);
  }
  isLoading = false;
  update();
}

}
