import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text('Notifications',style: h2.copyWith(fontSize: 26,color: AppColors.mainColor),),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: ListView.builder(
        itemCount: 12,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            color: index == 0 || index == 1 || index == 2 || index == 3 ?   AppColors.notificationColor : AppColors.white,
            child: ListTile(
              title: Text("Amelia sent you a message.",style: h4.copyWith(fontSize: 17,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
              leading: Image.asset(AppImages.notification,scale: 4,),
              subtitle: Text("16 minutes ago",style: h4.copyWith(fontSize: 17),),
            ),
          ),
        );
      })
    );
  }
}
