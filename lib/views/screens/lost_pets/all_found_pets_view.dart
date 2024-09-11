import 'package:felpus/controllers/found_pets_controller.dart';
import 'package:felpus/controllers/pet_details_controller.dart';
import 'package:felpus/services/ads_service.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/lost_pets_list_view.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../pet_details/pet_details_view.dart';

class AllFoundPetsView extends GetView {
  final FoundPetsController foundPetsController =
      Get.put(FoundPetsController());
  final ScrollController scrollController = ScrollController();

  AllFoundPetsView({super.key}) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (foundPetsController.pagination != null &&
            foundPetsController.pagination!.currentPage <
                foundPetsController.pagination!.totalPages &&
            !foundPetsController.isMoreLoading) {
          foundPetsController.getFoundPetRepo(
              page: foundPetsController.pagination!.currentPage + 1);
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
          'Found Pets'.tr,
          style: h2.copyWith(fontSize: 22, color: AppColors.mainColor),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<FoundPetsController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : controller.foundPetList.isEmpty
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
                              itemCount: controller.foundPetList.length + 1,
                              itemBuilder: (context, index) {
                                if (index < controller.foundPetList.length) {
                                  return GestureDetector(
                                    onTap: () {
                                      PetDetailsController.instance
                                          .getPetDetailsRepo(
                                        petId:
                                            controller.foundPetList[index].id,
                                      );
                                      Get.to(() => const PetDetailsView());
                                    },
                                    child: petsList(
                                        pet: controller.foundPetList[index]),
                                  );
                                } else {
                                  return controller.isMoreLoading
                                      ? const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Center(child: CustomLoader()),
                                        )
                                      : const SizedBox.shrink();
                                }
                              }),
                        ),
                      ],
                    );
        },
      ),
      bottomNavigationBar:  Obx(() {
        return AdsServices.isBannerAdFourthReady.value?
        Container(
          alignment: Alignment.center,
          width: AdsServices.bannerAdFourth.size.width.toDouble(),
          height: AdsServices.bannerAdFourth.size.height.toDouble(),
          child: AdWidget(ad: AdsServices.bannerAdFourth),
        ) : const SizedBox();
      },),
    );
  }
}
