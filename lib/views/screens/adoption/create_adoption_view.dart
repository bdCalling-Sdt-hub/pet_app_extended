import 'dart:io';
import 'package:felpus/controllers/menu_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/validator_helper.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:felpus/views/components/custom_container_button.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:felpus/views/components/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../helpers/image_picker.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';


class CreateAdoptionView extends StatefulWidget {
  const CreateAdoptionView({super.key});

  static bool isUpdate = false;
  static var petListDetails = PetModel();

  @override
  State<CreateAdoptionView> createState() => _CreateAdoptionViewState();
}

class _CreateAdoptionViewState extends State<CreateAdoptionView> {
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            CreateAdoptionView.isUpdate? "Update Your Pet Card" :
            'Create Card For Pet Adoption',
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
                    20.height,
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
                    12.height,
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
                    const CustomText(
                      top: 16,
                      bottom: 12,
                      text: "Basic Information:",
                      fontSize: 20,
                      color: AppColors.mainColor,
                      isTextDecoration: true,
                    ),

                    CustomTextFormField(
                      title: "Name",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.petName : "Enter your pet’s name.",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.nameController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Age",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.age :"Enter your pet’s age.",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.ageController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Breed",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.breed : "What breed is your pet?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.breedController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Gender",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.sex :"What is your pet's gender?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.genderController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Color",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.color :"What is your pet's color?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.colorController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Weight",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.weight :"What is your pet's weight?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.weightController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Address",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.address :"Enter your address.",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.addressController,
                    ),

                    const CustomText(
                      top: 16,
                      bottom: 12,
                      text: "Health and Wellness Information:",
                      fontSize: 20,
                      color: AppColors.mainColor,
                      isTextDecoration: true,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Health Condition",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.healthCondition : "Write about your pet’s health condition",
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.healthConditionController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Spay/Neuter",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.neuter :"Is spaying/neutering safe for my pet?",
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.neuterController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Vaccine",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.vaccine :"Is your pet vaccinated?",
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.vaccineController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Microchip",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.microchipNumber :"Enter your pets microchip number",
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.microchipNumberController,
                    ),


                    const CustomText(
                      top: 16,
                      bottom: 12,
                      text: "Behavior & Personality:",
                      fontSize: 20,
                      color: AppColors.mainColor,
                      isTextDecoration: true,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Temper",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.temper :"Is your pet calm or energetic?",
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.temperController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Activity Level",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.activityLevel :"What is your pet's activity level?",
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.activityLevelController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Behavior with other Creatures",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.behavior :"Is the pet good with kids and other animals?",
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.behaviorController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Special Needs",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.specialNeeds :"Does your pet have any special needs?",
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.specialNeedsController,
                    ),

                    const CustomText(
                      top: 16,
                      bottom: 12,
                      text: "Additional Information:",
                      fontSize: 20,
                      color: AppColors.mainColor,
                      isTextDecoration: true,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Pet History",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.petHistory :"Previous medical issues?",
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.petHistoryController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Organization or Contact Information",
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.contactInformation :"Need adoption details, please provide.",
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.contactInfoController,
                    ),

                    12.height,
                    controller.isLoading
                        ? const CustomLoader()
                        : CustomContainerButton(
                      text: CreateAdoptionView.isUpdate? "Update" : "Create Pet Card",
                      width: Get.width,
                      backgroundColor: AppColors.mainColor,
                      height: 42,
                      onTap: () {
                        if(CreateAdoptionView.isUpdate){
                          controller.updatePetDetailsRepo(petId: CreateAdoptionView.petListDetails.id);
                        }else{
                          if (formKey.currentState!.validate()) {
                            if(controller.image != null){
                              controller.addPetsRepo(forPets: "adopt");
                            }else{
                              Utils.snackBarErrorMessage("Select your pet image first!", "");
                            }
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
