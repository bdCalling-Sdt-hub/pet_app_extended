import 'dart:io';
import 'package:felpus/controllers/menu_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/validator_helper.dart';
import 'package:felpus/views/components/DropDownButtons/breed_selection_drop_down.dart';
import 'package:felpus/views/components/DropDownButtons/gender_selection_drop_down.dart';
import 'package:felpus/views/components/custom_container_button.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:felpus/views/components/custom_text_field.dart';
import 'package:felpus/views/components/DropDownButtons/pet_selection_drop_down.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../helpers/image_picker.dart';
import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_text_style/styles.dart';
import '../../../../utils/size_box/custom_sizebox.dart';

class CreateFoundPetView extends StatefulWidget {
  const CreateFoundPetView({super.key});

  @override
  State<CreateFoundPetView> createState() => _CreateFoundPetViewState();
}

class _CreateFoundPetViewState extends State<CreateFoundPetView> {
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Create Found Pet Card'.tr,
            style: h2.copyWith(fontSize: 20, color: AppColors.mainColor),
          ),
          centerTitle: true,
          leading: InkWell(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
        ),
        body: GetBuilder<MenuDataController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    sh20,
                    petSelectionDropDown(controller),
                    sh10,
                    controller.image == null
                        ? GestureDetector(
                      onTap: controller.selectImage,
                      child: Container(
                        height: 110,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColors.gray,
                                style: BorderStyle.solid,
                                width: 1)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.photo,
                              scale: 4,
                              color: AppColors.black,
                            ),
                            Text(
                              "Upload a picture of your pet".tr,
                              style: h3,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    )
                        : GestureDetector(
                      onTap: controller.selectImage,
                      child: Container(
                          height: 110,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.gray,
                                  style: BorderStyle.solid,
                                  width: 1)),
                          child: ClipOval(
                              child: Image.file(
                                  File(controller.image!)))),
                    ),
                    sh10,
                    CustomTextFormField(
                      optional: true,
                      title: "Name".tr,
                      hintText: "Enter your pet’s name.".tr,
                      horizontalPadding: 0,
                      controller: controller.nameController,
                    ),
                    12.height,
                    CustomTextFormField(
                      optional: true,
                      title: "Age".tr,
                      hintText: "Enter your pet’s age.".tr,
                      horizontalPadding: 0,
                      controller: controller.ageController,
                    ),
                    12.height,
                    CustomText(text: "Breed".tr, fontWeight: FontWeight.w600, bottom: 8),
                    breedSelectionDropDown(controller),
                    8.height,
                    if (controller.showBreedInputField)
                      CustomTextFormField(
                        title: "Other Breed".tr,
                        hintText: "Enter the breed name".tr,
                        controller: controller.breedController,
                        horizontalPadding: 0,
                        validator: ValidatorHelper.validator,
                      ),
                    12.height,
                    CustomText(text: "Sex".tr, fontWeight: FontWeight.w600, bottom: 8),
                    genderSelectionDropDown(controller),
                    12.height,
                    CustomTextFormField(
                      title: "Color".tr,
                      hintText: "What is your pet's color?".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.colorController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Weight".tr,
                      hintText: "What is your pet's weight?".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.weightController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Address".tr,
                      hintText: "Enter your address.".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.addressController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Microchip Number".tr,
                      optional: true,
                      hintText: "Enter your pets microchip number".tr,
                      horizontalPadding: 0,
                      controller: controller.microchipNumberController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Description".tr,
                      hintText: "Write a short description about your pet".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.descriptionController,
                    ),
                    12.height,
                    controller.isLoading
                        ? const CustomLoader()
                        : CustomContainerButton(
                      text: "Create Pet Card".tr,
                      width: Get.width,
                      backgroundColor: AppColors.mainColor,
                      height: 42,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          controller.addPetsRepo(forPets: "found");
                        }
                      },
                    ),
                    30.height,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
