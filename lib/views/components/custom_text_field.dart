import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/app_text_style/styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {this.inputFormatters,
        this.onFieldSubmitted,
        this.controller,
        this.focusNode,
        this.keyboardType = TextInputType.text,
        this.textInputAction = TextInputAction.next,
        this.cursorColor = AppColors.black,
        this.textAlignVertical = TextAlignVertical.center,
        this.textAlign = TextAlign.start,
        this.onChanged,
        this.maxLines = 1,
        this.validator,
        this.labelText,
        this.hintText,
        this.textStyle,
        this.fillColor = AppColors.white,
        this.suffixIcon,
        this.suffixIconColor,
        this.fieldBorderRadius,
        this.fieldBorderColor = AppColors.grayLight,
        this.isPassword = false,
        this.isPrefixIcon = true,
        this.readOnly = false,
        this.maxLength,
        super.key,
        this.prefixIcon,
        this.onTap,
        this.horizontal,
        this.isEnabled = true,
        this.vertical,
        this.title = "",
        this.optional,
        this.horizontalPadding = 20,
      });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color cursorColor;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;

  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FormFieldValidator? validator;
  final String? labelText;
  final String? hintText;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? fieldBorderRadius;
  final double? vertical;
  final double? horizontal;
  final VoidCallback? onTap;

  final Color fieldBorderColor;
  final bool isPassword;
  final bool isPrefixIcon;
  final bool isEnabled;
  final bool readOnly;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final String title;
  final bool? optional;
  final double horizontalPadding;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding,  ),
      child: Column(
        children: [
          widget.title == ""? const SizedBox() : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.title,style: h3.copyWith(color: AppColors.textColor),),
              Text(widget.optional == true? "(Optional)" : "",style: h3.copyWith(color: AppColors.light),),
            ],
          ),
          widget.title == ""? const SizedBox() :const SizedBox(height: 8,),
          TextFormField(

            onTap: widget.onTap,
            inputFormatters: widget.inputFormatters,
            onFieldSubmitted: widget.onFieldSubmitted,
            readOnly: widget.readOnly,
            controller: widget.controller,
            focusNode: widget.focusNode,
            maxLength: widget.maxLength,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            cursorColor: widget.cursorColor,
            style: widget.textStyle,
            onChanged: widget.onChanged,
            maxLines: widget.maxLines,
            obscureText: widget.isPassword ? obscureText : false,
            validator: widget.validator,
            enabled: widget.isEnabled,
            showCursor: widget.keyboardType == TextInputType.none ? false : true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  vertical: widget.vertical ?? 12.h,
                  horizontal: widget.horizontal ?? 14.w),
              labelText: widget.labelText,
              hintText: widget.hintText,
              labelStyle: const TextStyle(
                fontSize: 14,
              ),
              hintStyle: const TextStyle(color: AppColors.hintColor,fontSize: 14),
              fillColor: widget.fillColor,
              filled: true,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                onTap: toggle,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.w, right: 16.w, top: 12.h, bottom: 12.h),
                  child: obscureText
                      ? Icon(
                    Icons.visibility_off_outlined,
                    size: 20.w,
                    color: widget.cursorColor,
                  )
                      : Icon(
                    Icons.visibility_outlined,
                    color: widget.cursorColor,
                    size: 20.w,
                  ),
                ),
              )
                  : widget.suffixIcon,
              suffixIconColor: widget.suffixIconColor,
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(widget.fieldBorderRadius ?? 10.r),
                  borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
                  gapPadding: 0),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(widget.fieldBorderRadius ?? 10.r),
                  borderSide: const BorderSide(color: AppColors.grayLight, width: 1),
                  gapPadding: 0),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(widget.fieldBorderRadius ?? 10.r),
                  borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
                  gapPadding: 0),
            ),
          ),
        ],
      ),
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
