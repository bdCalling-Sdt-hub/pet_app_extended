import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/lost_pets_list_view.dart';
import 'package:felpus/app/common/widgets/my_pets_grid.dart';
import 'package:felpus/app/modules/emergency/views/emergency_view.dart';
import 'package:felpus/app/modules/home/views/my_pets_view.dart';
import 'package:felpus/app/modules/lost_pets/views/all_lost_pets_view.dart';
import 'package:felpus/app/modules/lost_pets/views/lost_pets_view.dart';
import 'package:felpus/app/modules/message/views/chat_list_view.dart';
import 'package:felpus/app/modules/notifications/views/notifications_view.dart';
import 'package:felpus/app/modules/pet_details/views/pet_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  List categoryList = ["Family", "Neighbor", "Friends"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          actions: [
            InkWell(
              onTap: () {
                Get.to(() => ChatListView());
              },
                child: Image.asset(AppImages.chat, scale: 3, color: AppColors.ash,),
            ),
            sw15,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(AppImages.homeBanner, scale: 1,),
                  Positioned(
                      right: 36,
                      left: 36,
                      top: 40,
                      bottom: 40,
                      child: GestureDetector(
                        onTap: () => Get.to(() => EmergencyView()),
                        child: Container(
                          height: 155,
                          width: 320,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.fill,
                                  image: AssetImage(AppImages.emergencyTab)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 48.0),
                              child: Text(
                                "Emergency!",
                                style: h2.copyWith(
                                    fontSize: 32, color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              sh5,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Groups",
                          style: h2.copyWith(
                              fontSize: 20, color: AppColors.mainColor),
                        ),
                        Text(
                          "See all",
                          style:
                              h2.copyWith(fontSize: 18, color: AppColors.ash),
                        ),
                      ],
                    ),
                    sh10,
                    SizedBox(
                      height: 45,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: AppColors.lowGray),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10),
                                  child: Center(
                                    child: Text(
                                      categoryList[index],
                                      style: h2.copyWith(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    sh10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Pets",
                          style: h2.copyWith(
                              fontSize: 20, color: AppColors.mainColor),
                        ),
                        InkWell(
                          onTap: () => Get.to(() => MyPetsView()),
                          child: Text(
                            "See all",
                            style:
                                h2.copyWith(fontSize: 18, color: AppColors.ash),
                          ),
                        ),
                      ],
                    ),
                    sh10,
                    SizedBox(
                      height: 190.h,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onTap: (){
                                  Get.to(() => PetDetailsView());
                                },
                                child: myPetsWidget());
                          }),
                    ),
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
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 12,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: (){
                                Get.to(() => PetDetailsView());
                              },
                              child: lostPetsList());
                        })
                  ],
                ),
              )
            ],
          ),
        ));
  }




}
