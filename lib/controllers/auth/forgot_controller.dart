import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;
import '../../helpers/prefs_helper.dart';
import '../../services/api_service.dart';
import '../../utils/App_Urls/app_urls.dart';
import '../../utils/App_Utils/app_utils.dart';
import '../../views/screens/complete_profile/complete_profile_view.dart';
import '../../views/screens/forgot/verify_view.dart';
import '../signup_controller.dart';

class ForgotController extends GetxController {

  static ForgotController get instance => Get.put(ForgotController());
  //TODO: Implement ForgotController

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

  Timer? timer;
  int start = 0;

  bool isLoadingEmail = false;
  TextEditingController emailController = TextEditingController(text: kDebugMode? "faginib689@acpeak.com" : "");
  TextEditingController otpController = TextEditingController();

  ///<<<================= Timer Repo ========================>>>

  void startTimer() {
    start = 180;
    const oneSec = Duration(seconds: 1);
    timer =  Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
          update();
        }
      },
    );
  }

  Future<void> forgotPasswordRepo() async {
  // Get.toNamed(AppRoutes.verifyEmail);
  // return;
    try{
      isLoadingEmail = true;
      update();

      Map<String, String> body = {
        "email": emailController.text,
      };
      var response = await ApiService.postApi(AppUrls.forgotPassword, body);

      if (response.statusCode == 200) {
        Utils.toastMessage(message: response.message);
        Get.to(() => VerifyView());

      } else {
        Utils.snackBarErrorMessage(response.statusCode.toString(), response.message);
      }
      isLoadingEmail = false;
      update();
    }catch(e){
      Utils.snackBarErrorMessage("Oops!,", "$e");
      print.log("Error: $e");
      isLoadingEmail = false;
      update();
    }
}


  ///==============>>> Verify Otp Repo <<<=================

  bool isLoading = false;
  String userId = "";
  verifyOtpRepo() async {
    try{
      isLoading = true;
      update();

      Map<String, String> body = {
        "otp" : otpController.text,
        "userToken" : "${SignupController.signUpToken}"
      };

      var response = await ApiService.postApi(AppUrls.verifyOtp, body,);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        PrefsHelper.userId =  data['data']['user']['_id'];
        PrefsHelper.token =  data['data']['accessToken'];

        PrefsHelper.setString("userId", data['data']['user']['_id']);
        PrefsHelper.setString("token", data['data']['accessToken']);

        Get.to(() => CompleteProfileView());
        Utils.snackBarSuccessMessage("Success:", "Email verification completed.");

      } else {
        print.log(response.statusCode.toString());
        Utils.snackBarErrorMessage("Oops!", response.message);
      }
      isLoading = false;
      update();
    }catch(e){
      Utils.snackBarErrorMessage("Oops!", "$e");
      print.log("Error : $e");
      isLoading = false;
      update();
    }
  }
}
