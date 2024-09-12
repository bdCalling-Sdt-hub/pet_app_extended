import 'package:felpus/extensions/extension.dart';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_text_style/styles.dart';
import '../../../../utils/size_box/custom_sizebox.dart';
import '../../adoption/create_adoption_view.dart';
import 'create_my_or_found_pet_view.dart';
import 'create_update_lost_pet_view.dart';


class CreatePetView extends GetView {
  const CreatePetView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text('Create Pet Card'.tr, style: h2.copyWith(fontSize: 22, color: AppColors.mainColor),),
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
            SingleChildScrollView(
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
                            Text("Do you have any pet?".tr,style: h4.copyWith(fontWeight: FontWeight.bold,fontSize: 16),),
                            sh5,
                            Text("Tap the 'My Pet' button, fill in your pet's description and any identifying features, then submit to alert the community.".tr,style: h4.copyWith(fontSize: 14),textAlign: TextAlign.center,),
                            sh5,
                            GestureDetector(
                              onTap: () {
                                CreateMyOrFoundPetView.isMyPet = true;
                                Get.to(() => CreateMyOrFoundPetView());
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                height: 50,
                                width: PrefsHelper.localizationCountryCode == "US"? 150 : 210,
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
                                    Image.asset(AppImages.addMyPet, height: 32, width: 32,),
                                    8.width,
                                    Expanded(child: Text("My Pet".tr,style: h3.copyWith(fontSize: 16),))
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
                            Text("Did you lose your pet?".tr,style: h4.copyWith(fontWeight: FontWeight.bold,fontSize: 16),),
                            sh5,
                            Text("Tap the 'Lost Pets' button, fill in your pet's description and any identifying features, then submit to alert the community.".tr,style: h4.copyWith(fontSize: 14),textAlign: TextAlign.center,),
                            sh5,
                            GestureDetector(
                              onTap: () => Get.to(() => const CreateLostPetView()),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                height: 50,
                                width: PrefsHelper.localizationCountryCode == "US"? 150 : 210,
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
                                    8.width,
                                    Expanded(child: Text("Lost Pet".tr,style: h3.copyWith(fontSize: 16),))
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
                            Text("Did you find a lost pet?".tr,style: h4.copyWith(fontWeight: FontWeight.bold,fontSize: 16),),
                            sh5,
                            Text("Tap 'Found Pet' button, provide details about the pet and where it was found. Submit to alert the community and help reunite the pet.".tr,style: h4.copyWith(fontSize: 14),textAlign: TextAlign.center,),
                            sh5,
                            GestureDetector(
                              onTap: () => Get.to(() => CreateMyOrFoundPetView()),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                height: 50,
                                width: PrefsHelper.localizationCountryCode == "US"? 150 : 210,
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
                                    8.width,
                                    Expanded(child: Text("Found Pet".tr,style: h3.copyWith(fontSize: 16),))
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
                            Text("Want to give a pet up for adoption?".tr,style: h4.copyWith(fontWeight: FontWeight.bold,fontSize: 16),),
                            sh5,
                            Text("Tap the 'For Adoption' button to start. Provide the pet's details like breed, age, and temperament. Connect with caring individuals ready to offer your pet a new loving home.".tr,style: h4.copyWith(fontSize: 14),textAlign: TextAlign.center,),
                            sh5,
                            GestureDetector(
                              onTap: () => Get.to(() => const CreateAdoptionView()),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                height: 50,
                                width: PrefsHelper.localizationCountryCode == "US"? 160 : 210,
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
                                    8.width,
                                    Expanded(child: Text("For Adoption".tr,style: h3.copyWith(fontSize: 16),))
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
