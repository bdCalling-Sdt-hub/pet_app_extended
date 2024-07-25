import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Padding myPetsWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Container(
      height: 190.h,
      width: 158.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.gradient2, AppColors.gradient1],
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
              style: h2.copyWith(fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Text(
                  "Female,",
                  style: h4.copyWith(fontSize: 13),
                ),
                Text(
                  "1.5 Years.",
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
                    width: 115.w,
                    child: Text(
                      "Puerta del Sol, 28013 Madrid, Spain.",
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