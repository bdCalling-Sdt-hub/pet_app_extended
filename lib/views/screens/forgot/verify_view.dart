
import 'package:felpus/views/components/custom_auth_appbar.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/screens/forgot/reset_password_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../controllers/auth/forgot_controller.dart';
import '../../../controllers/signup_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../../components/custom_button.dart';
import '../../components/custom_text.dart';


class VerifyView extends GetView {

  const VerifyView({super.key});
  static String purpose = "";

  @override
  Widget build(BuildContext context) {

    ForgotController forgotController = Get.put(ForgotController());
    
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAuthAppBar(),
        body: SingleChildScrollView(
          child: GetBuilder<ForgotController>(builder: (forgetController) {
            return Column(
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
                          forgetController.start == 0
                              ? GetBuilder<SignupController>(builder: (controller) {
                            return controller.isLoading? const CustomLoader(size: 40) : InkWell(
                              onTap: () {
                                controller.signUpRepo();
                              },
                              child: const CustomText(
                                text: "Resend",
                                isTextDecoration: true,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: AppColors.textColor,
                              ),
                            );
                          },)
                              : CustomText(
                            text: "${(forgetController.start ~/ 60).toString().padLeft(2, '0')}:${(forgetController.start % 60).toString().padLeft(2, '0')}",
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: AppColors.textColor,
                          )

                        ],
                      ),
                      sh100,
                      forgotController.isLoading
                          ? const CustomLoader()
                          : CustomButton(onTap: () => purpose == "sign up"? forgotController.verifyOtpRepo():Get.to(() => const ResetPasswordView()),title: "Verify", width: Get.width, color: AppColors.mainColor),
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
