
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../app_color/app_colors.dart';




class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static showToastWithIcon(String message, IconData icon, Color bgColor) {

    Fluttertoast.showToast(
      msg: "${icon == FontAwesomeIcons.exclamationTriangle ? "⚠️" : "📶"} $message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static toastMessage({required String message}) {

    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.blue,
      textColor: AppColors.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  static snackBarSuccessMessage(String title, String message) {
    Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.blue,
      colorText: AppColors.white);
  }

  static snackBarErrorMessage(String title, String message) {
    Get.snackbar(title , message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.mainColor,
        colorText: AppColors.white);
  }
}