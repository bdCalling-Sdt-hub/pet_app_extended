import 'package:felpus/views/components/lost_pets_list_view.dart';
import 'package:felpus/views/components/my_pets_grid.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../emergency/emergency_view.dart';
import '../lost_pets/all_found_pets_view.dart';
import '../../../controllers/home_controller.dart';
import '../lost_pets/all_lost_pets_view.dart';
import '../message/chat_list_view.dart';
import '../notifications/notifications_view.dart';
import '../pet_details/pet_details_view.dart';
import 'my_pets_view.dart';

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
              child: Image.asset(
                AppImages.chat,
                scale: 3,
                color: AppColors.ash,
              ),
            ),
            sw15,
            GestureDetector(
              onTap: () => Get.to(
                () => const NotificationsView(),
              ),
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
        body: GetBuilder<HomeController>(
          builder: (controller) => SingleChildScrollView(
            child: controller.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            AppImages.homeBanner,
                            scale: 1,
                          ),
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
                                          image: AssetImage(
                                              AppImages.emergencyTab)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 48.0),
                                      child: Text(
                                        "Emergency!",
                                        style: h2.copyWith(
                                            fontSize: 32,
                                            color: AppColors.white),
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
                                  style: h2.copyWith(
                                      fontSize: 18, color: AppColors.ash),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
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

                            ///<<<================ My Pets ==========================>>>

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "My Pets",
                                  style: h2.copyWith(
                                      fontSize: 20, color: AppColors.mainColor),
                                ),
                                InkWell(
                                  onTap: () => Get.to(() => const MyPetsView()),
                                  child: Text(
                                    "See all",
                                    style: h2.copyWith(
                                        fontSize: 18, color: AppColors.ash),
                                  ),
                                ),
                              ],
                            ),
                            sh10,
                            controller.myPetList.isEmpty
                                ? const NoData()
                                : SizedBox(
                                    height: 190.h,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: controller.myPetList.length,
                                        itemBuilder: (context, index) {
                                          PetModel item = controller.myPetList[index];
                                          return GestureDetector(
                                              onTap: () {
                                                Get.to(() =>
                                                    const PetDetailsView());
                                              },
                                              child: myPetsWidget(pet: item));
                                        }),
                                  ),
                            sh10,

                            ///<<<==================== Lost Pets ====================>>>

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lost Pets",
                                  style: h2.copyWith(
                                      fontSize: 20, color: AppColors.mainColor),
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      Get.to(() => const AllLostPetsView()),
                                  child: Text(
                                    "See all",
                                    style: h2.copyWith(
                                        fontSize: 18, color: AppColors.ash),
                                  ),
                                ),
                              ],
                            ),
                            sh10,

                            controller.lostPetList.isEmpty
                                ? const NoData()
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.lostPetList.length,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      PetModel item =
                                          controller.lostPetList[index];
                                      return GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                () => const PetDetailsView());
                                          },
                                          child: petsList(pet: item));
                                    }),
                            sh10,

                            ///<<<<================= Found Pets ====================>>>>
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Found Pets",
                                  style: h2.copyWith(
                                      fontSize: 20, color: AppColors.mainColor),
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      Get.to(() => const AllFoundPetsView()),
                                  child: Text(
                                    "See all",
                                    style: h2.copyWith(
                                        fontSize: 18, color: AppColors.ash),
                                  ),
                                ),
                              ],
                            ),
                            sh10,

                            controller.foundPetList.isEmpty
                                ? const Center(child: NoData())
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: controller.foundPetList.length,
                                    itemBuilder: (context, index) {
                                      PetModel item =
                                          controller.lostPetList[index];
                                      return GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                () => const PetDetailsView());
                                          },
                                          child: petsList(pet: item));
                                    }),
                          ],
                        ),
                      )
                    ],
                  ),
          ),
        ));
  }
}
