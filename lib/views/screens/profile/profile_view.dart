import 'dart:ui';
import 'package:felpus/helpers/other_helper.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/person_info_custom_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/profile_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: GetBuilder<ProfileController>(
          builder: (controller) {
            return controller.isLoading
                ? const CustomLoader()
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.oliveLight,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: AppColors.olive,
                                            spreadRadius: 0,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: ImageFiltered(
                                          imageFilter: ImageFilter.blur(
                                              sigmaX: 2, sigmaY: 2),
                                          child: Image.asset(
                                            AppImages.allPets,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 30,
                                      left: 30,
                                      child: InkWell(
                                          onTap: () => Get.back(),
                                          child:
                                              const Icon(Icons.arrow_back_ios)),
                                    ),
                                    Positioned(
                                      bottom: -50,
                                      right: 120,
                                      left: 120,
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: AppColors.grayLight
                                              .withOpacity(0.2),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: AppColors.grayLight
                                                  .withOpacity(0.1),
                                              width: 2),
                                        ),
                                        child: ClipOval(
                                          child: CustomImage(
                                            imageSrc:
                                                controller.userModel.photo,
                                            imageType: ImageType.network,
                                            height: 150,
                                            width: 150,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                sh30,
                                Column(
                                  children: [
                                    sh20,
                                    Text(
                                      "@${controller.userModel.fullName.split(" ")[0].toString().toLowerCase()}",
                                      style: h4.copyWith(
                                          fontSize: 15,
                                          color: AppColors.grayLight),
                                    ),
                                    Text(
                                      controller.userModel.fullName,
                                      style: h1.copyWith(fontSize: 22),
                                    ),
                                    Text(
                                      "Joined : ${OtherHelper.formatDate(controller.userModel.createdAt)}",
                                      style: h4.copyWith(
                                          fontSize: 15,
                                          color: AppColors.grayLight),
                                    ),
                                    sh15,
                                    Container(
                                      width: Get.width / 3,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.black)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              AppImages.chat,
                                              scale: 4,
                                            ),
                                            sw5,
                                            Text(
                                              "Message",
                                              style: h3,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    sh5,
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Text(
                                        controller.userModel.bio,
                                        style: h4,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          sh20,
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.oliveLight,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Information",
                                    style: h2.copyWith(fontSize: 18),
                                  ),
                                  sh20,
                                  personInfoCustomRow(
                                      iconPath: AppImages.user,
                                      title: "Name",
                                      titleInfo: controller.userModel.fullName,
                                      imageScale: 7),

                                  personInfoCustomRow(
                                    iconPath: AppImages.calender,
                                    title: "Date of Birth",
                                    titleInfo: controller.userModel.dob,
                                  ),

                                  personInfoCustomRow(
                                    iconPath: AppImages.homeLocation,
                                    title: "Address",
                                    titleInfo: controller.userModel.address,
                                  ),

                                  personInfoCustomRow(
                                    iconPath: AppImages.phone,
                                    title: "Phone",
                                    titleInfo: controller.userModel.phone,
                                  ),

                                  personInfoCustomRow(
                                    iconPath: AppImages.email,
                                    title: "Email",
                                    titleInfo: controller.userModel.email,
                                  ),

                                  // personInfoCustomRow(
                                  //   iconPath: AppImages.web,
                                  //   title: "Website",
                                  //   titleInfo: "www.felpusapp.com",
                                  // ),

                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
