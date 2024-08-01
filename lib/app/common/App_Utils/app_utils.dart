import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../app_color/app_colors.dart';
import '../widgets/custom_text.dart';



class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage({required String message, IconData icon = Icons.check}) {
    FToast fToast = FToast();

    if (Get.context != null) {
      fToast.init(Get.context!);
      Widget toast = Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            SizedBox(
              width: 12.w,
            ),
            Flexible(
              child: CustomText(
                text: message,
                textAlign: TextAlign.center,
                maxLines: 2,
                color: AppColors.oliveDeep,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );

      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
      );
    } else {
      Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.greenAccent,
        textColor: AppColors.white,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  static snackBarSuccessMessage(String title, String message) {
    Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.oliveDeep,
      colorText: AppColors.whiteGray);
  }

  static snackBarErrorMessage(String title, String message) {
    Get.snackbar(kDebugMode ? title : 'oops!', message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.oliveDeep,
        colorText: AppColors.whiteGray);
  }
}