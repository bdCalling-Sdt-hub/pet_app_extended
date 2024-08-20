
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/app_color/app_colors.dart';
import 'custom_loader.dart';
import 'custom_text.dart';


class CustomContainerButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double borderRadius;
  final VoidCallback onTap;
  final String text;
  final double height;
  final double width;
  final double top;
  final double left;
  final double right;
  final double bottom;
  final double elevation;
  final double fontSize;
  final FontWeight fontWeight;
  final bool isFillColor;
  final String? svgIcon;
  final IconData? icon;
  final bool isLoading;

  const CustomContainerButton({
    super.key,
    this.backgroundColor = AppColors.mainColor,
    this.borderColor = AppColors.mainColor,
    this.textColor = AppColors.white,
    this.borderRadius = 8,
    required this.onTap,
    this.text = "Get Started",
    this.height = 56,
    this.width = double.infinity,
    this.top = 0,
    this.left = 0,
    this.right = 0,
    this.bottom = 0,
    this.elevation = 0,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    this.isFillColor = true,
    this.svgIcon,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: isLoading
          ? const CustomLoader()
          :  Container(
        margin:
        EdgeInsets.only(top: top.h, left: left.w, right: right.w, bottom: bottom.h),
        alignment: Alignment.center,
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          border: Border.all(
              color: isFillColor ? Colors.transparent : borderColor),
          borderRadius: BorderRadius.circular(borderRadius.r),
          color: backgroundColor,

          // color: isFillColor ? backgroundColor : null,
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (svgIcon != null)
              Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: SvgPicture.asset(svgIcon!, height: 32.h, width: 32.w,),
            ),
            if(icon != null)
              Padding(padding: EdgeInsets.only(right: 8.w),
                child: Icon(icon, color: textColor, size: 18,),
              ),
            CustomText(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: textColor,
              text: text,
            )
          ],
        ),
      ),
    );
  }
}