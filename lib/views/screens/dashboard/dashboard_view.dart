import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/dashboard_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';

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
              icon: Image.asset(AppImages.home, scale: 4, color: dashboardController.selectedIndex.value == 0 ? AppColors.mainColor : AppColors.black),
              label: 'Home'.tr,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.search, scale: 4, color: dashboardController.selectedIndex.value == 1 ? AppColors.mainColor : AppColors.black),
              label: 'Lost Pets'.tr,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.favorite, scale: 4, color: dashboardController.selectedIndex.value == 2 ? AppColors.mainColor : AppColors.black),
              label: 'Adoption'.tr,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.groupPerson, scale: 4, color: dashboardController.selectedIndex.value == 3 ? AppColors.mainColor : AppColors.black),
              label: 'Groups'.tr,
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.user, scale: 4, color: dashboardController.selectedIndex.value == 4 ? AppColors.mainColor : AppColors.black),
              label: 'Profile'.tr,
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
