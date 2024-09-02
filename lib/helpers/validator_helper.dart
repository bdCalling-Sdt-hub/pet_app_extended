import 'package:get/get.dart';


class ValidatorHelper {
  static RegExp emailRegexp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static RegExp passRegExp = RegExp(r'(?=.*[a-z])(?=.*[0-9])');

  static String? validator(value) {
    if (value.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }

  static String? emailValidator(
      value,
      ) {
    if (value!.isEmpty) {
      return "This field is required".tr;
    } else if (!emailRegexp.hasMatch(value)) {
      return "Enter valid email".tr;
    } else {
      return null;
    }
  }

  static String? passwordValidator(value) {
    if (value.isEmpty) {
      return "This field is required".tr;
    } else if (value.length < 8) {
      return "Password must be 8 characters & contain both \nalphabets and numerics"
          .tr;
    } else if (!passRegExp.hasMatch(value)) {
      return "Password must be 8 characters & contain both \nalphabets and numerics"
          .tr;
    } else {
      return null;
    }
  }

  static String? confirmPasswordValidator(value, passwordController) {
    if (value.isEmpty) {
      return "This field is required".tr;
    } else if (value != passwordController.text) {
      return "The password does not match".tr;
    } else {
      return null;
    }
  }

}
