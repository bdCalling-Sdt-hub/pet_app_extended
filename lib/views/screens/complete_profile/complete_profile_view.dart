import 'dart:io';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/validator_helper.dart';
import 'package:felpus/views/components/custom_auth_appbar.dart';
import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text_field.dart';
import 'package:felpus/views/components/custom_textfelid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helpers/image_picker.dart';
import '../../../controllers/complete_profile_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../profile_location/profile_location_view.dart';

class CompleteProfileView extends StatelessWidget {
  CompleteProfileView({super.key});

  final CompleteProfileController completeProfileController = Get.put(CompleteProfileController());
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAuthAppBar(),
      body: SingleChildScrollView(
        child: GetBuilder<CompleteProfileController>(builder: (controller) {
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 sh20,
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Complete Your".tr,
                        style: h3.copyWith(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Profile.".tr,
                        style: h3.copyWith(fontSize: 30, color: AppColors.mainColor),
                        textAlign: TextAlign.center,
                      ),
                      sh5,
                      Text(
                        "Fill up your information.".tr,
                        style: h4,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                sh20,
                Stack(
                  children: [
                    Obx(
                          () => imagePickerController.selectedImagePath.value == ''
                          ? Container(
                        height: 128,
                        width: 128,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.mainColor.withOpacity(0.2), width: 2),
                        ),
                        child: const Image(image: AssetImage(AppImages.demoProfileImg)),
                      )
                          : Container(
                        height: 128,
                        width: 128,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.mainColor.withOpacity(0.2), width: 2),
                        ),
                        child: ClipOval(
                          child: imagePickerController.isLoading.value? const CustomLoader() : Image.file(File(imagePickerController.selectedImagePath.value), fit: BoxFit.fill,),
                        ),
                      ),
                    ),
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
                            border: Border.all(color: AppColors.mainColor.withOpacity(0.2), width: 2),
                          ),
                          child: Image.asset(AppImages.edit, scale: 4),
                        ),
                      ),
                    ),
                  ],
                ),
                sh10,
                CustomTextFormField(
                  controller: controller.fullNameController,
                  title: "Full Name".tr,
                  validator: ValidatorHelper.validator,
                  hintText: "Enter your full name".tr,
                ),
                8.height,
                CustomTextFormField(
                  controller: controller.phoneController,
                  title: "Phone".tr,
                  keyboardType: TextInputType.phone,
                  validator: ValidatorHelper.validator,
                  hintText: "Enter your phone number".tr,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date of Birth".tr,
                        style: h3.copyWith(color: AppColors.textColor),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          completeProfileController.selectDate(context);
                        },
                        child: Container(
                          height: 50,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.grayLight),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                sw5,
                                const Icon(Icons.calendar_today_outlined, color: AppColors.grayLight),
                                sw5,
                                Obx(
                                      () => Text(
                                    completeProfileController.formattedDate,
                                    style: h4.copyWith(color: AppColors.grayLight, fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sh20,
                CustomButton(
                  onTap: () {
                    if(_formKey.currentState!.validate()){
                      Get.to(() => ProfileLocationView());
                    }
                  },
                  title: "Next".tr,
                  width: Get.width,
                  color: AppColors.mainColor,
                ),
                sh10,
              ],
            ),
          );
        },),
      ),
    );
  }
}
