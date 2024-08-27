
import 'package:felpus/controllers/home_controller.dart';
import 'package:felpus/controllers/pet_details_controller.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/lost_pets_list_view.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/lost_pets_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../notifications/notifications_view.dart';
import '../pet_details/pet_details_view.dart';
import 'all_found_pets_view.dart';
import 'all_lost_pets_view.dart';

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
            onTap: () => Get.to(() => const NotificationsView(),),
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
      body: GetBuilder<HomeController>(builder: (controller) {
        return controller.isLoading? const CustomLoader() : Stack(

          children: [
            Image.asset(AppImages.backgroundImage, fit: BoxFit.fill, height: Get.height, width: Get.width,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
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
                        onTap: () {
                          Get.to(() => AllLostPetsView());
                        },
                        child: Text(
                          "See all",
                          style: h2.copyWith(
                              fontSize: 18, color: AppColors.ash),
                        ),
                      ),
                    ],
                  ),
                  sh10,

                  ///<<<<================= Lost Pets ====================>>>>
                  controller.lostPetList.isEmpty
                      ? const NoData()
                      : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.lostPetList.length,
                        itemBuilder: (context, index) {
                          PetModel item =
                          controller.lostPetList[index];
                          return GestureDetector(
                              onTap: () {
                                PetDetailsController.instance.getPetDetailsRepo(petId: item.id);
                                Get.to(() => const PetDetailsView());
                              },
                              child: petsList(pet: item));
                        }),
                  ),
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
                        onTap: () => Get.to(() => AllFoundPetsView()),
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
                      : Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.foundPetList.length,
                        itemBuilder: (context, index) {
                          PetModel item =
                          controller.foundPetList[index];
                          return GestureDetector(
                              onTap: () {
                                PetDetailsController.instance.getPetDetailsRepo(petId: item.id);
                                Get.to(() => const PetDetailsView());
                              },
                              child: petsList(pet: item));
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
        );
      },),
    );
  }
}
