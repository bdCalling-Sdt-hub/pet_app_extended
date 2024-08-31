
import 'package:felpus/controllers/GoogleMapControllers/nearby_map_controller.dart';
import 'package:felpus/utils/app_color/app_colors.dart';
import 'package:felpus/utils/app_text_style/styles.dart';
import 'package:felpus/utils/size_box/custom_sizebox.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:felpus/views/screens/FirstAid/Views/tips_para_encontrar.dart';
import 'package:felpus/views/screens/FirstAid/Views/tratamiento_inhalacion.dart';
import 'package:felpus/views/screens/FirstAid/Views/tratamiento_quemadura.dart';
import 'package:felpus/views/screens/lost_pets/lost_pets_view.dart';
import 'package:felpus/views/screens/nearby_map_screen/nearby_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_images/app_images.dart';
import '../FirstAid/Views/manejo_screen.dart';
import '../FirstAid/Views/maniobra_screen.dart';
import '../FirstAid/Views/monitorizacion_screen.dart';
import '../FirstAid/Views/rcp_guide_screen.dart';
import '../FirstAid/Views/traslado_mascota.dart';
import '../FirstAid/Views/tratamiento_fracturas.dart';
import 'dart:developer' as print;


class ResourcesView extends StatelessWidget {
  ResourcesView({super.key});

  List firstAidItems = [
    {"icon" : AppImages.monitoring, "title" : "Monitorizacion de signos vitales", "onTap": () => Get.to(()=> Monitorizacion())},
    {"icon" : AppImages.heimlich, "title" : "Maniobra de Heimlich para Ahogos", "onTap": () => Get.to(()=> const Maniobra())},
    {"icon" : AppImages.heart, "title" : "RCP (Resucitación Cardiopulmonar)", "onTap": () => Get.to(()=> const RCPGuideScreen())},
    {"icon" : AppImages.seizure, "title" : "Manejo de convulsiones", "onTap": () => Get.to(()=> const ManejoScreen())},
    {"icon" : AppImages.boneIcon , "title" : "Tratamiento de fracturas", "onTap": () => Get.to(()=> const TratamientoFracturas())},
    {"icon" : AppImages.crossIcon , "title" : "Traslado de Mascota Lesionada", "onTap": () => Get.to(()=> const TrasladoMascota())},
    {"icon" : AppImages.aidIcon , "title" : "Tratamiento Quemaduras y Golpes de Calor", "onTap": () => Get.to(()=> const TratamientoQuemadura())},
    {"icon" : AppImages.smoke , "title" : "Inhalación de Humo", "onTap": () => Get.to(()=> const TratamientoInhalacion())},
    {"icon" : AppImages.lightIcon , "title" : "Tips Para Encontrar tu Mascota Perdida", "onTap": () => Get.to(()=> const TipsParaEncontrar())},
  ];

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  static bool isFire = false;
  static bool isEarthQuake = false;
  static bool isFlood = false;

  static bool isLost = false;
  // static bool isInjured = false;
  // static bool isAbused = false;

  RxBool isFirstAidTapped = false.obs;

  RxBool isVetsNearbyTapped = false.obs;

  RxBool isPetSheltersTapped = false.obs;

  RxBool isCallFiremanTapped = false.obs;

  final Map<int, bool> selectedItems = {};

