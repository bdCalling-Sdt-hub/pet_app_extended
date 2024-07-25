import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/modules/login/views/login_view.dart';
import 'package:felpus/app/modules/signup/views/signup_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/app_text_style/styles.dart';
import '../../../common/widgets/custom_button.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppImages.logo)),
          sh20,
          Column(
            children: [
              Text("Now continue after",style:  h3.copyWith(fontSize: 30,),textAlign: TextAlign.center,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("register in",style:  h3.copyWith(fontSize: 30),textAlign: TextAlign.center,),
                  sw10,
                  Text("Felpus.",style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),

                ],
              )
            ],
          ),
          sh50,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Image.asset(AppImages.welcomeImg)),
          sh20,
          CustomButton(ontap: () => Get.to(() => LoginView()),title: "Sign In", width: Get.width / 1.2, color: AppColors.mainColor),
          sh15,
          CustomButton(ontap: () => Get.to(() => SignupView()),title: "Sign Up", width: Get.width / 1.2, color: AppColors.white,borderColor: AppColors.mainColor,titleColor: AppColors.black,),

        ],
      )
    );
  }
}
