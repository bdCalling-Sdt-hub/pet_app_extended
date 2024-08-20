import 'dart:io';

import 'package:felpus/app/common/Extension/extension.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/helper/validator_helper.dart';
import 'package:felpus/app/common/widgets/custom_container_button.dart';
import 'package:felpus/app/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/app_color/app_colors.dart';
import '../../../common/app_images/app_images.dart';
import '../../../common/size_box/custom_sizebox.dart';
import '../controllers/menu_controller.dart';

class CreateLostPetView extends StatefulWidget {
  const CreateLostPetView({super.key});

  @override
  State<CreateLostPetView> createState() => _CreateLostPetViewState();
}

class _CreateLostPetViewState extends State<CreateLostPetView> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Create Lost Pet Card',
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
                      title: "Name",
                      hintText: "Enter your pet’s name.",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.nameController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Age",
                      hintText: "Enter your pet’s age.",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
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
                      validator: ValidatorHelper.validator,
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
                    CustomContainerButton(
                      text: "Create Pet Card",
                      width: Get.width,
                      backgroundColor: AppColors.mainColor,
                      height: 42,
                      onTap: () {
                        print("fjsdfj");
                        if (formKey.currentState!.validate()) {
                          controller.addLostPetRepo();
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
