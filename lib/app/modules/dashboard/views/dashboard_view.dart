import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget{
  DashboardView({super.key});

  final DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return dashboardController.allScreens.elementAt(dashboardController.selectedIndex.value);
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.home,scale: 4,color: dashboardController.selectedIndex.value == 0?  AppColors.mainColor : AppColors.black,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.search,scale: 4,color: dashboardController.selectedIndex.value == 1?  AppColors.mainColor : AppColors.black,),
              label: 'Lost Pets',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.favorite,scale: 4,color: dashboardController.selectedIndex.value == 2?  AppColors.mainColor : AppColors.black,),
              label: 'Adoption',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.groupPerson ,scale: 4, color: dashboardController.selectedIndex.value == 3?  AppColors.mainColor : AppColors.black,),
              label: 'Groups',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.user, scale: 4,color: dashboardController.selectedIndex.value == 4?  AppColors.mainColor : AppColors.black,),
              label: 'Profile',
            ),
          ],
          currentIndex: dashboardController.selectedIndex.value,
          selectedItemColor: AppColors.mainColor,
          onTap: dashboardController.onItemTapped,
        );
      }),
    );
  }
}