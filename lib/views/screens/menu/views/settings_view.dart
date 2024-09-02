
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/views/components/CustomPopUP/custom_pop_up.dart';
import 'package:felpus/views/components/CustomPopUP/pop_up.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_text_style/styles.dart';
import '../../../../utils/size_box/custom_sizebox.dart';
import '../../complete_profile/edit_profile_view.dart';
import 'password_change_view.dart';


class SettingsView extends GetView {
  const SettingsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Settings',
            style: h2.copyWith(fontSize: 20, color: AppColors.mainColor),
          ),
          centerTitle: true,
          leading: InkWell(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: GestureDetector(
                onTap: (){
                  Get.to(() => EditProfileView());
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.editUser, scale: 2,
                          fit: BoxFit.fill,
                        ),
                        sw10,
                        Text("Edit Profile",style: h2,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: GestureDetector(
                onTap: (){
                  Get.to(() => PasswordChangeView());
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.resetPassword,scale: 4,
                          fit: BoxFit.fill,
                        ),
                        12.width,
                        Text("Change Password",style: h2,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: GestureDetector(
                onTap: (){

                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomImage(imageSrc: AppImages.translateIcon, imageColor: AppColors.black,),
                        12.width,
                        Text("Change Language",style: h2,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: GestureDetector(
                onTap: (){
                  PopUp.deleteAccountPopUp();
                  // Get.to(() => const PasswordChangeView());
                },
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],

                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          AppImages.deleteIcon,scale: 2,
                          fit: BoxFit.fill,
                        ),
                        16.width,
                        Text("Delete Account",style: h2,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
