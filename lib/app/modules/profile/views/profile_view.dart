import 'dart:ui';

import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_text_style/styles.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
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
                                imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
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
                                child: const Icon(Icons.arrow_back_ios)),
                          ),
                          Positioned(
                            bottom: -50,
                            right: 120,
                            left: 120,
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: AppColors.grayLight.withOpacity(0.2),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.grayLight.withOpacity(0.1),
                                    width: 2),
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  AppImages.boy,
                                  fit: BoxFit.fill,
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
                            "@samim",
                            style: h4.copyWith(fontSize: 15,color: AppColors.whiteGray),
                          ),
                          Text(
                            "Samim Jaman",
                            style: h1.copyWith(fontSize: 22),
                          ),
                          Text(
                            "Joined June 2024",
                            style: h4.copyWith(fontSize: 15,color: AppColors.whiteGray),
                          ),

                          sh15,
                          Container(
                            width: Get.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColors.black)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                            child: Text(
                              "Passionate pet lover dedicated to rescuing and re-homing lost animals. Advocate for pet adoption and animal welfare.",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.user,
                                  scale: 7,
                                ),
                                sw5,
                                Text(
                                  "Name :",
                                  style: h2,
                                )
                              ],
                            ),
                            Text(
                              "Samim",
                              style: h3,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.calender,
                                  scale: 4,
                                ),
                                sw5,
                                Text(
                                  "Date of Birth :",
                                  style: h2,
                                )
                              ],
                            ),
                            Text(
                              "12-07-1990",
                              style: h3,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  AppImages.homeLocation,
                                  scale: 4,
                                ),
                                sw5,
                                Text(
                                  "Address :",
                                  style: h2,
                                )
                              ],
                            ),
                            Text(
                              "Avenida Cervantes 5,\n Elantxobe, Biscay, 48310",
                              style: h3,
                              textAlign: TextAlign.end,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.phone,
                                  scale: 4,
                                ),
                                sw5,
                                Text(
                                  "Phone :",
                                  style: h2,
                                )
                              ],
                            ),
                            Text(
                              "+85298563784",
                              style: h3,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.email,
                                  scale: 4,
                                ),
                                sw5,
                                Text(
                                  "Email :",
                                  style: h2,
                                )
                              ],
                            ),
                            Text(
                              "admin@gmail.com",
                              style: h3,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.web,
                                  scale: 4,
                                ),
                                sw5,
                                Text(
                                  "Website :",
                                  style: h2,
                                )
                              ],
                            ),
                            Text(
                              "www.felpusapp.com",
                              style: h3,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
