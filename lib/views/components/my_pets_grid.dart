
import 'package:felpus/models/pet_model.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_color/app_colors.dart';
import '../../utils/app_text_style/styles.dart';

Padding myPetsWidget({required PetModel pet}) {

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Container(
      height: 190.h,
      width: 158.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.olive
        // gradient: const LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [AppColors.gradient2, AppColors.gradient1],
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CustomImage(imageSrc: pet.photo, imageType: ImageType.network, height: 110.h, width: 158.w,),
              ),
            ),
            Text(
              pet.breed,
              style: h2.copyWith(fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text(
                  pet.sex,
                  style: h4.copyWith(fontSize: 13),
                ),
                Text(
                  " ${pet.age} ${"Years".tr}.",
                  style: h4.copyWith(fontSize: 13),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  CupertinoIcons.location_solid,
                  color: AppColors.mainColor,
                ),
                SizedBox(
                    width: 110.w,
                    child: Text(
                      pet.address,
                      style: h5.copyWith(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}