
import 'package:felpus/views/components/lost_pets_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/pet_model.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../notifications/notifications_view.dart';
import '../pet_details/pet_details_view.dart';

class AllAdoptionPetsView extends GetView {
  const AllAdoptionPetsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text('Pets For Adoption',style: h2.copyWith(fontSize: 22,color: AppColors.mainColor),),
        centerTitle: true,
        actions: [
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
      body: Padding(
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
                      shrinkWrap: true,
                      itemCount: 12,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: (){
                              Get.to(() => PetDetailsView());
                            },
                            child: petsList(pet: PetModel.fromJson({})));
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
