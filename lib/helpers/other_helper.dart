
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as print;
import '../utils/app_color/app_colors.dart';




class OtherHelper {

  static Future<void> dateOfBirthPicker(
      TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.mainColor, // <-- SEE HERE
              onPrimary: AppColors.white, // <-- SEE HERE
              onSurface: AppColors.black, // <-- SEE HERE
            ),
          ),
          child: child!),
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = "${picked.year}/${picked.month}/${picked.day}";
    }
  }

  static Future<String> datePicker(
      TextEditingController controller,
      ) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.mainColor,
            ),
          ),
          child: child!),
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = "${picked.year}/${picked.month}/${picked.day}";
      return picked.toIso8601String();
    }

    return "";
  }

  static Future<String?> openGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 5);
    if (getImages == null) return null;
    print.log(getImages.path);

    return getImages.path;
  }

  //Pick Image from Camera

  static Future<String?> openCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
    await picker.pickImage(source: ImageSource.camera, imageQuality: 5);
    if (getImages == null) return null;
    print.log(getImages.path);


    return getImages.path;
  }

  static Future openTimePicker(TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      controller.text =
      "${picked.hour} : ${picked.minute < 10 ? "0${picked.minute}" : picked.minute}";
    }
  }

  /// Date formatter
  static String formatDate(String isoDate) {
    // Parse the ISO date string
    DateTime dateTime = DateTime.parse(isoDate);

    // Format the date
    String formattedDate = DateFormat('dd MMMM yyyy').format(dateTime);

    return formattedDate;
  }

  /// Time formatter
  static String formatTime(String createdAt) {
    // Parse the UTC time
    DateTime utcTime = DateTime.parse(createdAt);

    // Convert it to local time
    DateTime localTime = utcTime.toLocal();

    // Format the time to "hh:mm a" (e.g., "06:35 PM")
    String formattedTime = DateFormat('hh:mm a').format(localTime);

    return formattedTime;
  }
}
