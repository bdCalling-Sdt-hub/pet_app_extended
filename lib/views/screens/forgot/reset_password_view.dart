
import 'package:felpus/views/components/custom_auth_appbar.dart';
import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_textfelid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../login/login_view.dart';

class ResetPasswordView extends GetView {
  const ResetPasswordView({super.key});
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
                    Text("Now Reset Your",style:  h3.copyWith(fontSize: 30,),textAlign: TextAlign.center,),
                    Text("Password?",style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),
                    sh10,
                    Text("Password must have 8-10 charecters.",style:  h4,textAlign: TextAlign.center,),
                    sh50,
                    CustomTextField(title: "New Password", width: Get.width,hintText: "Password",sufIcon: const Icon(CupertinoIcons.eye_slash),),
                    CustomTextField(title: "Confirm New Password", width: Get.width,hintText: "Password",sufIcon: const Icon(CupertinoIcons.eye_slash),),
                    sh100,
                    CustomButton(onTap: () => Get.to(() => LoginView()),title: "Reset Password", width: Get.width, color: AppColors.mainColor),
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
