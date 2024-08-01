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

    final overlay = Overlay.of(Get.context!);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50,
        left: MediaQuery.of(context).size.width * 0.2,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: bgColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  svgPath,
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
                SizedBox(width: 12.0),
                Text(
                  message,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);
    Future.delayed(Duration(seconds: 2)).then((value) => overlayEntry.remove());


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