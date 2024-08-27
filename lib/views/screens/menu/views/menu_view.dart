
import 'package:felpus/controllers/my_pet_controller.dart';
import 'package:felpus/controllers/profile_controller.dart';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/menu_controller.dart';
import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_text_style/styles.dart';
import '../../../../utils/size_box/custom_sizebox.dart';
import '../../../components/CustomPopUP/pop_up.dart';
import '../../complete_profile/edit_profile_view.dart';
import '../../profile/profile_view.dart';
import 'create_pet_view.dart';
import 'faq_view.dart';
import 'report_found_pet_view.dart';
import 'report_lost_pet_view.dart';
import 'settings_view.dart';
import 'your_pet_view.dart';

class MenuView extends GetView<MenuDataController> {
  const MenuView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                      onTap: () {
                        ProfileController.instance.getProfileRepo();
                        Get.to(() => const ProfileView());
                      },
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
                                      child: CustomImage(imageSrc: PrefsHelper.userImageUrl, imageType: ImageType.network,),
                                    ),
                                  ),
                                  sw10,
                                  Text(PrefsHelper.userName,style: h3,),
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
                  profileCard(image: AppImages.memberCard, title: 'Your Pet Cards', onTap: () { Get.to(() => const YourPetView()); }),
                  profileCard(image: AppImages.vaccinations, title: 'Create Pet Cards', onTap: () { Get.to(() => const CreatePetView()); }),
                  profileCard(image: AppImages.report, title: 'Report Lost Pet', onTap: () { MyPetController.petType = "lost"; Get.to(() => const ReportLosPetView()); }),
                  profileCard(image: AppImages.clipboard, title: 'Report Found Pet', onTap: () {MyPetController.petType = "found"; Get.to(() => const ReportFoundPetView()); }),
                  profileCard(image: AppImages.question, title: 'FAQ', onTap: () { Get.to(() => const FaqView()); }),
                  profileCard(image: AppImages.setting, title: 'Settings', onTap: () {Get.to(() => const SettingsView());   }),
                  profileCard(
                      image: AppImages.logout,
                      title: 'Log Out',
                      onTap: () {
                        PopUp.logOutPopUp();
                      }),
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
                      decoration: const BoxDecoration(
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
