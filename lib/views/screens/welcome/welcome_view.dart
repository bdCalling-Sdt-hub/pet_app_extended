import 'package:felpus/extensions/extension.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../../../views/components/custom_button.dart';
import '../login/login_view.dart';
import '../signup/signup_view.dart';

class WelcomeView extends GetView {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo),
            sh20,
            Column(
              children: [
                Text(
                  "Now continue after".tr,
                  style: h3.copyWith(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "register in".tr,
                      style: h3.copyWith(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    sw10,
                    Text(
                      "Felpus.".tr,
                      style: h3.copyWith(fontSize: 30, color: AppColors.mainColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              ],
            ),
            sh50,
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Image.asset(AppImages.welcomeImg)),
            sh20,
            CustomButton(
                onTap: () => Get.to(() => LoginView()),
                title: "Sign In".tr,
                width: Get.width / 1.2,
                color: AppColors.mainColor),
            sh15,
            CustomButton(
              onTap: () => Get.to(() => SignupView()),
              title: "Sign Up".tr,
              width: Get.width / 1.2,
              color: AppColors.white,
              borderColor: AppColors.mainColor,
              titleColor: AppColors.black,
            ),
          ],
        ));
  }
}
