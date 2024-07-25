import 'package:get/get.dart';

import '../../../common/app_images/app_images.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  List onboardingList = [
    {"title" : "Protect your pets from any crisis easily by using", "subTitle" : "Keep your pets safe", "image" : AppImages.onboarding},
    {"title" : "Adopt or Foster a Pet by using", "subTitle" : "Easily find pets available for adoption or foster care in your area.", "image" : AppImages.onboarding2},
    {"title" : "Resources for Crisis Pets in", "subTitle" : "Access emergency resources and support for pets in crisis situations.", "image" : AppImages.onboarding3},
  ];

  int currentPosition = 0;
  updatePosition(){
    currentPosition++;
    update();
  }

}
