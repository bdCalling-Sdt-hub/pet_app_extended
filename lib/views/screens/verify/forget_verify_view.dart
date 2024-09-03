import 'package:felpus/controllers/auth/forgot_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/views/components/custom_auth_appbar.dart';
import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';

class ForgetVerifyView extends StatelessWidget {
  const ForgetVerifyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAuthAppBar(),
        body: GetBuilder<ForgotController>(builder: (forgotController) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Give".tr,style:  h3.copyWith(fontSize: 30)),
                  sw5,
                  Text("Verification".tr,style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),
                  sw5,
                  Text("Code.".tr,style:  h3.copyWith(fontSize: 30)),

                ],
              ),
              12.height,
              Text("Enter the OTP code that you get in your\n email address.".tr,style:  h4,textAlign: TextAlign.center,),
              16.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: PinCodeTextField(
                  autoDisposeControllers: false,
                  controller: forgotController.otpController,
                  cursorColor: AppColors.black,
                  appContext: (context),
                  autoFocus: true,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: 60,
                    fieldWidth: 50,
                    activeFillColor: AppColors.transparent,
                    selectedFillColor: AppColors.transparent,
                    inactiveFillColor: AppColors.transparent,
                    borderWidth: 0.5,
                    selectedColor: AppColors.grayLight,
                    activeColor: AppColors.grayLight,
                    inactiveColor: AppColors.grayLight,
                  ),
                  length: 6,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.disabled,
                  enableActiveFill: true,
                ),
              ),
              24.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn’t receive the code?".tr,style: h4,),
                  sw5,
                  InkWell(
                    onTap: () {
                    },
                    child:  CustomText(
                      text: "Resend".tr,
                      isTextDecoration: true,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.textColor,
                    ),
                  )

                ],
              ),
              Spacer(),
              forgotController.isLoading
                  ? const CustomLoader()
                  : CustomButton(onTap: () => forgotController.verifyForgotOtpRepo(),title: "Verify".tr, width: Get.width, color: AppColors.mainColor),
              24.height
            ],
          );
        },)
    );
  }
}
