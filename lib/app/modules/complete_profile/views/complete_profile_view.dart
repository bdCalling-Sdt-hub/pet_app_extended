import 'dart:io';

import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/widgets/custom_auth_appbar.dart';
import 'package:felpus/app/common/widgets/custom_button.dart';
import 'package:felpus/app/common/widgets/custom_textfelid.dart';
import 'package:felpus/app/modules/dashboard/views/dashboard_view.dart';
import 'package:felpus/app/modules/profile_location/views/profile_location_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_text_style/styles.dart';
import '../../../common/helper/image_picker.dart';
import '../../../common/size_box/custom_sizebox.dart';
import '../controllers/complete_profile_controller.dart';

class CompleteProfileView extends StatelessWidget {
   CompleteProfileView({super.key});

   final CompleteProfileController completeProfileController = Get.put(CompleteProfileController());
   final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAuthAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sh20,
            Center(
              child: Column(
                children: [
                  Text("Complete Your",style:  h3.copyWith(fontSize: 30,),textAlign: TextAlign.center,),
                  Text("Profile.",style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),
                  sh5,
                  Text("Fill up your information.",style:  h4,textAlign: TextAlign.center,),
                ],
              ),
            ),
            sh20,
           Stack(
             children: [
              Obx(() =>  imagePickerController.selectedImagePath.value == ''? Container(
                height: 128,
                width: 128,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.mainColor.withOpacity(0.2),width: 2),
                ),
                child: const Image(image: AssetImage(AppImages.demoProfileImg)),
              ) : Container(
                  height: 128,
                  width: 128,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.mainColor.withOpacity(0.2),width: 2),
                  ),
                  child: ClipOval(child: Image.file(File(imagePickerController.selectedImagePath.value))))),
               Positioned(
                 bottom: 0,
                   right: 0,
                   child: GestureDetector(
                     onTap: (){
                       imagePickerController.pickImage(ImageSource.gallery);
                     },
                     child: Container(
                       height: 40,
                       width: 40,
                       decoration: BoxDecoration(
                         color: AppColors.white,
                         shape: BoxShape.circle,
                         border: Border.all(color: AppColors.mainColor.withOpacity(0.2),width: 2),
                       ),
                       child: Image.asset(AppImages.edit,scale: 4,)
                     ),
                   ),
               )
             ],
           ),
            sh10,
            CustomTextField(title: "Full Name", width: Get.width,hintText: "Enter your full name",),
            CustomTextField(title: "Phone", width: Get.width,hintText: "Enter your phone number",),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date of Birth",style: h3.copyWith(color: AppColors.textColor),),
                  const SizedBox(height: 12,),
                  GestureDetector(
                    onTap: (){
                      completeProfileController.selectDate(context);
                    },
                    child: Container(
                      height: 50,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.grayLight)
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            sw5,
                            const Icon(Icons.calendar_today_outlined,color: AppColors.grayLight,),
                            sw5,
                           Obx(() =>  Text(completeProfileController.formattedDate,style: h4.copyWith(color: AppColors.grayLight,fontSize: 16),))
                          ],
                        )
                      ),
                    ),
                  )
                ],
              ),
            ),
            sh20,
            CustomButton(onTap: () => Get.to(() => ProfileLocationView()),title: "Next", width: Get.width, color: AppColors.mainColor,),
            sh10,
        
          ],
        ),
      )
    );
  }
}

