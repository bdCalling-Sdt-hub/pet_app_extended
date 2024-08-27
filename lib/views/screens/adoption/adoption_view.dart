import 'package:dotted_border/dotted_border.dart';
import 'package:felpus/controllers/pet_details_controller.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/lost_pets_list_view.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/pet_model.dart';
import '../../../controllers/adoption_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../notifications/notifications_view.dart';
import '../pet_details/pet_details_view.dart';
import 'all_adoption_pets_view.dart';
import 'create_adoption_view.dart';

class AdoptionView extends GetView<AdoptionController> {
  const AdoptionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title:  Text('Adoption',style: h2.copyWith(fontSize: 22,color: AppColors.mainColor),),
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
      body: GetBuilder<AdoptionController>(builder: (controller) {
        return controller.isLoading? const CustomLoader() : controller.adoptPetList.isEmpty? const NoData() : Stack(

          children: [
            Image.asset(AppImages.backgroundImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                children: [
                  sh10,
                  DottedBorder(
                    color: AppColors.black,
                    strokeWidth: 1,
                    dashPattern: const [6, 6],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    child: GestureDetector(
                      onTap: () => Get.to(() => CreateAdoptionView(),),
                      child: Container(
                        height: 110,
                        width: Get.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // border: Border.all(color: AppColors.black,style: BorderStyle.solid)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.favorite,scale: 2,color: AppColors.black,),
                            Text("Add a pet for\n adoption",style: h3,textAlign: TextAlign.center,)

                          ],
                        ),
                      ),
                    ),
                  ),
                  sh10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pets For Adoption",
                        style: h2.copyWith(
                            fontSize: 20, color: AppColors.mainColor),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(() => AllAdoptionPetsView()),
                        child: Text(
                          "See all",
                          style:
                          h2.copyWith(fontSize: 18, color: AppColors.ash),
                        ),
                      ),
                    ],
                  ),
                  sh10,
                  Expanded(
                    flex: 1,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.adoptPetList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: (){
                                PetDetailsController.instance.getPetDetailsRepo(
                                  petId: controller.adoptPetList[index].id,
                                );
                                Get.to(() => const PetDetailsView());
                              },
                              child: petsList(pet: controller.adoptPetList[index]));
                        }),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Image.asset(AppImages.ads, scale: 4,))
          ],
        );
      },),
    );
  }
}
