
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../views/components/custom_image.dart';
import '../../../../views/components/custom_text.dart';




class ChatListItem extends StatelessWidget {
  ChatListItem({
    super.key,
    required this.image,
    required this.name,
    required this.message,
    required this.time,
    required this.numberOfMessages,
    this.isArchived = false
  });

  final String image;
  final String name;
  final String message;
  final String time;
  final int numberOfMessages;
  final bool isArchived;

  bool isOnline = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      child: Row(
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
          isArchived? Image.asset(AppImages.archiveIcon, scale: 20,) : const SizedBox(),
        ],
      ),
    );
  }
}
