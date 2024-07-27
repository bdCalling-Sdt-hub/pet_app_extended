import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/widgets/custom_image.dart';
import '../../../common/widgets/custom_text.dart';




class ChatListItem extends StatelessWidget {
  ChatListItem({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    required this.numberOfMessages
  });

  final String image;
  final String name;
  final String message;
  final String time;
  final int numberOfMessages;

  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(12.w),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 30.r,
                child: ClipOval(
                  child: CustomImage(
                    imageSrc: image,
                    imageType: ImageType.network,
                    height: 60.h,
                    width: 60.w,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 5,
                child: Container(
                  height: 12.h,
                  width: 12.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.oliveLight, width: 2),
                    color: isOnline ? AppColors.blue : AppColors.grayLight,
                    borderRadius: BorderRadius.circular(100.r)
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 12.w,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: name,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              CustomText(
                textAlign: TextAlign.left,
                text: message,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
