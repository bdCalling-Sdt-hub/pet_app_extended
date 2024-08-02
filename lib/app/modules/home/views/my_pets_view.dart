import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/my_pets_grid.dart';
import 'package:felpus/app/model/pet_model.dart';
import 'package:felpus/app/modules/pet_details/views/pet_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_images/app_images.dart';
import '../../../common/app_text_style/styles.dart';

class MyPetsView extends GetView {
  const MyPetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'My Pets',
          style: h2.copyWith(fontSize: 22, color: AppColors.mainColor),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.grayLight.withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.grayLight.withOpacity(0.1),
                width: 2,
              ),
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 8,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 18.0,
            mainAxisExtent: 220,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => PetDetailsView());
              },
              child: myPetsWidget(pet: PetModel.fromJson({})),
            );
          },
        ),
      ),
    );
  }
}
