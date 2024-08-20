import 'package:flutter/material.dart';

import '../../utils/app_color/app_colors.dart';
import '../../utils/app_text_style/styles.dart';



class CustomTextField extends StatelessWidget {
  final String title;
  final double width;
  final double? horizontalPadding;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? sufIcon;
  final Widget? preIcon;
  final bool? optional;
  final int? maxLines;
  double borderRadius;
  CustomTextField({
    super.key,
    required this.title,
    required this.width,
     this.hintText,
     this.controller,
     this.optional,
      this.horizontalPadding,
     this.sufIcon,
     this.maxLines,
     this.preIcon,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: horizontalPadding != null? horizontalPadding! : 20,vertical: 7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == ""? const SizedBox() : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: h3.copyWith(color: AppColors.textColor),),
              Text(optional == true? "(Optional)" : "",style: h3.copyWith(color: AppColors.light),),
            ],
          ),
          title == ""? const SizedBox() :const SizedBox(height: 12,),
          Container(
            height: maxLines != null ? 100 : 50,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: AppColors.grayLight)
            ),
            child:  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                  suffixIcon: sufIcon,
                  prefixIcon: preIcon,
                  hintText: hintText,
                  hintStyle: const TextStyle(color: AppColors.hintColor,fontSize: 14),
                ),
                maxLines: maxLines ?? 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}