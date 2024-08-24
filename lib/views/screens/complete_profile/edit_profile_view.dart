import 'dart:io';

import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helpers/image_picker.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../../components/custom_button.dart';
import '../../components/custom_textfelid.dart';
import '../../../controllers/complete_profile_controller.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  final CompleteProfileController completeProfileController =
      Get.put(CompleteProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Edit Your Profile',
            style: h2.copyWith(fontSize: 20, color: AppColors.mainColor),
          ),
          centerTitle: true,
          leading: InkWell(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sh20,
              Stack(
                children: [
                  Obx(() => imagePickerController.selectedImagePath.value == ''
                      ? Container(
                          height: 128,
                          width: 128,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.mainColor.withOpacity(0.2),
                                width: 2),
                          ),
                          child: PrefsHelper.userImageUrl != ""
                              ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: CustomImage(
                                  defaultImage: AppImages.profile,
                                    imageSrc: PrefsHelper.userImageUrl,
                                    imageType: ImageType.network,
                                  ),
                              )
                              : Icon(
                                  CupertinoIcons.person,
                                  size: 100,
                                  color: AppColors.mainColor.withOpacity(0.2),
                                ),
                        )
                      : Container(
                          height: 128,
                          width: 128,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.mainColor.withOpacity(0.2),
                                width: 2),
                          ),
                          child: ClipOval(
                              child: Image.file(File(imagePickerController
                                  .selectedImagePath.value))))),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        imagePickerController.pickImage(ImageSource.gallery);
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: AppColors.mainColor.withOpacity(0.2),
                                width: 2),
                          ),
                          child: Image.asset(
                            AppImages.edit,
                            scale: 4,
                          )),
                    ),
                  )
                ],
              ),
              sh10,
              CustomTextField(
                controller: completeProfileController.fullNameController,
                title: "Full Name",
                width: Get.width,
                hintText: "Enter your full name",
              ),
              CustomTextField(
                controller: completeProfileController.phoneController,
                title: "Phone",
                width: Get.width,
                hintText: "Enter your phone number",
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Date of Birth",
              //         style: h3.copyWith(color: AppColors.textColor),
              //       ),
              //       const SizedBox(
              //         height: 12,
              //       ),
              //       GestureDetector(
              //         onTap: () {
              //           completeProfileController.selectDate(context);
              //         },
              //         child: Container(
              //           height: 50,
              //           width: Get.width,
              //           decoration: BoxDecoration(
              //               color: AppColors.white,
              //               borderRadius: BorderRadius.circular(10),
              //               border: Border.all(color: AppColors.grayLight)),
              //           child: Padding(
              //               padding:
              //                   const EdgeInsets.symmetric(horizontal: 8.0),
              //               child: Row(
              //                 children: [
              //                   sw5,
              //                   const Icon(
              //                     Icons.calendar_today_outlined,
              //                     color: AppColors.grayLight,
              //                   ),
              //                   sw5,
              //                   Obx(() => Text(
              //                         completeProfileController.formattedDate,
              //                         style: h4.copyWith(
              //                             color: AppColors.grayLight,
              //                             fontSize: 16),
              //                       ))
              //                 ],
              //               )),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              CustomTextField(
                controller: completeProfileController.locationController,
                title: "Address",
                width: Get.width,
                hintText: "Enter your address",
              ),
              sh20,
              completeProfileController.isLoading
                  ? const CustomLoader()
                  : CustomButton(
                      onTap: () {
                        completeProfileController.updateProfileRepo();
                      },
                      title: "Update",
                      width: Get.width,
                      color: AppColors.mainColor,
                    ),
              sh10,
            ],
          ),
        ));
  }
}
