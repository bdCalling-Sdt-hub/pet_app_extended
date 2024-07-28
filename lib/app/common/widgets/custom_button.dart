import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_color/app_colors.dart';
import '../app_text_style/styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double width;
  final Color color;
  final Color? borderColor;
  final double? horizontalPadding;
  final Color? titleColor;
  final Function()? onTap;

  const CustomButton({
    super.key,
    required this.title,
    required this.width,
    required this.color,
    this.borderColor,
    this.horizontalPadding,
    this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: horizontalPadding != null? horizontalPadding! : 20,),
        child: Container(
          height: 45,
          width: width,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: borderColor != null ? borderColor! : color)
          ),
          child: Center(child: Text(title,style: h2.copyWith(color: titleColor != null ? titleColor! : AppColors.white),),),
        ),
      ),
    );
  }
}