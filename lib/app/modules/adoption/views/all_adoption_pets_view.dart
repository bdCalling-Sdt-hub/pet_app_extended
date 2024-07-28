import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/lost_pets_list_view.dart';
import 'package:felpus/app/modules/adoption/views/all_adoption_pets_view.dart';
import 'package:felpus/app/modules/lost_pets/views/all_found_pets_view.dart';
import 'package:felpus/app/modules/lost_pets/views/all_lost_pets_view.dart';
import 'package:felpus/app/modules/notifications/views/notifications_view.dart';
import 'package:felpus/app/modules/pet_details/views/pet_details_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AllAdoptionPetsView extends GetView {
  const AllAdoptionPetsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text('Pets For Adoption',style: h2.copyWith(fontSize: 22,color: AppColors.mainColor),),
        centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Stack(

          children: [
            Image.asset(AppImages.dogCat),
            Container(
              width: Get.width,
              height: Get.height,
              color: AppColors.white.withOpacity(0.7),
            ),
            Column(
              children: [
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
                            child: petsList());
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
