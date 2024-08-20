import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;

import '../helpers/prefs_helper.dart';
import '../services/api_service.dart';
import '../utils/App_Urls/app_urls.dart';
import '../views/screens/dashboard/dashboard_view.dart';

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
    // Get.to(() => DashboardView());
    // return;
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
        print.log("Token : ================>>>${PrefsHelper.token}");
        print.log("isChecked : ================>>>${isChecked.value}");

          PrefsHelper.userId = responseData['data']['_id'];
          PrefsHelper.userName = responseData['data']['fullName'];
          PrefsHelper.userImageUrl = responseData['data']['photo'];
          PrefsHelper.userEmail = responseData['data']['email'];

        if(isChecked.value){
          PrefsHelper.setString("token", responseData['data']['accessToken']);
          PrefsHelper.setString("userId", responseData['data']['_id']);
          PrefsHelper.setString("userName", responseData['data']['name']);
          PrefsHelper.setString("userImageUrl", responseData['data']['photo']);
          PrefsHelper.setString("userEmail", responseData['data']['email']);

          print.log(PrefsHelper.userId);
          print.log(PrefsHelper.userName);
          print.log(PrefsHelper.userImageUrl);
          print.log(PrefsHelper.userEmail);
        }
          // Get.to(()=> HomeView());
          Get.to(() => DashboardView());
          emailController.clear();
          passwordController.clear();

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
