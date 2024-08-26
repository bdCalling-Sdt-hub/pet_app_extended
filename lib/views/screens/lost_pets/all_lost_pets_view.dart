import 'package:felpus/controllers/home_controller.dart';
import 'package:felpus/controllers/pet_details_controller.dart';
import 'package:felpus/views/components/lost_pets_list_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/pet_model.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../pet_details/pet_details_view.dart';

class AllLostPetsView extends GetView {
  HomeController homeController = Get.put(HomeController());

  final ScrollController scrollController = ScrollController();
  AllLostPetsView({super.key})
  {
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        if (homeController.pagination != null &&
            homeController.pagination!.page < homeController.pagination!.totalPage) {
          homeController.getLostPetRepo(page: homeController.pagination!.page + 1);
        }
      }
    });
  }

  static List<PetModel> petList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Lost Pets',
          style: h2.copyWith(fontSize: 22, color: AppColors.mainColor),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              petList.clear();
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return Stack(
            children: [
              Image.asset(AppImages.dogCat),
              Container(
                width: Get.width,
                height: Get.height,
                color: AppColors.white.withOpacity(0.7),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: petList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            PetDetailsController.instance.getPetDetailsRepo(petId: petList[index].id);
                            Get.to(() => const PetDetailsView());
                          },
                          child: petsList(pet: petList[index]));
                    }),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Image.asset(
        AppImages.ads,
        scale: 4,
      ),
    );
  }
}
