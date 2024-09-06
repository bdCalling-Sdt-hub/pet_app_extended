
import 'package:felpus/controllers/menu_controller.dart';
import 'package:felpus/utils/app_color/app_colors.dart';
import 'package:felpus/utils/app_text_style/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container petSelectionDropDown(MenuDataController controller) {
  return Container(
    width: Get.width,
    padding: const EdgeInsets.symmetric(
        horizontal: 20.0, vertical: 2.0),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.grayLight),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: controller.selectedPet,
        hint: Text("Choose Your Pet".tr),
        icon: const Icon(Icons.arrow_drop_down),
        iconSize: 24,
        elevation: 16,
        style: h2,
        onChanged: controller.selectPet,
        items: controller.petCategories
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value.tr),
          );
        }).toList(),
      ),
    ),
  );
}