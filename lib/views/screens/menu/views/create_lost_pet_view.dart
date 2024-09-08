import 'dart:io';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/validator_helper.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/views/components/DropDownButtons/breed_selection_drop_down.dart';
import 'package:felpus/views/components/DropDownButtons/gender_selection_drop_down.dart';
import 'package:felpus/views/components/custom_container_button.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:felpus/views/components/custom_text_field.dart';
import 'package:felpus/views/components/DropDownButtons/pet_selection_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/menu_controller.dart';
import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_text_style/styles.dart';
import '../../../../utils/size_box/custom_sizebox.dart';

class CreateLostPetView extends StatefulWidget {
  const CreateLostPetView({super.key});

  static bool isUpdate = false;
  static var petListDetails = PetModel();

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
            CreateLostPetView.isUpdate ? "Update Your Pet Card".tr :
            'Create Lost Pet Card'.tr,
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
                              child:
                              Image.file(File(controller.image!)))),
                    ),
                    sh10,
                    CustomTextFormField(
                      title: "Name".tr,
                      hintText: CreateLostPetView.isUpdate ? CreateLostPetView.petListDetails.petName : "Enter your pet’s name.".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.nameController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Age".tr,
                      hintText: CreateLostPetView.isUpdate ? CreateLostPetView.petListDetails.age : "Enter your pet’s age.".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
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
                      hintText: CreateLostPetView.isUpdate ? CreateLostPetView.petListDetails.color :"What is your pet's color?".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.colorController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Weight".tr,
                      hintText: CreateLostPetView.isUpdate ? CreateLostPetView.petListDetails.weight :"What is your pet's weight?".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.weightController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Address".tr,
                      hintText: CreateLostPetView.isUpdate ? CreateLostPetView.petListDetails.address :"Enter your address.".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.addressController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Microchip Number".tr,
                      optional: true,
                      hintText: CreateLostPetView.isUpdate ? CreateLostPetView.petListDetails.microchipNumber :"Enter your pets microchip number".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.microchipNumberController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Description".tr,
                      hintText: CreateLostPetView.isUpdate ? CreateLostPetView.petListDetails.description :"Write a short description about your pet".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.descriptionController,
                    ),
                    12.height,
                    controller.isLoading
                        ? const CustomLoader()
                        : CustomContainerButton(
                      text: CreateLostPetView.isUpdate ? "Update".tr : "Create Pet Card".tr,
                      width: Get.width,
                      backgroundColor: AppColors.mainColor,
                      height: 42,
                      onTap: () {
                        if(CreateLostPetView.isUpdate){
                          controller.updatePetDetailsRepo(petId: CreateLostPetView.petListDetails.id);
                        }else{
                          if (formKey.currentState!.validate()) {
                            controller.addPetsRepo(forPets: "lost");
                          }
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
