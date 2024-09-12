
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:felpus/views/components/person_info_custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/pet_details_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';

class PetDetailsView extends GetView<PetDetailsController> {
  const PetDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<PetDetailsController>(        
      builder: (controller) => controller.isLoading
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
                                  "Pet’s Information".tr,
                                  style: h2.copyWith(fontSize: 18),
                                ),
                                sw50,
                              ],
                            ),
                            20.height,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: CustomImage(imageSrc: controller.petModel.photo, imageType: ImageType.network, height: 250.h, width: Get.width,),
                                  ),
                                  sh5,
                                  Center(
                                    child: Text(
                                      controller.petModel.breed,
                                      style: h1.copyWith(fontSize: 28),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${"Name".tr} : ",
                                        style: h3,
                                      ),
                                      Text(
                                        controller.petModel.petName,
                                        style: h3,
                                      ),
                                    ],
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
                                                "${"Sex".tr} : ",
                                                style: h3,
                                              ),
                                              Text(
                                                controller.petModel.sex.tr,
                                                style: h4,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${"Color".tr} : ",
                                                style: h3,
                                              ),
                                              Text(
                                                controller.petModel.color,
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
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${"Age".tr} : ",
                                                style: h3,
                                              ),
                                              controller.petModel.age.isEmpty? const SizedBox():                                              Text(
                                                "${controller.petModel.age} ${"years".tr}",
                                                style: h4,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${"Weight".tr} : ",
                                                style: h3,
                                              ),
                                              controller.petModel.weight.isEmpty? const SizedBox():
                                              Text(
                                                "${controller.petModel.weight} kg",
                                                style: h4,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  if(controller.petModel.forPets == "adopt")...[
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
                                                  "${"Health Con".tr} : ",
                                                  style: h3,
                                                ),
                                                Text(
                                                  controller.petModel.healthCondition,
                                                  style: h4,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${"Neuter".tr} : ",
                                                  style: h3,
                                                ),
                                                Text(
                                                  controller.petModel.neuter,
                                                  style: h4,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${"Vaccine".tr} : ",
                                                  style: h3,
                                                ),
                                                Text(controller.petModel.vaccine,
                                                  style: h4,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "${"Temper".tr} : ",
                                                  style: h3,
                                                ),
                                                Text(
                                                  controller.petModel.temper,
                                                  style: h4,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                  Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${"Microchip".tr} : ",
                                        style: h3,
                                      ),
                                      Text(
                                        controller.petModel.microchipNumber,
                                        style: h4,
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
                                            "${"Description About The Pet".tr}:",
                                            style: h3,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  sh5,
                                  Text(
                                    controller.petModel.description,
                                    style: h4,
                                    textAlign: TextAlign.justify,
                                  ),
                                  if(controller.petModel.forPets == "adopt")...[
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${"Pet History".tr} : ",
                                          style: h3,
                                        ),
                                        Text(
                                          controller.petModel.petHistory,
                                          style: h4,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${"Contact Information".tr} : ",
                                          style: h3,
                                        ),
                                        Text(
                                          controller.petModel.contactInformation,
                                          style: h4,
                                        ),
                                      ],
                                    ),
                                  ],
                                  if(controller.petModel.forPets == "found")...[
                                    8.height,
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.oliveDeep,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.location_on, color: AppColors.mainColor,),
                                            sw5,
                                            Text(
                                              "${"Found Location".tr}:",
                                              style: h3,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    CustomText(
                                      maxLines: 2,
                                        text: controller.petModel.address)
                                  ]
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    sh20,
                    controller.petModel.userId != null?
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.oliveLight,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Text(
                              "Owner’s Information".tr,
                              style: h2.copyWith(fontSize: 18),
                            ),
                            sh30,
                            personInfoCustomRow(iconPath: AppImages.user, imageScale: 7,title: "Name".tr, titleInfo: controller.petModel.userId!.fullName),
                            personInfoCustomRow(iconPath: AppImages.homeLocation, title: "Address".tr, titleInfo: controller.petModel.userId!.address),
                            personInfoCustomRow(iconPath: AppImages.phone, title: "Phone".tr, titleInfo: controller.petModel.userId!.phone),
                            personInfoCustomRow(iconPath: AppImages.email, title: "Email".tr, titleInfo: controller.petModel.userId!.email),
                          ],
                        ),
                      ),
                    ) : const SizedBox(),
                  ],
                ),
              ),
            ),
    ));
  }
}
