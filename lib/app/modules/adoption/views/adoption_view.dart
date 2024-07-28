import 'package:dotted_border/dotted_border.dart';
import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/lost_pets_list_view.dart';
import 'package:felpus/app/modules/adoption/views/all_adoption_pets_view.dart';
import 'package:felpus/app/modules/adoption/views/create_adoption_view.dart';
import 'package:felpus/app/modules/lost_pets/views/all_found_pets_view.dart';
import 'package:felpus/app/modules/lost_pets/views/all_lost_pets_view.dart';
import 'package:felpus/app/modules/notifications/views/notifications_view.dart';
import 'package:felpus/app/modules/pet_details/views/pet_details_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/adoption_controller.dart';

class AdoptionView extends GetView<AdoptionController> {
  const AdoptionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text('Adoption',style: h2.copyWith(fontSize: 22,color: AppColors.mainColor),),
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
      body: Stack(

        children: [
          Image.asset(AppImages.backgroundImage),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                sh10,
                DottedBorder(
                  color: AppColors.black,
                  strokeWidth: 1,
                  dashPattern: const [6, 6],
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  child: GestureDetector(
                    onTap: () => Get.to(() => CreateAdoptionView(),),
                    child: Container(
                      height: 110,
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                       // border: Border.all(color: AppColors.black,style: BorderStyle.solid)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.favorite,scale: 2,color: AppColors.black,),
                          Text("Add a pet for\n adoption",style: h3,textAlign: TextAlign.center,)

                        ],
                      ),
                    ),
                  ),
                ),
                sh10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pets For Adoption",
                      style: h2.copyWith(
                          fontSize: 20, color: AppColors.mainColor),
                    ),
                    GestureDetector(
                      onTap: () => Get.to(() => AllAdoptionPetsView()),
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
                            child: petsList());
                      }),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(AppImages.ads, scale: 4,))
        ],
      ),
    );
  }
}
