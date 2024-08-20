import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_color/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.maxLines = 5,
    this.textAlign = TextAlign.left,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.color = AppColors.black,
    required this.text,
    this.style = false,
    this.overflow = TextOverflow.ellipsis,
    this.isTextDecoration = false
  });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final bool style;
  final bool isTextDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: left.w, right: right.w, top: top.h, bottom: bottom.h),
      child: Text(
        textAlign: textAlign,
        text,
        maxLines: maxLines,
        overflow: overflow,
        style: GoogleFonts.urbanist(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            decoration: isTextDecoration? TextDecoration.underline : null),
      ),
    );
  }
}
