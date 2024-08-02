import 'package:felpus/app/common/Extension/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  static showToastWithIcon(String message, IconData icon, Color bgColor) {

    // Widget toast = Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(25.0),
    //     color: bgColor,
    //   ),
    //   child: Row(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       FaIcon(icon, color: Colors.white),
    //       const SizedBox(width: 12.0),
    //       Text(
    //         message,
    //         style: const TextStyle(color: Colors.white),
    //       ),
    //     ],
    //   ),
    // );
    //
    // FToast fToast = FToast();
    // fToast.init(Get.context!);
    // fToast.showToast(
    //   child: toast,
    //   gravity: ToastGravity.BOTTOM,
    //   toastDuration: Duration(seconds: 2),
    // );

    Fluttertoast.showToast(
      msg: "${icon == FontAwesomeIcons.exclamationTriangle ? "⚠️" : "📶"} $message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // final overlay = Overlay.of(Get.context!);
    // final overlayEntry = OverlayEntry(
    //   builder: (context) => Positioned(
    //     bottom: 50,
    //     left: MediaQuery.of(context).size.width * 0.2,
    //     child: Material(
    //       color: Colors.transparent,
    //       child: Container(
    //         padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(25.0),
    //           color: bgColor,
    //         ),
    //         child: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             SvgPicture.asset(
    //               svgPath,
    //               width: 24,
    //               height: 24,
    //               color: AppColors.white,
    //             ),
    //             12.width,
    //             Text(
    //               message,
    //               style: const TextStyle(color: AppColors.white),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    //
    // overlay.insert(overlayEntry);
    // Future.delayed(const Duration(seconds: 2)).then((value) => overlayEntry.remove());
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
      colorText: AppColors.whiteGray);
  }

  static snackBarErrorMessage(String title, String message) {
    Get.snackbar(kDebugMode ? title : 'oops!', message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.mainColor,
        colorText: AppColors.whiteGray);
  }
}