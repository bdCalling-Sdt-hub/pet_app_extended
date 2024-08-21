

import 'package:felpus/controllers/auth/forgot_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/validator_helper.dart';
import 'package:felpus/utils/app_color/app_colors.dart';
import 'package:felpus/utils/app_text_style/styles.dart';
import 'package:felpus/views/components/custom_auth_appbar.dart';
import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/size_box/custom_sizebox.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAuthAppBar(),
      body: GetBuilder<ForgotController>(builder: (forgotController) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              Text("Now Reset Your",style:  h3.copyWith(fontSize: 30,),textAlign: TextAlign.center,),
              Text("Password?",style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),
              sh10,
              Text("Password must have 8-10 charecters.",style:  h4,textAlign: TextAlign.center,),
              sh50,
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
              Spacer(),
              forgotController.isLoading? const CustomLoader() :
              CustomButton(
                onTap: () {
                  if(_formKey.currentState!.validate()){
                    forgotController.resetPasswordRepo();
                  }
                },
                  title: "Reset Password", width: Get.width, color: AppColors.mainColor),
              sh50,
            ],
          ),
        );
      },),
    );
  }
}
