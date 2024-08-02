import 'package:felpus/app/common/widgets/custom_button.dart';
import 'package:felpus/app/common/widgets/custom_textfelid.dart';
import 'package:felpus/app/modules/forgot/views/verify_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_text_style/styles.dart';
import '../../../common/size_box/custom_sizebox.dart';
import '../../../common/widgets/custom_auth_appbar.dart';
import '../../../common/widgets/custom_loader.dart';
import '../controllers/forgot_controller.dart';

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
            //   mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sh20,
              Center(
                child: Column(
                  children: [
                    Text("Forget Your",style:  h3.copyWith(fontSize: 30,),textAlign: TextAlign.center,),
                    Text("Password?",style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),
                    sh10,
                    Text("Enter your email address to reset your password.",style:  h4,textAlign: TextAlign.center,),
                    sh50,
                    CustomTextField(title: "Email", width: Get.width,hintText: "Enter your email",),
                    sh100,
                    forgotController.isLoadingEmail
                        ? const CustomLoader()
                        : CustomButton(onTap: () => forgetController.forgotPasswordRepo(),title: "Get OTP", width: Get.width, color: AppColors.mainColor),
                    sh50,
                  ],
                ),
              ),

            ],
          );
        },),
      )
    );
  }
}
