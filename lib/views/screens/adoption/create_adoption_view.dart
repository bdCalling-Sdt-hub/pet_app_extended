import 'dart:io';
import 'package:felpus/controllers/menu_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/validator_helper.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:felpus/views/components/DropDownButtons/breed_selection_drop_down.dart';
import 'package:felpus/views/components/DropDownButtons/gender_selection_drop_down.dart';
import 'package:felpus/views/components/custom_container_button.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:felpus/views/components/custom_text_field.dart';
import 'package:felpus/views/components/DropDownButtons/pet_selection_drop_down.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../helpers/image_picker.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';


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
            CreateAdoptionView.isUpdate? "Update Your Pet Card".tr :
            'Create Card For Pet Adoption'.tr,
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
                    petSelectionDropDown(controller),
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
                    CustomText(
                      top: 16,
                      bottom: 12,
                      text: "Basic Information:".tr,
                      fontSize: 20,
                      color: AppColors.mainColor,
                      isTextDecoration: true,
                    ),

                    CustomTextFormField(
                      title: "Name".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.petName.tr : "Enter your pet’s name.".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.nameController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Age".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.age.tr :"Enter your pet’s age.".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.ageController,
                    ),
                    12.height,
                    CustomText(text: "Breed".tr, fontWeight: FontWeight.w600, bottom: 8,),
                    breedSelectionDropDown(controller),
                    12.height,
                    CustomText(text: "Sex".tr, fontWeight: FontWeight.w600, bottom: 8),
                    genderSelectionDropDown(controller),
                    12.height,
                    CustomTextFormField(
                      title: "Color".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.color.tr :"What is your pet's color?".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.colorController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Weight".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.weight.tr :"What is your pet's weight?".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.weightController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Address".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.address.tr :"Enter your address.".tr,
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.addressController,
                    ),

                    CustomText(
                      top: 16,
                      bottom: 12,
                      text: "Health and Wellness Information:".tr,
                      fontSize: 20,
                      color: AppColors.mainColor,
                      isTextDecoration: true,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Health Condition".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.healthCondition.tr : "Write about your pet’s health condition".tr,
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.healthConditionController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Spay/Neuter".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.neuter.tr :"Is spaying/neutering safe for my pet?".tr,
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.neuterController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Vaccine".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.vaccine.tr :"Is your pet vaccinated?".tr,
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.vaccineController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Microchip".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.microchipNumber.tr :"Enter your pets microchip number".tr,
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.microchipNumberController,
                    ),


                    CustomText(
                      top: 16,
                      bottom: 12,
                      text: "Behavior & Personality:".tr,
                      fontSize: 20,
                      color: AppColors.mainColor,
                      isTextDecoration: true,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Temper".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.temper.tr :"Is your pet calm or energetic?".tr,
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.temperController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Activity Level".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.activityLevel.tr :"What is your pet's activity level?".tr,
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.activityLevelController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Behavior with other Creatures".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.behavior.tr :"Is the pet good with kids and other animals?".tr,
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.behaviorController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Special Needs".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.specialNeeds.tr :"Does your pet have any special needs?".tr,
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.specialNeedsController,
                    ),

                    CustomText(
                      top: 16,
                      bottom: 12,
                      text: "Additional Information:".tr,
                      fontSize: 20,
                      color: AppColors.mainColor,
                      isTextDecoration: true,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Pet History".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.petHistory.tr :"Previous medical issues?".tr,
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.petHistoryController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Organization or Contact Information".tr,
                      hintText: CreateAdoptionView.isUpdate? CreateAdoptionView.petListDetails.contactInformation.tr :"Need adoption details, please provide.".tr,
                      validator: ValidatorHelper.validator,
                      horizontalPadding: 0,
                      controller: controller.contactInfoController,
                    ),

                    12.height,
                    controller.isLoading
                        ? const CustomLoader()
                        : CustomContainerButton(
                      text: CreateAdoptionView.isUpdate? "Update".tr : "Create Pet Card".tr,
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
                              Utils.snackBarErrorMessage("Select your pet image first!".tr, "");
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
