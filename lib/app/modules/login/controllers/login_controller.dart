import 'dart:convert';

import 'package:felpus/app/modules/home/views/home_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

import '../../../common/App_Urls/app_urls.dart';
import '../../../common/App_Utils/app_utils.dart';
import '../../../common/helper/other_helper.dart';
import '../../../common/helper/prefs_helper.dart';
import '../../../common/services/api_service.dart';
import '../../dashboard/views/dashboard_view.dart';

class LoginController extends GetxController {

  static LoginController get instance => Get.put(LoginController());
  var isChecked = false.obs;

  void toggleRememberMe(bool value) {
    isChecked.value = value;
  }

  bool isLoading = false;

  TextEditingController emailController = TextEditingController(text: kDebugMode? "hello123@gmail.com" : "");
  TextEditingController passwordController = TextEditingController(text: kDebugMode? "hello123" : "");

  Future<void> logInRepo()async {
    isLoading = true;
    update();

    try{
      Map<String, String> body = {
        "email" : emailController.text,
        "password" : passwordController.text
      };

      var response = await ApiService.postApi(AppUrls.login, body);

      if(response.statusCode == 200){
        var responseData = jsonDecode(response.body);

        PrefsHelper.token = responseData['data']['accessToken'];
        PrefsHelper.setString("token", responseData['data']['accessToken']);


        print.log("Token : ================>>>${PrefsHelper.token}");

        if(responseData['data']['user']['emailVerified']){

          PrefsHelper.userId = responseData['data']['user']['_id'];
          PrefsHelper.userName = responseData['data']['user']['name'];
          PrefsHelper.userPhone = responseData['data']['user']['phoneNumber'];
          PrefsHelper.userImageUrl = responseData['data']['user']['image'];
          PrefsHelper.userEmail = responseData['data']['user']['email'];

          PrefsHelper.setString("userId", responseData['data']['user']['_id']);
          PrefsHelper.setString("userName", responseData['data']['user']['name']);
          PrefsHelper.setString("userPhone", responseData['data']['user']['phoneNumber']);
          PrefsHelper.setString("userImageUrl", responseData['data']['user']['image']);
          PrefsHelper.setString("userEmail", responseData['data']['user']['email']);
          // Get.to(()=> HomeView());
          Get.to(() => DashboardView());
          emailController.clear();
          passwordController.clear();
        }else{
          Utils.snackBarSuccessMessage("Your email isn't verified", "verify First...");
          // await CallingOtp.getOtp(email: emailController.text);
          // Get.toNamed(AppRoutes.oTPScreen, arguments: {"email" : emailController.text, "purpose" : "create account"});
        }
      }else{
        print.log("${response.statusCode}, ${response.body}");
        Get.snackbar(response.statusCode.toString(), response.message);
      }
      isLoading = false;
      update();
    }catch(e){
      isLoading = false;
      update();
      Get.snackbar("Oops", "Something went wrong, try again!");
      print.log("Error occurred: $e");
    }

  }
}
