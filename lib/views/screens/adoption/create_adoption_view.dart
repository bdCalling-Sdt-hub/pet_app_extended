import 'dart:io';
import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_textfelid.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helpers/image_picker.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';


class CreateAdoptionView extends StatefulWidget {
  const CreateAdoptionView({super.key});

  @override
  State<CreateAdoptionView> createState() => _CreateAdoptionViewState();
}

class _CreateAdoptionViewState extends State<CreateAdoptionView> {
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
            'Create Card For Pet Adoption',
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
                sh30,
                Text("Basic Information:",style: h2.copyWith(color: AppColors.mainColor,fontSize: 20,decoration: TextDecoration.underline,decorationColor: AppColors.mainColor),),
                sh5,
                CustomTextField(title: "Name", width: Get.width, hintText: "Enter your pet’s name.",horizontalPadding: 0,),
                CustomTextField(title: "Age", width: Get.width, hintText: "Enter your pet’s age.",horizontalPadding: 0,),
                CustomTextField(title: "Species", width: Get.width, hintText: "What species is your pet?",horizontalPadding: 0,),
                CustomTextField(title: "Sex", width: Get.width, hintText: "What is your pet's gender?",horizontalPadding: 0,),
                CustomTextField(title: "Weight", width: Get.width, hintText: "Please enter your pet's weight.",horizontalPadding: 0,),
                CustomTextField(title: "Address", width: Get.width, hintText: "Enter your address.",horizontalPadding: 0,),
                sh5,
                Text("Health and Wellness Information:",style: h2.copyWith(color: AppColors.mainColor,fontSize: 20,decoration: TextDecoration.underline,decorationColor: AppColors.mainColor),),
                sh5,
                CustomTextField(title: "Health condition", width: Get.width, hintText: "Write about your pet’s health condition",horizontalPadding: 0,),
                CustomTextField(title: "Spay/neuter", width: Get.width, hintText: "Is spaying/neutering safe for my pet?",horizontalPadding: 0,),
                CustomTextField(title: "Vaccine", width: Get.width, hintText: "Is your pet vaccinated?",horizontalPadding: 0,),
                CustomTextField(title: "Microchip", width: Get.width, hintText: "Enter your pets microchip number.",horizontalPadding: 0,),
                sh5,
                Text("Behavior & Personality:",style: h2.copyWith(color: AppColors.mainColor,fontSize: 20,decoration: TextDecoration.underline,decorationColor: AppColors.mainColor),),
                sh5,
                CustomTextField(title: "Temper", width: Get.width, hintText: "Is your pet calm or energetic?",horizontalPadding: 0,),
                CustomTextField(title: "Activity level", width: Get.width, hintText: "What is your pet's activity level?",horizontalPadding: 0,),
                CustomTextField(title: "Behavior with other Creatures", width: Get.width, hintText: "Is the pet good with kids and other animals?",horizontalPadding: 0,),
                CustomTextField(title: "Special needs", width: Get.width, hintText: "Does your pet have any special needs?",horizontalPadding: 0,),
                sh5,
                Text("Additional Information:",style: h2.copyWith(color: AppColors.mainColor,fontSize: 20,decoration: TextDecoration.underline,decorationColor: AppColors.mainColor),),
                sh5,
                CustomTextField(title: "Pet history", width: Get.width, hintText: "Previous medical issues?",horizontalPadding: 0,),
                CustomTextField(title: "Photographs and videos", width: Get.width, hintText: "Share your pet's pics and vids, please!",horizontalPadding: 0,),
                CustomTextField(title: "Organization or Contact Information", width: Get.width, hintText: "Need adoption details, please provide.",horizontalPadding: 0,),
                sh5,
                CustomButton(title: "Create Pet Card", width: Get.width, color: AppColors.mainColor,horizontalPadding: 0,),
                sh10,
              ],
            ),
          ),
        ));
  }
}
