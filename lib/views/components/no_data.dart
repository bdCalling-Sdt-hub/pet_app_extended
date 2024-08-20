
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_images/app_images.dart';
import 'custom_image.dart';
import 'custom_text.dart';


class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomImage(
            imageSrc: AppImages.noData,
            imageType: ImageType.png,
          ),
          CustomText(
            text: "No Data".tr,
            fontSize: 16.h,
            top: 8.h,
          )
        ],
      ),
    );
  }
}
