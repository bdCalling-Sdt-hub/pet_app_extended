import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/modules/menu/views/create_pet_view.dart';
import 'package:felpus/app/modules/menu/views/faq_view.dart';
import 'package:felpus/app/modules/menu/views/password_change_view.dart';
import 'package:felpus/app/modules/menu/views/report_found_pet_view.dart';
import 'package:felpus/app/modules/menu/views/report_lost_pet_view.dart';
import 'package:felpus/app/modules/menu/views/settings_view.dart';
import 'package:felpus/app/modules/menu/views/your_pet_view.dart';
import 'package:felpus/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../complete_profile/views/edit_profile_view.dart';
import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuDataController> {
  const MenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title:  Text('Menu',style: h2.copyWith(fontSize: 22,color: AppColors.mainColor),),
       //   centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7.0),
                    child: GestureDetector(
                      onTap: () => Get.to(() => ProfileView()),
                      child: Container(
                        height: 65,
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.grayLight.withOpacity(0.8),
                                      shape: BoxShape.circle,
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(
                                        AppImages.boy,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  sw10,
                                  Text("Samim Jaman",style: h3,),
                                ],
                              ),
                              GestureDetector(
                                onTap: () => Get.to(() => EditProfileView()),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(AppImages.editUser,scale: 3,),
                                    Text("Edit Profile",style: h3.copyWith(fontSize: 10),)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  profileCard(image: AppImages.memberCard, title: 'Your Pet Cards', onTap: () { Get.to(() => YourPetView()); }),
                  profileCard(image: AppImages.vaccinations, title: 'Create Pet Cards', onTap: () { Get.to(() => CreatePetView()); }),
                  profileCard(image: AppImages.report, title: 'Report Lost Pet', onTap: () { Get.to(() => ReportLosPetView()); }),
                  profileCard(image: AppImages.clipboard, title: 'Report Found Pet', onTap: () { Get.to(() => ReportFoundPetView()); }),
                  profileCard(image: AppImages.question, title: 'FAQ', onTap: () { Get.to(() => FaqView()); }),
                  profileCard(image: AppImages.setting, title: 'Settings', onTap: () {Get.to(() => SettingsView());   }),
                  profileCard(image: AppImages.logout, title: 'Log Out', onTap: () {  }),

                ]
            ),
          ),
        )
    );
  }

  Padding profileCard({required String image, required String title,required Function()? onTap,}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 65,
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      // width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        //shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        image,scale: 4,
                        fit: BoxFit.fill,
                      ),
                    ),
                    sw10,
                    Text(title,style: h3,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
