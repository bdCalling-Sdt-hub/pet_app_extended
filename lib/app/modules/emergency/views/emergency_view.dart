import 'package:felpus/app/common/Extension/extension.dart';
import 'package:felpus/app/common/app_color/app_colors.dart';
import 'package:felpus/app/common/app_images/app_images.dart';
import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/modules/emergency/views/emergency_send_sms_type_view.dart';
import 'package:felpus/app/modules/forgot/views/forgot_view.dart';
import 'package:felpus/app/modules/login/views/login_view.dart';
import 'package:felpus/app/modules/notifications/views/notifications_view.dart';
import 'package:felpus/app/modules/signup/views/signup_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/size_box/custom_sizebox.dart';
import '../controllers/emergency_controller.dart';

class EmergencyView extends StatelessWidget {
   EmergencyView({super.key});


  final List<Map<String, String>> items = [
    {'title': 'Lost Pets', 'icon': AppImages.search},
    {'title': 'Injured Pet', 'icon': AppImages.injured},
    {'title': 'Abused Pet', 'icon': AppImages.abused},
    {'title': 'Fire', 'icon': AppImages.fire,  },       // Add correct path for icons
    {'title': 'Earthquake', 'icon': AppImages.earthquake},
    {'title': 'Flood', 'icon': AppImages.flood},
  ];

/*   final List<Map<String, String>> items = [
     {'title': 'Fire', 'icon': 'assets/fire.png', 'route': '/fire'},
     {'title': 'Earthquake', 'icon': 'assets/earthquake.png', 'route': '/earthquake'},
     {'title': 'Flood', 'icon': 'assets/flood.png', 'route': '/flood'},
     {'title': 'Lost Pets', 'icon': 'assets/lost_pets.png', 'route': '/lost_pets'},
     {'title': 'Injured Pet', 'icon': 'assets/injured_pet.png', 'route': '/injured_pet'},
     {'title': 'Abused Pet', 'icon': 'assets/abused_pet.png', 'route': '/abused_pet'},
   ];*/

 /* final List routePage = [

    Get.to(() => LoginView()),
    Get.to(() => SignupView()),
    Get.to(() => ForgotView()),
    Get.to(() => NotificationsView()),
    Get.to(() => NotificationsView()),
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text('Emergency',style: h2.copyWith(fontSize: 26,color: AppColors.mainColor),),
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
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                80.height,
                Text("Get Help",style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),
                sh50,
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
                        Get.to(() => EmergencySendSmsTypeView());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:  AppColors.pinkLight,  // Highlight Lost Pets in red
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              item['icon']!,
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item['title']!,
                              style: h2
                            ),
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
      )
    );
  }
}
