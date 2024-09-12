
import 'package:felpus/controllers/home_controller.dart';
import 'package:felpus/controllers/pet_details_controller.dart';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/my_pets_grid.dart';
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../pet_details/pet_details_view.dart';


class MyPetsView extends GetView {
  const MyPetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'My Pets'.tr,
          style: h2.copyWith(fontSize: 22, color: AppColors.mainColor),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.grayLight.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.grayLight.withOpacity(0.1),
                width: 2,
              ),
            ),
            child: ClipOval(
              child: CustomImage(imageSrc: PrefsHelper.userImageUrl, imageType: ImageType.network,),
            ),
          ),
          sw10,
        ],
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        return  controller.myPetList.isEmpty
            ? const NoData()
            : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: controller.myPetList.length,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 18.0,
              mainAxisExtent: 220,
            ),
            itemBuilder: (context, index) {
              PetModel item = controller.myPetList[index];
              return GestureDetector(
                onTap: () {
                  PetDetailsController.instance
                      .getPetDetailsRepo(petId: item.id);
                  Get.to(() =>
                  const PetDetailsView());
                },
                child: myPetsWidget(pet: item),
              );
            },
          ),
        );
      },),
    );
  }
}
