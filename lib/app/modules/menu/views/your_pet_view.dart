import 'package:felpus/app/common/Extension/extension.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/custom_button.dart';
import 'package:felpus/app/common/widgets/my_pets_grid.dart';
import 'package:felpus/app/modules/pet_details/views/pet_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_text_style/styles.dart';

class YourPetView extends StatefulWidget {
  const YourPetView({super.key});

  @override
  State<YourPetView> createState() => _YourPetViewState();
}

class _YourPetViewState extends State<YourPetView> {

  var selectedPet = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text('Your Pet Cards', style: h2.copyWith(fontSize: 22, color: AppColors.mainColor),),
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
                            color: AppColors.olive
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
            child: Column(
              children: [
                petCardButton(onTap: () {},tittle: "Update Your Pet Card", width: Get.width, buttonColor: AppColors.light, titleColor: AppColors.black, height: 60, icon: AppImages.refreshIcon,),
                10.height,
                petCardButton(onTap: () {},tittle: "Delete Your Pet Card", width: Get.width, buttonColor: AppColors.light, titleColor: AppColors.black, height: 60, icon: AppImages.deleteIcon,),
                20.height,
              ],
            ),
          ),
        ],
      ),
    /*  bottomNavigationBar: Column(
        children: [
          CustomButton(title: "Update Your Pet Card", width: Get.width, color: AppColors.light, titleColor: AppColors.black,),
          sh5,
          CustomButton(title: "Delete Your Pet Card", width: Get.width, color: AppColors.light, titleColor: AppColors.black,),
          sh20,
        ],
      ),*/
    );
  }

  GestureDetector petCardButton({required VoidCallback onTap,required String tittle, required double height, required double width, required Color titleColor, required Color buttonColor, required String icon}) {
    return GestureDetector(
                onTap: onTap,
                child: Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 20,),
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.3), // Shadow color
                          spreadRadius: 0, // Spread radius
                          blurRadius: 5, // Blur radius
                          offset: Offset(1, 2), // Offset in x and y
                        ),
                      ],
                    ),
                    child: Row(

                      children: [
                        30.width,
                        Image.asset(icon, height: 24, width: 24,),
                        30.width,
                        Center(child: Text(tittle,style: h2.copyWith(color: titleColor),),),
                      ],
                    ),
                  ),
                ),
              );
  }

}