  void _printSelectedIndices() {
    final selectedIndices = selectedItems.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
    print.log('Selected indices: $selectedIndices');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title:  Text('More Resources',style: h2.copyWith(fontSize: 20,color: AppColors.black),),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Stack(
        children: [
          Image.asset(AppImages.lotsOfPets),
          Container(
            width: Get.width,
            height: Get.height,
            color: AppColors.white.withOpacity(0.7),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    isFirstAidTapped.value = false;
                    isPetSheltersTapped.value = false;
                    isVetsNearbyTapped.value = false;
                    isCallFiremanTapped.value = !isCallFiremanTapped.value;
                    if(isCallFiremanTapped.value){
                      if(isFire || isEarthQuake || isFlood){
                        FlutterPhoneDirectCaller.callNumber("999");
                      }else{
                        FlutterPhoneDirectCaller.callNumber("191");
                      }
                    }
                  },
                  child: Obx(() => Container(
                    height: 132,
                    width: 142,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isCallFiremanTapped.value? AppColors.mainColor : AppColors.pinkExtraLight
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(isFire || isEarthQuake || isFlood? AppImages.fireTruck : AppImages.policeAlarm, scale: isFire || isEarthQuake || isFlood? 4 : 8, color: isCallFiremanTapped.value? AppColors.white : null),
                        sh5,
                        Text(isFire || isEarthQuake || isFlood? "Call Fireman" : "Call Police",style: h2.copyWith(fontSize: 20, color: isCallFiremanTapped.value? AppColors.white : AppColors.black),)
                      ],
                    ),
                  ),),
                ),
                sh15,
                GestureDetector(
                  onTap: () {
                    isFirstAidTapped.value = false;
                    isPetSheltersTapped.value = !isPetSheltersTapped.value;
                    isVetsNearbyTapped.value = false;
                    isCallFiremanTapped.value = false;

                    NearByMapController.searchForText = "Pet Shelters";
                    Get.to(()=> NearbyMapScreen());
                  },
                  child: Obx(() => Container(
                    width: 142,
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isPetSheltersTapped.value? AppColors.mainColor : AppColors.pinkExtraLight
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.petHome,scale: 4, color: isPetSheltersTapped.value? AppColors.white : null,),
                        sh5,
                        Text("Pet Shelter\n Nearby",style: h2.copyWith(fontSize: 20, color: isPetSheltersTapped.value? AppColors.white : AppColors.black),textAlign: TextAlign.center,)
                      ],
                    ),
                  ),),
                ),
                sh15,
                GestureDetector(
                  onTap: () {
                    isFirstAidTapped.value = false;
                    isPetSheltersTapped.value = false;
                    isVetsNearbyTapped.value = !isVetsNearbyTapped.value;
                    isCallFiremanTapped.value = false;

                    if(isFire || isEarthQuake || isFlood){
                      NearByMapController.searchForText = "Vets";
                      Get.to(()=> NearbyMapScreen());
                    }else{
                      Get.to(()=> LostPetsView());
                    }
                  },
                  child: Obx(() => Container(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    width: 142,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isVetsNearbyTapped.value ? AppColors.mainColor : AppColors.pinkExtraLight
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(isFire || isEarthQuake || isFlood? AppImages.petLeg : AppImages.pawSearchIcon ,scale: isFire || isEarthQuake || isFlood? 4 : 8, color: isVetsNearbyTapped.value ? AppColors.white : null),
                        sh5,
                        Text(isFire || isEarthQuake || isFlood? "Vets Nearby" : "Check Lost & Found Pets",style: h2.copyWith(fontSize: 20, color: isVetsNearbyTapped.value ? AppColors.white : AppColors.black),textAlign: TextAlign.center,)
                      ],
                    ),
                  ),),
                ),
                sh15,
                GestureDetector(
                  onTap: (){
                    isFirstAidTapped.value = !isFirstAidTapped.value;
                    isVetsNearbyTapped.value = false;
                    isPetSheltersTapped.value = false;
                    isCallFiremanTapped.value = false;

                    if(isFirstAidTapped.value){
                      if(isFire || isEarthQuake || isFlood){
                        Get.bottomSheet(
                          Container(
                            width: Get.width,
                            height: 600,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                              child: Column(
                                children: [
                                  sh10,
                                  Container(
                                    height: 2,
                                    width: 100,
                                    color: AppColors.grayLight,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "First Aid",
                                        style: h3.copyWith(fontSize: 26, color: AppColors.mainColor),
                                        textAlign: TextAlign.center,
                                      ),
                                      sw5,
                                      Text(
                                        "Resources.",
                                        style: h3.copyWith(fontSize: 26, color: AppColors.black),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  sh10,
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: firstAidItems.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: firstAidItems[index]["onTap"],
                                          child: ListTile(
                                            title: CustomText(text: firstAidItems[index]["title"]),
                                            leading: Image.asset(
                                              firstAidItems[index]["icon"],
                                              scale: 4,
                                            ),
                                            trailing: Container(
                                              decoration: const ShapeDecoration(
                                                shape: CircleBorder(
                                                  side: BorderSide(
                                                    width: 2.0,
                                                    color: AppColors.mainColor,
                                                  ),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(1.0),
                                                child: Container(
                                                  decoration: const ShapeDecoration(
                                                    shape: CircleBorder(),
                                                    color: AppColors.mainColor,
                                                  ),
                                                  child: const SizedBox(
                                                    width: 16.0,
                                                    height: 16.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          barrierColor: Colors.black.withOpacity(0.5),
                          isDismissible: true,
                          isScrollControlled: true, // Allows the bottom sheet to take the full height
                        );
                      }else{
                        Get.to(()=> TipsParaEncontrar());
                      }
                    }
                  },
                  child: Obx(() => Container(
                    width: 142,
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isFirstAidTapped.value? AppColors.mainColor : AppColors.pinkExtraLight
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(isFire || isEarthQuake || isFlood? AppImages.firstAidKit : AppImages.tipsLightIcon,scale: isFire || isEarthQuake || isFlood? 4 : 8, color: isFirstAidTapped.value? AppColors.white : null),
                        sh5,
                        Text(isFire || isEarthQuake || isFlood? "First Aid" : "Tips To Find Lost Pets",style: h2.copyWith(fontSize: 20, color: isFirstAidTapped.value? AppColors.white : AppColors.black),textAlign: TextAlign.center, )
                      ],
                    ),
                  )),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
