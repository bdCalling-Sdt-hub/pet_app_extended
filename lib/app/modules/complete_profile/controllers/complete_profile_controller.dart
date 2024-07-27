import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CompleteProfileController extends GetxController {

  static CompleteProfileController get instance => Get.put(CompleteProfileController());
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

  TextEditingController locationController = TextEditingController();

  setLocation({required String address}){
    locationController.text = address;
    update();
  }
}
