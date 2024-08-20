import 'package:felpus/views/components/lost_pets_list_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../models/pet_model.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../pet_details/pet_details_view.dart';

class AllFoundPetsView extends GetView {
  const AllFoundPetsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text('Found Pets',style: h2.copyWith(fontSize: 22,color: AppColors.mainColor),),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
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
                itemCount: 12,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: (){
                        Get.to(() => const PetDetailsView());
                      },
                      child: petsList(pet: PetModel.fromJson({})));
                }),
          ),
        ],
      ),
      bottomNavigationBar: Image.asset(AppImages.ads, scale: 4,),
    );
  }
}
