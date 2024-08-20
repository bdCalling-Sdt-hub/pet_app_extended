import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pet_details_controller.dart';

class PetDetailsView extends GetView<PetDetailsController> {
  const PetDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<PetDetailsController>(
      builder: (controller) => controller.isLoading
          ? const CircularProgressIndicator()
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.oliveLight,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                    onTap: () => Get.back(),
                                    child: const Icon(Icons.arrow_back_ios)),
                                Text(
                                  "Pet’s Information",
                                  style: h2.copyWith(fontSize: 18),
                                ),
                                sw50,
                              ],
                            ),
                            sh30,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(AppImages.catWithGirl),
                                  ),
                                  sh5,
                                  Text(
                                    controller.petModel.breed,
                                    style: h1.copyWith(fontSize: 28),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Sex: ",
                                                style: h3,
                                              ),
                                              Text(
                                                controller.petModel.sex,
                                                style: h4,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Color: ",
                                                style: h3,
                                              ),
                                              Text(
                                                "Brown",
                                                style: h4,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Age: ",
                                                style: h3,
                                              ),
                                              Text(
                                                controller.petModel.age,
                                                style: h4,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Weight: ",
                                                style: h3,
                                              ),
                                              Text(
                                                "2Kg",
                                                style: h4,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  sh15,
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.oliveDeep,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            AppImages.editInfo,
                                            scale: 4,
                                          ),
                                          sw5,
                                          Text(
                                            "Description About The Pet:",
                                            style: h3,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  sh5,
                                  Text(
                                    "My 1.5-year-old brown cat is full of energy and curiosity. She loves exploring, climbing, and chasing toys with playful pounces. She's also very affectionate, often seeking attention and cuddles.",
                                    style: h4,
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                          children: [
                            Text(
                              "Owner’s Information",
                              style: h2.copyWith(fontSize: 18),
                            ),
                            sh30,
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    ));
  }
}
