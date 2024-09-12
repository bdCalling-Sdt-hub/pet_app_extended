import 'package:felpus/controllers/adoption_controller.dart';
import 'package:felpus/controllers/pet_details_controller.dart';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/lost_pets_list_view.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../notifications/notifications_view.dart';
import '../pet_details/pet_details_view.dart';

class AllAdoptionPetsView extends GetView {
  final AdoptionController adoptionController = Get.put(AdoptionController());
  final ScrollController scrollController = ScrollController();

  AllAdoptionPetsView({super.key}) {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (adoptionController.pagination != null &&
            adoptionController.pagination!.currentPage <
                adoptionController.pagination!.totalPages &&
            !adoptionController.isMoreLoading) {
          adoptionController.getAdoptPetRepo(
              page: adoptionController.pagination!.currentPage + 1);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Pets For Adoption'.tr,
          style: h2.copyWith(fontSize: 22, color: AppColors.mainColor),
        ),
        centerTitle: true,
        actions: [
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
              child: CustomImage(imageSrc: PrefsHelper.userImageUrl, imageType: ImageType.network,),
            ),
          ),
          sw10,
        ],
      ),
      body: GetBuilder<AdoptionController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : controller.adoptPetList.isEmpty
                  ? const NoData()
                  : Padding(
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
                                    controller: scrollController,
                                    shrinkWrap: true,
                                    itemCount: 12,
                                    itemBuilder: (context, index) {
                                      if (index <
                                          controller.adoptPetList.length) {
                                        return GestureDetector(
                                          onTap: () {
                                            PetDetailsController.instance
                                                .getPetDetailsRepo(
                                              petId: controller
                                                  .adoptPetList[index].id,
                                            );
                                            Get.to(
                                                () => const PetDetailsView());
                                          },
                                          child: petsList(
                                              pet: controller
                                                  .adoptPetList[index]),
                                        );
                                      } else {
                                        return controller.isMoreLoading
                                            ? const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 20),
                                                child: Center(
                                                    child: CustomLoader()),
                                              )
                                            : const SizedBox.shrink();
                                      }
                                    }),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
        },
      ),
    );
  }
}
