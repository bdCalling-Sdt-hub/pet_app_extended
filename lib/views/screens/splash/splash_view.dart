
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/utils/app_images/app_images.dart';
import 'package:felpus/utils/app_text_style/styles.dart';
import 'package:felpus/views/screens/dashboard/dashboard_view.dart';
import 'package:felpus/views/screens/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      return chooseScreen();
    });
    super.initState();
  }
  chooseScreen() {
    if(PrefsHelper.token.isEmpty){
      Get.offAll(() =>  OnboardingView());
    }else{
      Get.offAll(() => DashboardView());
    }
  }
/*    debugPrint("<<<<<<<<<<==userId: ${LocalStorage.getData(key: AppConstant.userId)}==>>>>>>>>>>>");

    var userId = LocalStorage.getData(key: AppConstant.userId);
    if (userId != null) {
      Get.offAll(() =>  DashboardView());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset(AppImages.logo)),
          SizedBox(height: 78.h,),
          Text("Protect, Locate, Adopt. \nEnsuring Every Pet's Safety and Forever Home.",style: h3,textAlign: TextAlign.center,)
        ],
      )
    );
  }
}
