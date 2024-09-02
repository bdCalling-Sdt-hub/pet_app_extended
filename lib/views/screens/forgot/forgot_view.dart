import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_textfelid.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../controllers/auth/forgot_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../../components/custom_auth_appbar.dart';
import '../../components/custom_loader.dart';

class ForgotView extends GetView<ForgotController> {
  ForgotView({super.key});

  ForgotController forgotController = Get.put(ForgotController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAuthAppBar(),
      body: SingleChildScrollView(
        child: GetBuilder<ForgotController>(
            builder: (forgetController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sh20,
                  Center(
                    child: Column(
                      children: [
                        Text("Forget Your".tr, style: h3.copyWith(fontSize: 30), textAlign: TextAlign.center),
                        Text("Password?".tr, style: h3.copyWith(fontSize: 30, color: AppColors.mainColor), textAlign: TextAlign.center),
                        sh10,
                        Text("Enter your email address to reset your password.".tr, style: h4, textAlign: TextAlign.center),
                        sh50,
                        CustomTextField(
                          controller: forgetController.emailController,
                          title: "Email".tr,
                          width: Get.width,
                          hintText: "Enter your email".tr,
                        ),
                        sh100,
                        forgotController.isLoadingEmail
                            ? const CustomLoader()
                            : CustomButton(
                          onTap: () => forgetController.forgotPasswordRepo(),
                          title: "Get OTP".tr,
                          width: Get.width,
                          color: AppColors.mainColor,
                        ),
                        sh50,
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
