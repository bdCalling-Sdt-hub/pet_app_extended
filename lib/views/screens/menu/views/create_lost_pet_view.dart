import 'dart:io';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/validator_helper.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/views/components/custom_container_button.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text_field.dart';
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
            CreateLostPetView.isUpdate? "Update Your Pet Card" :
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
                      hintText: CreateLostPetView.isUpdate? CreateLostPetView.petListDetails.petName : "Enter your pet’s name.",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.nameController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Age",
                      hintText: CreateLostPetView.isUpdate? CreateLostPetView.petListDetails.age : "Enter your pet’s age.",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.ageController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Breed",
                      hintText: CreateLostPetView.isUpdate? CreateLostPetView.petListDetails.breed :"What breed is your pet?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.breedController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Gender",
                      hintText: CreateLostPetView.isUpdate? CreateLostPetView.petListDetails.sex :"What is your pet's gender?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.genderController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Color",
                      hintText: CreateLostPetView.isUpdate? CreateLostPetView.petListDetails.color :"What is your pet's color?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.colorController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Weight",
                      hintText: CreateLostPetView.isUpdate? CreateLostPetView.petListDetails.weight :"What is your pet's weight?",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.weightController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Address",
                      hintText: CreateLostPetView.isUpdate? CreateLostPetView.petListDetails.address :"Enter your address.",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.addressController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Microchip Number",
                      optional: true,
                      hintText: CreateLostPetView.isUpdate? CreateLostPetView.petListDetails.microchipNumber :"Enter your pets microchip number",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.microchipNumberController,
                    ),
                    12.height,
                    CustomTextFormField(
                      title: "Description",
                      hintText: CreateLostPetView.isUpdate? CreateLostPetView.petListDetails.description :"Write a short description about your pet",
                      horizontalPadding: 0,
                      validator: ValidatorHelper.validator,
                      controller: controller.descriptionController,
                    ),
                    12.height,
                    controller.isLoading
                        ? const CustomLoader()
                        : CustomContainerButton(
                            text: CreateLostPetView.isUpdate? "Update" : "Create Pet Card",
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
