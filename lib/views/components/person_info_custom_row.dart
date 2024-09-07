
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/utils/app_text_style/styles.dart';
import 'package:felpus/utils/size_box/custom_sizebox.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Padding personInfoCustomRow({required String iconPath, double imageScale = 4,required String title, required String titleInfo}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              scale: imageScale,
            ),
            sw5,
            Text(
              title,
              style: h2,
            ),
            8.width,
            Text(
              ":",
              style: h2,
            ),
          ],
        ),
        Expanded(
          child: CustomText(
            textAlign: TextAlign.end,
            text: titleInfo,
            maxLines: 5,
            fontWeight: FontWeight.w600,
          ),
        )
        // Text(
        //   titleInfo,
        //   style: h3,
        // )
      ],
    ),
  );
}