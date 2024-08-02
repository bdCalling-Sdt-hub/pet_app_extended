import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/App_Urls/app_urls.dart';
import '../../../common/App_Utils/app_utils.dart';
import '../../../common/helper/other_helper.dart';
import '../../../common/services/api_service.dart';
import '../../forgot/views/verify_view.dart';
import 'dart:developer' as print;

class SignupController extends GetxController {
  var isChecked = false.obs;


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

bool isLoading = false;

///==============>>> Signup Repo <<<=====================

signUpRepo() async {
  isLoading = true;
  update();

  Map<String, String> body = {
    "fullName" : "Hi",
    "email": emailController.text,
    "password": passwordController.text,
    "role" : "user"
  };

  var response = await ApiService.postApi(AppUrls.signUp, body,);

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    signUpToken = data['data']['signupToken'];

    print.log("Sign Up Token: $signUpToken");
    Get.to(() => const VerifyView());  VerifyView.purpose = "sign up";
    Utils.toastMessage(message: "OTP is sent to you email");
  } else {
    Utils.snackBarErrorMessage(response.statusCode.toString(), response.message);
  }
  isLoading = false;
  update();
}

}
