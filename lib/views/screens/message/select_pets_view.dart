import 'package:felpus/controllers/message_controller.dart';
import 'package:felpus/controllers/my_pet_controller.dart';
import 'package:felpus/utils/App_Utils/app_utils.dart';
import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import 'message_view.dart';

class SelectPetsView extends StatefulWidget {
  const SelectPetsView({super.key});

  @override
  State<SelectPetsView> createState() => _SelectPetsViewState();
}

class _SelectPetsViewState extends State<SelectPetsView> {
  var selectedPet = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Select Pets'.tr,
          style: h2.copyWith(fontSize: 26, color: AppColors.black),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: [
          Image.asset(AppImages.emergencyPet),
          Container(
            width: Get.width,
            height: Get.height,
            color: AppColors.white.withOpacity(0.7),
          ),
          GetBuilder<MyPetController>(
            builder: (controller) {
              return controller.isLoading
                  ? const CustomLoader()
                  : controller.myPetList.isEmpty
                      ? const NoData()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: controller.myPetList.length,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 18.0,
                              mainAxisExtent: 280, // Remove fixed height
                            ),
                            itemBuilder: (context, index) {
                              var petListItems = controller.myPetList[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedPet = index;
                                  });
                                  MessageController.petId = petListItems.id;
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Container(
                                    width: 158.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: selectedPet == index
                                          ? AppColors.mainColor
                                          : AppColors.olive,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 6),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: CustomImage(
                                              imageSrc: petListItems.photo,
                                              imageType: ImageType.network,
                                              height: 120.h,
                                              width: 158.w,
                                            ),
                                          ),
                                          const SizedBox(
                                              height: 8), // Add some spacing
                                          Wrap(
                                            children: [
                                              Text(
                                                "${petListItems.petName}, ",
                                                style: h2.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: selectedPet == index
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                              ),
                                              Text(
                                                petListItems.breed,
                                                style: h2.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                  color: selectedPet == index
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                              height: 4), // Add some spacing
                                          Row(
                                            children: [
                                              Text(
                                                "${petListItems.sex}, ",
                                                style: h4.copyWith(
                                                  fontSize: 13,
                                                  color: selectedPet == index
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                              ),
                                              Text(
                                                "${petListItems.age} ${"Years.".tr}",
                                                style: h4.copyWith(
                                                  fontSize: 13,
                                                  color: selectedPet == index
                                                      ? AppColors.white
                                                      : AppColors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                              height: 4), // Add some spacing
                                          Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.location_solid,
                                                color: selectedPet == index
                                                    ? AppColors.white
                                                    : AppColors.mainColor,
                                              ),
                                              Expanded(
                                                child: SizedBox(
                                                  width: 115.w,
                                                  child: Text(
                                                    petListItems.address,
                                                    style: h5.copyWith(
                                                      fontSize: 12,
                                                      color: selectedPet == index
                                                          ? AppColors.white
                                                          : AppColors.black,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
            },
          ),
          Positioned(
            bottom: 32,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: GetBuilder<MessageController>(builder: (controller) {
                return controller.isLoading? const CustomLoader() : CustomButton(
                  onTap: () {
                    if (selectedPet == -1) {
                      Utils.toastMessage(
                          message: "A pet must be selected before sending a message".tr);
                    } else {
                      controller.createOrGetMessageRepo(isNewMsg: true, chatId: "");
                    }
                  },
                  title: "New Message".tr,
                  width: Get.width,
                  color: AppColors.mainColor,
                  titleColor: AppColors.white,
                );
              },),
            ),
          ),
        ],
      ),
    );
  }
}
