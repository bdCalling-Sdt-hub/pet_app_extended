import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/widgets/lost_pets_list_view.dart';
import 'package:felpus/app/modules/pet_details/views/pet_details_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AllLostPetsView extends GetView {
  const AllLostPetsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text('Lost Pets',style: h2.copyWith(fontSize: 22,color: AppColors.mainColor),),
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
                        Get.to(() => PetDetailsView());
                      },
                      child: petsList());
                }),
          ),
        ],
      ),
      bottomNavigationBar: Image.asset(AppImages.ads, scale: 4,),
    );
  }
}
