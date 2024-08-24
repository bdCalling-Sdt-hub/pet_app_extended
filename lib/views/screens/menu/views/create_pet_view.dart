
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_text_style/styles.dart';
import '../../../../utils/size_box/custom_sizebox.dart';
import '../../adoption/create_adoption_view.dart';
import 'create_found_pet_view.dart';
import 'create_lost_pet_view.dart';


class CreatePetView extends GetView {
  const CreatePetView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('Create Pet Card', style: h2.copyWith(fontSize: 22, color: AppColors.mainColor),),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
              width: Get.width,
              child: Image.asset(AppImages.backgroundImage, fit: BoxFit.fill,)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: Container(
                    height: 200,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.olive
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Did you lose your pet?",style: h4.copyWith(fontWeight: FontWeight.bold,fontSize: 16),),
                          sh5,
                          Text("Tap the 'Lost Pets' button, fill in your pet's description and any identifying features, then submit to alert the community.",style: h4.copyWith(fontSize: 14),textAlign: TextAlign.center,),
                          sh5,
                          GestureDetector(
                            onTap: () => Get.to(() => const CreateLostPetView()),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppImages.lagPrint,scale: 4,),
                                  sw5,
                                  Text("Lost Pet",style: h3.copyWith(fontSize: 16),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: Container(
                    height: 200,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        color: AppColors.olive
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Did you find a lost pet?",style: h4.copyWith(fontWeight: FontWeight.bold,fontSize: 16),),
                          sh5,
                          Text("Tap 'Found Pet' button, provide details about the pet and where it was found. Submit to alert the community and help reunite the pet.",style: h4.copyWith(fontSize: 14),textAlign: TextAlign.center,),
                          sh5,
                          GestureDetector(
                            onTap: () => Get.to(() => const CreateFoundPetView()),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppImages.handCat,scale: 4,),
                                  sw5,
                                  Text("Found Pet",style: h3.copyWith(fontSize: 16),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7.0),
                  child: Container(
                    height: 200,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                        color: AppColors.olive
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Want to give a pet up for adoption?",style: h4.copyWith(fontWeight: FontWeight.bold,fontSize: 16),),
                          sh5,
                          Text("Tap the 'For Adoption' button to start. Provide the pet's details like breed, age, and temperament. Connect with caring individuals ready to offer your pet a new loving home.",style: h4.copyWith(fontSize: 14),textAlign: TextAlign.center,),
                          sh5,
                          GestureDetector(
                            onTap: () => Get.to(() => const CreateAdoptionView()),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 3,
                                    offset: const Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(AppImages.veterinary,scale: 4,),
                                  sw5,
                                  Text("For Adoption",style: h3.copyWith(fontSize: 16),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
