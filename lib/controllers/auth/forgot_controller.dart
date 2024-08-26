import 'dart:async';
import 'dart:convert';
import 'package:felpus/views/screens/login/login_view.dart';
import 'package:felpus/views/screens/reset_password/reset_password_view.dart';
import 'package:felpus/views/screens/verify/forget_verify_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:developer' as print;
import '../../core/app_routes.dart';
import '../../helpers/prefs_helper.dart';
import '../../services/api_service.dart';
import '../../utils/App_Urls/app_urls.dart';
import '../../utils/App_Utils/app_utils.dart';
import '../../views/screens/complete_profile/complete_profile_view.dart';
import '../../views/screens/Verify/verify_view.dart';
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
  TextEditingController emailController =
      TextEditingController(text: kDebugMode ? "faginib689@acpeak.com" : "");
  TextEditingController otpController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ///<<<================= Timer Repo ========================>>>

  void startTimer() {
    start = 180;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
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

  ///<<<==================== Forgot Password Get Otp Repo =====================>>>

  Future<void> forgotPasswordRepo() async {
    // Get.toNamed(AppRoutes.verifyEmail);
    // return;
    try {
      isLoadingEmail = true;
      update();

      Map<String, String> body = {
        "email": emailController.text,
      };
      var response = await ApiService.postApi(AppUrls.forgotPassword, body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        PrefsHelper.token = data['data']['verifyToken'];
        // PrefsHelper.setString("token", data['data']['accessToken']);

        Utils.toastMessage(message: response.message);
        Get.to(() => ForgetVerifyView());
      } else {
        Utils.snackBarErrorMessage(
            response.statusCode.toString(), response.message);
      }
      isLoadingEmail = false;
      update();
    } catch (e) {
      Utils.snackBarErrorMessage("Oops!,", "$e");
      print.log("Error: $e");
      isLoadingEmail = false;
      update();
    }
  }

  ///==============>>> Verify Sign Up Otp Repo <<<=================

  bool isLoading = false;
  String userId = "";

  verifyOtpRepo() async {
    try {
      isLoading = true;
      update();

      Map<String, String> body = {
        "otp": otpController.text,
        "userToken": "${SignupController.signUpToken}"
      };

      var response = await ApiService.postApi(
        AppUrls.verifyOtp,
        body,
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        PrefsHelper.userId = data['data']['user']['_id'];
        PrefsHelper.token = data['data']['accessToken'];

        PrefsHelper.setString("userId", data['data']['user']['_id']);
        PrefsHelper.setString("token", data['data']['accessToken']);

        Get.to(() => CompleteProfileView());
        Utils.snackBarSuccessMessage(
            "Success:", "Email verification completed.");
      } else {
        print.log(response.statusCode.toString());
        Utils.snackBarErrorMessage("Oops!", response.message);
      }
      isLoading = false;
      update();
    } catch (e) {
      Utils.snackBarErrorMessage("Oops!", "$e");
      print.log("Error : $e");
      isLoading = false;
      update();
    }
  }

  ///==============>>> Verify Forgot Pass Otp Repo <<<=================

  verifyForgotOtpRepo() async {
    try {
      isLoading = true;
      update();

      Map<String, String> body = {
        "otp": otpController.text,
        "verifyToken": PrefsHelper.token
      };

      var response =
          await ApiService.patchApi(AppUrls.verifyForgetOtp, body: body);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        PrefsHelper.token = data['data'];
        Get.toNamed(AppRoutes.resetPasswordView);
      } else {
        print.log(response.statusCode.toString());
        Utils.snackBarErrorMessage("Oops!", response.message);
      }
      isLoading = false;
      update();
    } catch (e) {
      Utils.snackBarErrorMessage("Oops!", "$e");
      print.log("Error : $e");
      isLoading = false;
      update();
    }
  }

  ///==============>>> Reset Pass Repo <<<=================

  Future<void> resetPasswordRepo() async {
    try {
      isLoading = true;
      update();

      Map<String, String> body = {
        "password": newPasswordController.text,
        "verifyToken": PrefsHelper.token
      };
      var response =
          await ApiService.patchApi(AppUrls.resetPassword, body: body);

      if (response.statusCode == 200) {
        Utils.toastMessage(message: response.message);
        Get.offAll(() => LoginView());

        emailController.clear();
        otpController.clear();
        newPasswordController.clear();
        confirmNewPasswordController.clear();
      } else {
        Get.snackbar(response.statusCode.toString(), response.message);
      }
      isLoading = false;
      update();
    } catch (e) {
      Utils.snackBarErrorMessage("Oops!", "$e");
      print.log("Error : $e");
      isLoading = false;
      update();
    }
  }


  ///==============>>> Change Pass Repo <<<=======================
  Future<void> changePasswordRepo() async {
    try {
      isLoading = true;
      update();

      Map<String, String> header = {
        'Authorization' : PrefsHelper.token
      };

      Map<String, String> body = {
        "oldPassword": passwordController.text,
        "newPassword": newPasswordController.text,
      };
      var response = await ApiService.patchApi(AppUrls.changePassword, body: body, header: header);

      if (response.statusCode == 200) {
        Get.back();
        Utils.toastMessage(message: response.message);
        passwordController.clear();
        newPasswordController.clear();
        confirmNewPasswordController.clear();
      } else {
        Get.snackbar(response.statusCode.toString(), response.message);
      }
      isLoading = false;
      update();
    } catch (e) {
      Utils.snackBarErrorMessage("Oops!", "$e");
      print.log("Error : $e");
      isLoading = false;
      update();
    }
  }
}
