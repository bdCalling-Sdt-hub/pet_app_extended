import 'dart:io';
import 'package:felpus/controllers/menu_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/validator_helper.dart';
import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_container_button.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text_field.dart';
import 'package:felpus/views/components/custom_textfelid.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
            'Create Found Pet Card',
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
                    Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: controller.selectedPet,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24,
                          elevation: 16,
                          style: h2,
                          onChanged: controller.selectPet,
                          items: controller.pets
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
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
                              "Upload a picture of your pet",
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
                              child:
                              Image.file(File(controller.image!)))),
                    ),
                    sh10,
                    CustomTextFormField(
                      optional: true,
                      title: "Name",
                      hintText: "Enter your pet’s name.",
                      horizontalPadding: 0,
                      controller: controller.nameController,
                    ),
                    12.height,
                    CustomTextFormField(
                      optional: true,
                      title: "Age",
                      hintText: "Enter your pet’s age.",
                      horizontalPadding: 0,
                      controller: controller.ageController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Breed",
                      hintText: "What breed is your pet?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.breedController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Gender",
                      hintText: "What is your pet's gender?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.genderController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Color",
                      hintText: "What is your pet's color?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.colorController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Weight",
                      hintText: "What is your pet's weight?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.weightController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Address",
                      hintText: "Enter your address.",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.addressController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Microchip Number",
                      optional: true,
                      hintText: "Enter your pets microchip number",
                      horizontalPadding: 0,
                      controller: controller.microchipNumberController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Description",
                      hintText: "Write a short description about your pet",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.descriptionController,
                    ),
                    12.height,
                    controller.isLoading
                        ? const CustomLoader()
                        : CustomContainerButton(
                      text: "Create Pet Card",
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
        )
    );
  }
}
