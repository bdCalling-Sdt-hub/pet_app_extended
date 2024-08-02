import 'package:felpus/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as print;


class PrefsHelper {
  static String token = "";
  static bool isEmailVerified = false;
  static bool coachWorkingStatus = false;

  static String userRole = "";
  static bool isLogIn = false;
  static bool isNotifications = true;
  static String refreshToken = "";
  static String userId = "";
  // static String myImage = "";
  static String userName = "";
  static String userEmail = "";
  static String userPhone = "";
  static String userImageUrl = "";
  static String userDob = "";
  static String userAge = "";
  static String userGender = "";
  static String userHeight = "";

  static String localizationLanguageCode = 'en';
  static String localizationCountryCode = 'US';
  static bool isCoachSignIn = false;

  ///<<<======================== Get All Data Form Shared Preference ==============>

  static Future<void> getAllPrefData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    token = preferences.getString("token") ?? "";
    isEmailVerified = preferences.getBool("isEmailVerified") ?? false;

    userRole = preferences.getString("userRole") ?? "";
    refreshToken = preferences.getString("refreshToken") ?? "";
    userId = preferences.getString("userId") ?? "";
    // myImage = preferences.getString("myImage") ?? "";

    userName = preferences.getString("userName") ?? "";
    userEmail = preferences.getString("userEmail") ?? "";
    userPhone = preferences.getString("userPhone") ?? "";
    userImageUrl = preferences.getString("userImageUrl") ?? "";

    userDob = preferences.getString("userDob") ?? "";
    userAge = preferences.getString("userAge") ?? "";
    userGender = preferences.getString("userGender") ?? "";
    userHeight = preferences.getString("userHeight") ?? "";

    isLogIn = preferences.getBool("isLogIn") ?? false;
    isNotifications = preferences.getBool("isNotifications") ?? true;
    localizationCountryCode =
        preferences.getString("localizationCountryCode") ?? "US";
    localizationLanguageCode =
        preferences.getString("localizationLanguageCode") ?? "en";
    isCoachSignIn = preferences.getBool("isCoachSignIn") ?? false;
    coachWorkingStatus = preferences.getBool("coachWorkingStatus") ?? false;

      print.log("UserID: =========>>> $userId");
      print.log("Access Token: ======>>> $token");

  }

  ///<<<======================== Get All Data Form Shared Preference ============>
  static Future<void> removeAllPrefData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    preferences.setString("token", "");
    preferences.setString("refreshToken", "");
    preferences.setString("userId", "");
    preferences.setString("userImageUrl", "");
    preferences.setString("userName", "");
    preferences.setString("userEmail", "");
    preferences.setBool("isLogIn", false);
    preferences.setBool("isEmailVerified", false);
    preferences.setBool("isCoachSignIn", false);
    preferences.setBool("isNotifications", true);
    preferences.setString("userType", "doctor");

    Get.offAll(()=> LoginView());
    getAllPrefData();
  }

  ///<<<======================== Get Data Form Shared Preference ==============>

  static Future<String> getString(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key) ?? "";
  }

  static Future<bool?> getBool(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key);
  }

  static Future<int> getInt(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key) ?? (-1);
  }

  ///<<<=====================Save Data To Shared Preference=====================>

  static Future setString(String key, value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setString(key, value);
  }

  static Future setBool(String key, bool value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setBool(key, value);
  }

  static Future setInt(String key, int value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.setInt(key, value);
  }

  ///<<<==========================Remove Value==================================>

  static Future remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }
}
