import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/lost_pets_list_view.dart';
import 'package:felpus/app/model/pet_model.dart';
import 'package:felpus/app/modules/lost_pets/views/all_found_pets_view.dart';
import 'package:felpus/app/modules/lost_pets/views/all_lost_pets_view.dart';
import 'package:felpus/app/modules/notifications/views/notifications_view.dart';
import 'package:felpus/app/modules/pet_details/views/pet_details_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lost_pets_controller.dart';

class LostPetsView extends GetView<LostPetsController> {
  const LostPetsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => NotificationsView(),),
            child: Image.asset(
              AppImages.notification,
              scale: 4,
            ),
          ),
          sw15,
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.grayLight.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(
                  color: AppColors.grayLight.withOpacity(0.1), width: 2),
            ),
            child: ClipOval(
              child: Image.asset(
                AppImages.boy,
                fit: BoxFit.fill,
              ),
            ),
          ),
          sw10,
        ],
      ),
      body: Stack(

        children: [
          Image.asset(AppImages.backgroundImage, fit: BoxFit.fill, height: Get.height, width: Get.width,),
          // Container(
          //   width: Get.width,
          //   height: Get.height,
          //   color: AppColors.white.withOpacity(0.7),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                sh10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lost Pets",
                      style: h2.copyWith(
                          fontSize: 20, color: AppColors.mainColor),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => AllLostPetsView()),
                      child: Text(
                        "See all",
                        style:
                        h2.copyWith(fontSize: 18, color: AppColors.ash),
                      ),
                    ),
                  ],
                ),
                sh10,
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: (){
                              Get.to(() => PetDetailsView());
                            },
                            child: petsList(pet: PetModel.fromJson({})));
                      }),
                ),
                sh10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Found Pets",
                      style: h2.copyWith(
                          fontSize: 20, color: AppColors.mainColor),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => AllFoundPetsView()),
                      child: Text(
                        "See all",
                        style:
                        h2.copyWith(fontSize: 18, color: AppColors.ash),
                      ),
                    ),
                  ],
                ),
                sh10,
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: (){
                              Get.to(() => PetDetailsView());
                            },
                            child: petsList(pet: PetModel.fromJson({})));
                      }),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
              right: 0,
              left: 0,
              child: Image.asset(AppImages.ads, scale: 4,)),
        ],
      ),
    );
  }
}
