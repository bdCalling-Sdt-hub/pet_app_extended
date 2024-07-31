import 'package:felpus/app/common/Extension/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/app_images/app_images.dart';
import '../../../common/widgets/custom_text.dart';

class FirstAidAppBar extends StatelessWidget {
  const FirstAidAppBar({
    super.key,
    required this.titleText,
  });

  final String titleText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      // centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: CustomText(
          textAlign: TextAlign.center,
          text: titleText,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: InkWell(
        onTap: () => Get.back(),
        child: const Icon(Icons.arrow_back_ios, size: 22),
      ),
      actions: const [
        SizedBox(width: 30,)
      ],
    );
  }
}

class DotRow extends StatelessWidget {
  DotRow({super.key, required this.text, this.titleText});

  final String text;
  String? titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        16.width, // Use SizedBox for consistent spacing
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Image.asset(
            AppImages.dotPoint, // Your dot image asset
            height: 10,
            width: 10,
          ),
        ),
        8.width, // Use SizedBox for consistent spacing
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                if (titleText != null)
                  TextSpan(
                    text: "$titleText ",
                    style: GoogleFonts.urbanist(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                TextSpan(
                  text: text,
                  style: GoogleFonts.urbanist(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NumberedList extends StatelessWidget {
  const NumberedList({
    super.key,
    required this.list,
  });

  final List list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          list.length,
              (index) {
            return CustomText(text: "${index + 1}. ${list[index]}");
          },
        ),
      ),
    );
  }
}

class CustomTitleText extends StatelessWidget {
  const CustomTitleText({
    super.key,
    required this.titleText,
    this.textAlignment = Alignment.centerLeft,
  });

  final String titleText;
  final Alignment textAlignment;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: textAlignment,
        child: CustomText(
          textAlign: TextAlign.center,
          text: titleText,
          isTextDecoration: true,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ));
  }
}