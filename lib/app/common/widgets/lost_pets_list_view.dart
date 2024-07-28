import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Padding petsList() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: Container(
      height: 80.h,
      width: Get.width,
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
                  style: h2.copyWith(fontWeight: FontWeight.w700),
                ),
                Row(
                  children: [
                    Text(
                      "Female,",
                      style: h4.copyWith(fontSize: 13),
                    ),
                    Text(
                      " 1.5 Years.",
                      style: h4.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  CupertinoIcons.location_solid,
                  color: AppColors.mainColor,
                ),
                SizedBox(
                    width: 70.w,
                    child: Text(
                      "Puerta del Sol, 28013 Madrid, Spain.",
                      style: h5.copyWith(fontSize: 12),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
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
  );
}