import 'package:felpus/app/common/Extension/extension.dart';
import 'package:felpus/app/common/widgets/custom_button.dart';
import 'package:felpus/app/common/widgets/custom_textfelid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_images/app_images.dart';
import '../../../common/app_text_style/styles.dart';
import '../../../common/size_box/custom_sizebox.dart';
import '../../../common/widgets/lost_pets_list_view.dart';
import '../../pet_details/views/pet_details_view.dart';

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:14.0),
          child: Column(
            children: [
              15.height,
              Expanded(
                flex: 4,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 12,
                    itemBuilder: (context, index) {
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
                                          "Oliver",
                                          style: h2.copyWith(fontWeight: FontWeight.w700,color: selectedPet == index? AppColors.white : AppColors.black),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Female,",
                                              style: h4.copyWith(fontSize: 13,color: selectedPet == index? AppColors.white : AppColors.black),
                                            ),
                                            Text(
                                              "1.5 Years.",
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
                                              "Puerta del Sol, 28013 Madrid, Spain.",
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
                                      child: Image.asset(
                                        AppImages.catImage,
                                        scale: 4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ));
                    }),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: AppColors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomTextField(title: "Description", width: Get.width, horizontalPadding: 0,hintText: "Write a short description about your report.",maxLines: 2,),
                        sh5,
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
                        ],)
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}
