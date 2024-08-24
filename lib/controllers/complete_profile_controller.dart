import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as print;
import '../helpers/image_picker.dart';
import '../helpers/prefs_helper.dart';
import '../services/api_service.dart';
import '../utils/App_Urls/app_urls.dart';
import '../utils/App_Utils/app_utils.dart';
import '../views/screens/profile_location/profile_location_view.dart';

class CompleteProfileController extends GetxController {
  static CompleteProfileController get instance =>
      Get.put(CompleteProfileController());
  var selectedDate = DateTime.now().obs;

  String get formattedDate => DateFormat('dd-MM-yy').format(selectedDate.value);

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  TextEditingController locationController =
      TextEditingController(text: PrefsHelper.address);
  TextEditingController fullNameController =
      TextEditingController(text: PrefsHelper.userName);
  TextEditingController phoneController =
      TextEditingController(text: PrefsHelper.userPhone);

  setLocation({required String address}) {
    locationController.text = address;
    update();
  }

  bool isLoading = false;

  Future<void> updateProfileRepo() async {
    isLoading = true;
    update();
    print.log("repo is called");

    Map<String, String> header = {
      'Authorization': PrefsHelper.token,
    };

    Map<String, String> body = {
      "fullName": fullNameController.text,
      "phone": phoneController.text,
      "address": locationController.text,
    };

    String? imagePath = ImagePickerController.instance.selectedImagePath.value;
    print.log("Selected Image Path : $imagePath");

    var response = await ApiService.multipartRequest(
        url: "${AppUrls.users}/${PrefsHelper.userId}",
        body: body,
        imagePath: imagePath,
        header: header);

    print.log(response.body);
    print.log(response.message);
    print.log("${response.statusCode}");

    if (response.statusCode == 200) {
      ProfileLocationView.showCustomBottomSheet();
      var responseData = jsonDecode(response.body);
      Utils.snackBarSuccessMessage(
          "Success:", "Your account information updated successfully");

      PrefsHelper.userName = responseData['data']['fullName'];
      PrefsHelper.userImageUrl = responseData['data']['photo'];
      PrefsHelper.address = responseData['data']['address'];
      PrefsHelper.userPhone = responseData['data']['phone'];

      PrefsHelper.setString("userName", responseData['data']['fullName']);
      PrefsHelper.setString("userImageUrl", responseData['data']['photo']);
      PrefsHelper.setString("address", responseData['data']['address']);
      PrefsHelper.setString("userPhone", responseData['data']['phone']);

      Get.back();
    } else {
      Utils.snackBarErrorMessage("Oops!!", "Something went wrong, try again!");
    }
    isLoading = false;
    update();
  }
}
