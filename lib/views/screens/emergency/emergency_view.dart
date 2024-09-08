import 'package:felpus/extensions/extension.dart';

import 'package:felpus/controllers/message_controller.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:felpus/views/screens/resources/resources_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import 'emergency_send_sms_type_view.dart';

class EmergencyView extends StatefulWidget {
  EmergencyView({super.key});

  @override
  State<EmergencyView> createState() => _EmergencyViewState();
}

class _EmergencyViewState extends State<EmergencyView> {
  final List<Map<String, String>> items = [
    {'title': 'Lost Pets', 'icon': AppImages.lostPets},
    {'title': 'Injured Pet', 'icon': AppImages.injuredPet},
    {'title': 'Abused Pet', 'icon': AppImages.abusedPet},
    {'title': 'Fire', 'icon': AppImages.fire},
    {'title': 'Earthquake', 'icon': AppImages.earthquake},
    {'title': 'Flood', 'icon': AppImages.flood},
  ];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text('Emergency'.tr, style: h2.copyWith(fontSize: 26, color: AppColors.mainColor)),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: [
          Image.asset(AppImages.emergencyPet),
          Container(
            width: Get.width,
            height: Get.height,
            color: AppColors.white.withOpacity(0.7),
          ),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                80.height,
                Text("Get Help".tr, style:  h3.copyWith(fontSize: 30, color: AppColors.mainColor), textAlign: TextAlign.center),
                50.height,
                SizedBox(
                  height: 500,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                          if(index == 3 || index == 4 || index == 5){
                            ResourcesView.isFire = true;
                            ResourcesView.isLost = false;
                          } else {
                            ResourcesView.isFire = false;
                            ResourcesView.isLost = true;
                          }
                          MessageController.instance.handleItemSelected(item);
                          Get.to(() => const EmergencySendSmsTypeView());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedIndex == index ? AppColors.mainColor : AppColors.pinkLight,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                item['icon']!,
                                width: 50,
                                height: 50,
                                color: selectedIndex == index ? AppColors.white : AppColors.black,
                              ),
                              const SizedBox(height: 10),
                              CustomText(
                                textAlign: TextAlign.center,
                                text: item['title']!.tr,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: selectedIndex == index ? AppColors.white : AppColors.black,)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
