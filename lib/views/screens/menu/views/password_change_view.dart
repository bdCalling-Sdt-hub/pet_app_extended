
import 'package:felpus/controllers/auth/forgot_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/validator_helper.dart';
import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_text_field.dart';
import 'package:felpus/views/components/custom_textfelid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_text_style/styles.dart';
import '../../../../utils/size_box/custom_sizebox.dart';
import '../../forgot/forgot_view.dart';


class PasswordChangeView extends GetView {
  PasswordChangeView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
            onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<ForgotController>(builder: (forgotController) {
        return SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Text("Change Your",style: h1.copyWith(fontSize: 32),textAlign: TextAlign.center,),
                      Text("Password.", style: h1.copyWith(fontSize: 32, color: AppColors.mainColor),textAlign: TextAlign.center),
                      sh5,
                      Text("Password must have 8-10 charecters.",style: h4,),
                      sh50,
                      CustomTextFormField(
                        title: "Password",
                        validator: ValidatorHelper.passwordValidator,
                        controller: forgotController.passwordController,
                        hintText: "Enter your old password",
                        isPassword: true,
                      ),
                      16.height,
                      CustomTextFormField(
                        title: "New Password",
                        validator: ValidatorHelper.passwordValidator,
                        controller: forgotController.newPasswordController,
                        hintText: "Enter new password",
                        isPassword: true,
                      ),
                      16.height,
                      CustomTextFormField(
                        title: "Confirm New Password",
                        validator: (value) =>
                            ValidatorHelper.confirmPasswordValidator(
                                value, forgotController.newPasswordController),
                        controller: forgotController.confirmNewPasswordController,
                        hintText: "Re-enter new password",
                        isPassword: true,
                      ),
                      GestureDetector(
                          onTap: () => Get.to(() => ForgotView()),
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 16.w),
                                child: Text("Forget Password",style: h3.copyWith(decoration: TextDecoration.underline,),),
                              ))),
                      sh50,
                      CustomButton(
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            forgotController.changePasswordRepo();
                          }
                        },
                          title: "Reset Password", width: Get.width, color: AppColors.mainColor)
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },)
    );
  }
}
