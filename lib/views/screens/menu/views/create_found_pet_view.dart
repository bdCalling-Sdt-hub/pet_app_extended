import 'dart:io';
import 'package:felpus/views/components/custom_button.dart';
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
  String _selectedPet = 'Choose Your Pet';
  final List<String> _pets = ['Choose Your Pet', 'Dog', 'Cat', 'Bird', 'Fish'];

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sh20,
                Container(
                  width: Get.width,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedPet,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: h2,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedPet = newValue!;
                        });
                      },
                      items: _pets.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                sh10,
                Obx(() =>   imagePickerController.selectedImagePath.value == ''? GestureDetector(
                  onTap: () {
                    imagePickerController.pickImage(ImageSource.gallery);
                  },
                  child: Container(
                    height: 110,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.gray,style: BorderStyle.solid,width: 1)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.photo,scale: 4,color: AppColors.black,),
                        Text("Upload a picture of your pet",style: h3,textAlign: TextAlign.center,)

                      ],
                    ),
                  ),
                ): GestureDetector(
                  onTap: () {
                    imagePickerController.pickImage(ImageSource.gallery);
                  },
                  child: Container(
                      height: 110,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.gray,style: BorderStyle.solid,width: 1)
                      ),
                      child: ClipOval(child: Image.file(File(imagePickerController.selectedImagePath.value)))
                  ),
                ),),
                sh10,
                CustomTextField(title: "Name", width: Get.width, hintText: "Enter your pet’s name.",horizontalPadding: 0,optional: true,),
                CustomTextField(title: "Age", width: Get.width, hintText: "Enter your pet’s age.",horizontalPadding: 0,optional: true),
                CustomTextField(title: "Breed", width: Get.width, hintText: "What breed is your pet?",horizontalPadding: 0,),
                CustomTextField(title: "Sex", width: Get.width, hintText: "What is your pet's gender?",horizontalPadding: 0,),
                CustomTextField(title: "Address", width: Get.width, hintText: "Enter your address.",horizontalPadding: 0,),
                CustomTextField(title: "Microchip Number", width: Get.width,hintText: "Enter your pets microchip number",horizontalPadding: 0,optional: true),
                CustomTextField(title: "Description", width: Get.width, hintText: "Write a short description about your pet",horizontalPadding: 0,),
                sh5,
                CustomButton(title: "Create Pet Card", width: Get.width, color: AppColors.mainColor,horizontalPadding: 0,),
                sh10,
              ],
            ),
          ),
        ));
  }
}
