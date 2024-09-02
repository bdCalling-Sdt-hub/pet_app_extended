import 'package:felpus/controllers/home_controller.dart';
import 'package:felpus/controllers/lost_pets_controller.dart';
import 'package:felpus/controllers/pet_details_controller.dart';
import 'package:felpus/services/ads_service.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/lost_pets_list_view.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../models/pet_model.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../pet_details/pet_details_view.dart';

class AllLostPetsView extends StatelessWidget {
  final LostPetsController lostPetsController = Get.put(LostPetsController());
  final ScrollController scrollController = ScrollController();

  AllLostPetsView({super.key}) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (lostPetsController.pagination != null &&
            lostPetsController.pagination!.currentPage <
                lostPetsController.pagination!.totalPages &&
            !lostPetsController.isMoreLoading) {
          lostPetsController.getLostPetRepo(
              page: lostPetsController.pagination!.currentPage + 1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Lost Pets'.tr,
          style: h2.copyWith(fontSize: 22, color: AppColors.mainColor),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<LostPetsController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : controller.lostPetList.isEmpty
                  ? const NoData()
                  : Stack(
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
                            controller: scrollController,
                            shrinkWrap: true,
                            itemCount: controller.lostPetList.length + 1,
                            itemBuilder: (context, index) {
                              if (index < controller.lostPetList.length) {
                                return GestureDetector(
                                  onTap: () {
                                    PetDetailsController.instance
                                        .getPetDetailsRepo(
                                      petId: controller.lostPetList[index].id,
                                    );
                                    Get.to(() => const PetDetailsView());
                                  },
                                  child: petsList(
                                      pet: controller.lostPetList[index]),
                                );
                              } else {
                                return controller.isMoreLoading
                                    ? const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Center(child: CustomLoader()),
                                      )
                                    : const SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                      ],
                    );
        },
      ),
      bottomNavigationBar: Obx(() {
        return AdsServices.isBannerAdReady.value
            ? Container(
                alignment: Alignment.center,
                width: AdsServices.bannerAdSecond.size.width.toDouble(),
                height: AdsServices.bannerAdSecond.size.height.toDouble(),
                child: AdWidget(ad: AdsServices.bannerAdSecond),
              )
            : const SizedBox();
      }),
    );
  }
}
