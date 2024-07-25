import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/custom_button.dart';
import 'package:felpus/app/common/widgets/custom_textfelid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_text_style/styles.dart';
import '../../forgot/views/forgot_view.dart';

class PasswordChangeView extends GetView {
  const PasswordChangeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: InkWell(
            onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text("Change Your\n Password.",style: h1.copyWith(fontSize: 32),textAlign: TextAlign.center,),
                    sh5,
                    Text("Password must have 8-10 charecters.",style: h4,),
                    sh50,
                    CustomTextField(title: "Password", width: Get.width,hintText: "Password",sufIcon: const Icon(CupertinoIcons.eye_slash),horizontalPadding: 0,),
                    CustomTextField(title: "New Password", width: Get.width,hintText: "Password",sufIcon: const Icon(CupertinoIcons.eye_slash),horizontalPadding: 0,),
                    CustomTextField(title: "Confirm New Password", width: Get.width,hintText: "Password",sufIcon: const Icon(CupertinoIcons.eye_slash),horizontalPadding: 0,),
                    GestureDetector(
                        onTap: () => Get.to(() => ForgotView()),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Text("Forget Password",style: h3.copyWith(decoration: TextDecoration.underline,),))),
                    sh50,
                    CustomButton(title: "Reset Password", width: Get.width, color: AppColors.mainColor)
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
