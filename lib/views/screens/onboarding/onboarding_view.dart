import 'package:felpus/views/components/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/onboarding_controller.dart';
import 'dart:developer' as print;

import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../welcome/welcome_view.dart';

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
                  itemCount: controller.onboardingList.length,
                  itemBuilder: (context, index) {
                    index = controller.currentPosition;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.icon),
                        sh20,
                        Text( controller.onboardingList[index]["title"].toString().tr,style:  h3.copyWith(fontSize: 24,),textAlign: TextAlign.center,),
                        Text("Felpus.".tr,style:  h3.copyWith(
                            color: AppColors.mainColor,
                            fontSize: 24
                        ),),
                        sh10,
                        Text(controller.onboardingList[index]["subTitle"].toString().tr,style:  h4,textAlign: TextAlign.center,),
                        sh15,
                        Image.asset(controller.onboardingList[index]["image"]),
                        sh20,
                        CustomButton(
                            onTap: () {
                              if(index !=2){
                                if(controller.currentPosition <= controller.onboardingList.length - 1 ){
                                  controller.updatePosition();
                                }
                              }else{
                                Get.to(() => const WelcomeView());
                              }
                            },
                            title: index != 2? "Next".tr : "Get Started".tr,
                            width: Get.width / 2.5,
                            color: AppColors.mainColor)
                      ],
                    );
                  },
                ),
              );
            })
        )
    );
  }
}
