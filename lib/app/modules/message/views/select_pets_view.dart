import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/custom_button.dart';
import 'package:felpus/app/common/widgets/my_pets_grid.dart';
import 'package:felpus/app/modules/message/views/message_view.dart';
import 'package:felpus/app/modules/pet_details/views/pet_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_text_style/styles.dart';

class SelectPetsView extends StatefulWidget {
  const SelectPetsView({super.key});

  @override
  State<SelectPetsView> createState() => _SelectPetsViewState();
}

class _SelectPetsViewState extends State<SelectPetsView> {

  var selectedPet = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('Select Pets', style: h2.copyWith(fontSize: 26, color: AppColors.black),),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: [
          Image.asset(AppImages.emergencyPet),
          Container(
            width: Get.width,
            height: Get.height,
            color: AppColors.white.withOpacity(0.7),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: 8,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 18.0,
                    mainAxisExtent: 220
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPet = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          height: 190.h,
                          width: 158.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: selectedPet == index ? [AppColors.mainColor, AppColors.mainColor] : [AppColors.gradient2, AppColors.gradient1],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    AppImages.catImage,
                                    scale: 4,
                                  ),
                                ),
                                Text(
                                  "Oliver",
                                  style: h2.copyWith(fontWeight: FontWeight.w700, color: selectedPet == index ? AppColors.white : AppColors.black),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Female,",
                                      style: h4.copyWith(fontSize: 13, color: selectedPet == index ? AppColors.white : AppColors.black),
                                    ),
                                    Text(
                                      "1.5 Years.",
                                      style: h4.copyWith(fontSize: 13, color: selectedPet == index ? AppColors.white : AppColors.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.location_solid,
                                      color: selectedPet == index ? AppColors.white : AppColors.mainColor,
                                    ),
                                    SizedBox(
                                        width: 115.w,
                                        child: Text(
                                          "Puerta del Sol, 28013 Madrid, Spain.",
                                          style: h5.copyWith(fontSize: 12, color: selectedPet == index ? AppColors.white : AppColors.black),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
                }
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: CustomButton(onTap: () => Get.to(() => MessageView()),title: "New Message", width: Get.width, color: AppColors.white,titleColor: AppColors.black,),
            ),
          ),
        ],
      ),
    );
  }
}
