
import 'package:felpus/controllers/my_pet_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_textfelid.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_text_style/styles.dart';
import '../../../../utils/size_box/custom_sizebox.dart';


class ReportFoundPetView extends StatefulWidget {
  const ReportFoundPetView({super.key});

  @override
  State<ReportFoundPetView> createState() => _ReportFoundPetViewState();
}

class _ReportFoundPetViewState extends State<ReportFoundPetView> {

  var selectedPet = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Report Found Pet',
            style: h2.copyWith(fontSize: 20, color: AppColors.mainColor),
          ),
          centerTitle: true,
          leading: InkWell(
              onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
        ),
        body: GetBuilder<MyPetController>(builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : controller.myPetList.isEmpty
              ? const NoData()
              : Padding(
            padding: const EdgeInsets.symmetric(horizontal:14.0),
            child: Column(
              children: [
                15.height,
                Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.myPetList.length,
                      itemBuilder: (context, index) {
                        var petListItems = controller.myPetList[index];
                        return GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedPet = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Container(
                                height: 80.h,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient:  LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: selectedPet == index? [AppColors.mainColor, AppColors.mainColor] :  [AppColors.olive, AppColors.olive],
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            petListItems.petName,
                                            style: h2.copyWith(fontWeight: FontWeight.w700,color: selectedPet == index? AppColors.white : AppColors.black),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                "${petListItems.sex},",
                                                style: h4.copyWith(fontSize: 13,color: selectedPet == index? AppColors.white : AppColors.black),
                                              ),
                                              Text(
                                                "${petListItems.age} Years.",
                                                style: h4.copyWith(fontSize: 13,color: selectedPet == index? AppColors.white : AppColors.black),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            CupertinoIcons.location_solid,
                                            color:  selectedPet == index? AppColors.white : AppColors.mainColor,
                                          ),
                                          SizedBox(
                                              width: 70.w,
                                              child: Text(
                                                petListItems.address,
                                                style: h5.copyWith(fontSize: 12,color: selectedPet == index? AppColors.white : AppColors.black),
                                                maxLines: 4,
                                                overflow: TextOverflow.ellipsis,
                                              )),
                                        ],
                                      ),
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: CustomImage(imageSrc: petListItems.photo, imageType: ImageType.network, height: 80.h, width: 120.w,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                      }),
                ),
                Row(children: [
                  CustomButton(
                    onTap: () {
                      Get.back();
                    },
                    title: "Cancel", width: Get.width / 2.8, color: AppColors.light,titleColor: AppColors.black,),
                  CustomButton(
                    onTap: () {
                      Get.back();
                    },
                    title: "Got The Owner", width: Get.width / 2.8, color: AppColors.mainColor,),
                ],),
                36.height,
              ],
            ),
          );
        },)
    );
  }
}
