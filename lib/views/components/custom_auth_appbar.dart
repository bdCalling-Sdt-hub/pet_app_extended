import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_color/app_colors.dart';
import '../../utils/app_images/app_images.dart';
import '../../utils/size_box/custom_sizebox.dart';


AppBar CustomAuthAppBar() {
  return AppBar(
    backgroundColor: AppColors.white,
    leading: InkWell(
        onTap: () => Get.back(),
        child: const Icon(Icons.arrow_back_ios)),
    actions: [
      Image.asset(AppImages.icon,scale: 1.5,),
      sw10
    ],
  );
}