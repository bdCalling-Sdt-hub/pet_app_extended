
import 'package:felpus/app/common/widgets/custom_container_button.dart';
import 'package:felpus/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../Controllers/common_controller/setting/delete_account_controller.dart';
import '../../app_color/app_colors.dart';
import '../../helper/prefs_helper.dart';
import '../custom_image.dart';
import '../custom_loader.dart';
import '../custom_text.dart';


class PopUp {


  // static successPopUp(
  //     {required title,
  //     String? message,
  //     VoidCallback? onTap,
  //     bool isLoading = false}) {
  //   showDialog(
  //     context: Get.context!,
  //     builder: (context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20.r),
  //         ),
  //         contentPadding: EdgeInsets.all(12.w),
  //         content: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               CustomImage(
  //                 imageSrc: AppImages.bookingSuccessfully,
  //                 imageType: ImageType.png,
  //                 height: 130.h,
  //                 width: 130.w,
  //               ),
  //               CustomText(
  //                 text: title,
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.w500,
  //                 color: AppColors.black,
  //                 maxLines: 5,
  //                 top: 32,
  //                 bottom: 8,
  //               ),
  //               message != null
  //                   ? CustomText(
  //                       text: message,
  //                       maxLines: 5,
  //                       color: AppColors.greyTextColor,
  //                     )
  //                   : const SizedBox(),
  //               SizedBox(
  //                 height: 16.h,
  //               ),
  //               CustomButton(
  //                 isGradient: true,
  //                 height: 48.h,
  //                 text: "done".tr,
  //                 onTap: () {
  //                   bookingController.getBookingRepo(status: "pending").then(
  //                       (value) => Get.toNamed(AppRoutes.myBookingScreen));
  //                   // Get.offAllNamed(AppRoutes.myBookingScreen);
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  static logOutPopUp() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          contentPadding: EdgeInsets.all(12.sp),
          title: CustomText(
            fontSize: 16,
            text: "Are you sure to logout?".tr,
            maxLines: 2,
            fontWeight: FontWeight.w600,
          ),
          actions: [
            Row(
              children: [
                Expanded(
                    child: CustomContainerButton(
                  height: 48,
                  text: "No".tr,
                  borderColor: AppColors.mainColor,
                  isFillColor: false,
                  backgroundColor: AppColors.transparent,
                  textColor: AppColors.mainColor,
                  onTap: () => Get.back(),
                )),
                SizedBox(
                  width: 16.w,
                ),
                Expanded(
                  child: CustomContainerButton(
                    height: 48,
                    text: "Yes".tr,
                    onTap: () {
                      PrefsHelper.removeAllPrefData();
                      Get.offAll(()=> LoginView());
                      // Get.offAllNamed(AppRoutes.signInScreen);
                    },
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }

  static deleteAccountPopUp() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          contentPadding: const EdgeInsets.only(bottom: 12),
          title: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomText(
                    text: "Are you sure to delete?".tr,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    maxLines: 1,
                    bottom: 18,
                  ),
                ),
                CustomText(
                  textAlign: TextAlign.center,
                  text:
                      "All your changes will be deleted and you will no longer be able to access them."
                          .tr,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ],
            ),
          ),
          actions: [
            GetBuilder<DeleteAccountController>(
              builder: (deleteAccountController) {
                return deleteAccountController.isLoading
                    ? const CustomLoader()
                    : Row(
                        children: [
                          Expanded(
                            child: CustomContainerButton(
                              text: "No".tr,
                              textColor: AppColors.black,
                              borderColor: AppColors.mainColor,
                              backgroundColor: AppColors.transparent,
                              isFillColor: false,
                              borderRadius: 4,
                              height: 48.h,
                              onTap: () => Get.back(),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: CustomContainerButton(
                              text: "Yes".tr,
                              textColor: AppColors.white,
                              backgroundColor: AppColors.mainColor,
                              borderRadius: 4.r,
                              height: 48.h,
                              onTap: () => DeleteAccountController.instance
                                  .deleteAccountRepo(),
                            ),
                          )
                        ],
                      );
              },
            ),
          ],
        );
      },
    );
  }

  // static deleteItemsPopUp({
  //   required String itemsId,
  //   required VoidCallback onDelete,
  // }) {
  //   showDialog(
  //     context: Get.context!,
  //     builder: (context) {
  //       return AlertDialog(
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(20.r),
  //         ),
  //         contentPadding: EdgeInsets.all(12.sp),
  //         title: Center(
  //           child: CustomText(
  //             text: "Are you sure to delete?".tr,
  //             fontSize: 20,
  //             fontWeight: FontWeight.w500,
  //             color: AppColors.black,
  //             maxLines: 1,
  //             bottom: 18,
  //           ),
  //         ),
  //         actions: [
  //           Row(
  //             children: [
  //               Expanded(
  //                 child: CustomButton(
  //                   height: 48.h,
  //                   text: "No".tr,
  //                   borderColor: AppColors.blue300,
  //                   isFillColor: false,
  //                   backgroundColor: AppColors.transparent,
  //                   textColor: AppColors.blue300,
  //                   onTap: () => Get.back(),
  //                 ),
  //               ),
  //               SizedBox(
  //                 width: 16.w,
  //               ),
  //               Expanded(
  //                 child: CustomButton(
  //                   height: 48,
  //                   text: "Yes".tr,
  //                   onTap: () {
  //                     onDelete();
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

}
