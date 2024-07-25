import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/custom_button.dart';
import 'package:felpus/app/modules/welcome/views/welcome_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';
import 'dart:developer' as print;

class OnboardingView extends GetView<OnboardingController> {
  OnboardingView({super.key});

  @override
  final controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: GetBuilder<OnboardingController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (value) {

                  controller.currentPosition = value;
                  print.log("===============$value");
                },
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.onboardingList.length,
                itemBuilder: (context, index) {
                  index = controller.currentPosition;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.icon),
                      sh20,
                      Text( controller.onboardingList[index]["title"],style:  h3.copyWith(fontSize: 24,),textAlign: TextAlign.center,),
                      Text("Felpus.",style:  h3.copyWith(
                          color: AppColors.mainColor,
                          fontSize: 24
                      ),),
                      sh10,
                      Text(controller.onboardingList[index]["subTitle"],style:  h4,textAlign: TextAlign.center,),
                      sh15,
                      Image.asset(controller.onboardingList[index]["image"]),
                      sh20,
                      CustomButton(
                          ontap: () {
                            if(index !=2){
                              if(controller.currentPosition <= controller.onboardingList.length - 1 ){
                                controller.updatePosition();
                              }
                            }else{
                              Get.to(() => const WelcomeView());
                            }
                          },
                          title: index != 2? "Next" : "Get Started",
                          width: Get.width / 2.5,
                          color: AppColors.mainColor)

                    ],
                  );
                },),
            );
          },)
      )
    );
  }
}
