import 'package:felpus/app/common/widgets/custom_auth_appbar.dart';
import 'package:felpus/app/modules/complete_profile/views/complete_profile_view.dart';
import 'package:felpus/app/modules/forgot/views/reset_password_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_text_style/styles.dart';
import '../../../common/size_box/custom_sizebox.dart';
import '../../../common/widgets/custom_button.dart';

class VerifyView extends GetView {
  const VerifyView({super.key});
  static String purpose = "";
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAuthAppBar(),
        body: SingleChildScrollView(
          child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sh20,
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Get",style:  h3.copyWith(fontSize: 30)),
                        sw5,
                        Text("OTP",style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),
                        sw5,
                        Text("Code.",style:  h3.copyWith(fontSize: 30)),

                      ],
                    ),
                    sh10,
                    Text("Enter the OTP code that you get in your\n email address.",style:  h4,textAlign: TextAlign.center,),
                    sh50,
                    Flexible(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: PinCodeTextField(
                          autoDisposeControllers: false,
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
                    ),
                    sh10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn’t receive the code?",style: h4,),
                        sw5,
                        Text("Resend",style: h3.copyWith(decoration: TextDecoration.underline,),),

                      ],
                    ),
                    sh100,
                    CustomButton(ontap: () => purpose == "sign up"? Get.to(() => CompleteProfileView()):Get.to(() => ResetPasswordView()),title: "Verify", width: Get.width, color: AppColors.mainColor),
                    sh50,
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }
}
