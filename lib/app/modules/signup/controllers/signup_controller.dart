import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isChecked = false.obs;


  void toggleRememberMe(bool value) {
    isChecked.value = value;
  }


}
