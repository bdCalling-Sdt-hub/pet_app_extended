
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/utils/app_images/app_images.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressBottomSheet {
  static showAddressBottomSheet(String address) {

    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                16.height,
                Row(
                  children: [
                    const CustomImage(imageSrc: AppImages.shelterIcon, imageType: ImageType.png,),
                    8.width,
                    Expanded(child: CustomText(text: address, maxLines: 3,)),
                  ],
                ),
                24.height,
              ],
            ),
          ),
        );
      },
    );
  }
}