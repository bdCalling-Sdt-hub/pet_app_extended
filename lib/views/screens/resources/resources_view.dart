import 'package:felpus/controllers/GoogleMapControllers/nearby_map_controller.dart';
import 'package:felpus/controllers/message_controller.dart';
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
    {"icon" : AppImages.monitoring, "title" : "Monitorizacion de signos vitales".tr, "onTap": () => Get.to(()=> Monitorizacion())},
    {"icon" : AppImages.heimlich, "title" : "Maniobra de Heimlich para Ahogos".tr, "onTap": () => Get.to(()=> const Maniobra())},
    {"icon" : AppImages.heart, "title" : "RCP (Resucitación Cardiopulmonar)".tr, "onTap": () => Get.to(()=> const RCPGuideScreen())},
    {"icon" : AppImages.seizure, "title" : "Manejo de convulsiones".tr, "onTap": () => Get.to(()=> const ManejoScreen())},
    {"icon" : AppImages.boneIcon , "title" : "Tratamiento de fracturas".tr, "onTap": () => Get.to(()=> const TratamientoFracturas())},
    {"icon" : AppImages.crossIcon , "title" : "Traslado de Mascota Lesionada".tr, "onTap": () => Get.to(()=> const TrasladoMascota())},
    {"icon" : AppImages.aidIcon , "title" : "Tratamiento Quemaduras y Golpes de Calor".tr, "onTap": () => Get.to(()=> const TratamientoQuemadura())},
    {"icon" : AppImages.smoke , "title" : "Inhalación de Humo".tr, "onTap": () => Get.to(()=> const TratamientoInhalacion())},
    {"icon" : AppImages.lightIcon , "title" : "Tips Para Encontrar tu Mascota Perdida".tr, "onTap": () => Get.to(()=> const TipsParaEncontrar())},
  ];

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  static bool isFire = false;
  // static bool isEarthQuake = false;
  // static bool isFlood = false;

  static bool isLost = false;
  // static bool isInjured = false;
  // static bool isAbused = false;

  RxBool isFirstAidTapped = false.obs;

  RxBool isVetsNearbyTapped = false.obs;

  RxBool isPetSheltersTapped = false.obs;

  RxBool isCallFiremanTapped = false.obs;

  final Map<int, bool> selectedItems = {};

  List policeNumberList = [
    {"Spanish Police" : "091"},
    {"Argentine Police" : "911"},
  ];

  List rescueNumberList = [
    {"Spanish Firefighters" : "112"},
    {"Argentine Firefighters" : "911"},
  ];

  RxInt selectedItem = 10.obs;

  void _printSelectedIndices() {
    final selectedIndices = selectedItems.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
    print.log('Selected indices: $selectedIndices');
  }

  @override
  Widget build(BuildContext context) {
    print.log("HElP TYPE : ${MessageController.helpType}");
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title:  Text('More Resources'.tr,style: h2.copyWith(fontSize: 20,color: AppColors.black),),
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
                        if(isFire || MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood"){
                          // FlutterPhoneDirectCaller.callNumber("999");
                          customShowDialog(context: context, helpList: rescueNumberList);
                        }else{
                          // FlutterPhoneDirectCaller.callNumber("191");
                          customShowDialog(context: context, helpList: policeNumberList);
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
                          Image.asset(isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood"? AppImages.fireTruck : AppImages.policeAlarm, scale: isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood"? 4 : 8, color: isCallFiremanTapped.value? AppColors.white : null),
                          sh5,
                          CustomText(
                            textAlign: TextAlign.center,
                              text: isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood"? "Call Fireman".tr : "Call Police".tr,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: isCallFiremanTapped.value? AppColors.white : AppColors.black
                          )
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

                      NearByMapController.searchForText = "Pet Shelters".tr;
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
                          Text("Pet Shelter\n Nearby".tr,style: h2.copyWith(fontSize: 20, color: isPetSheltersTapped.value? AppColors.white : AppColors.black),textAlign: TextAlign.center,)
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

                      if(isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood"){
                        NearByMapController.searchForText = "Vets".tr;
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
                          Image.asset(isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood"? AppImages.petLeg : AppImages.pawSearchIcon ,scale: isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood" ? 4 : 8, color: isVetsNearbyTapped.value ? AppColors.white : null),
                          sh5,
                          Text(isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood"? "Vets Nearby".tr : "Check Lost & Found Pets".tr,style: h2.copyWith(fontSize: 20, color: isVetsNearbyTapped.value ? AppColors.white : AppColors.black),textAlign: TextAlign.center,)
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
                        if(isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood"){
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
                                          "First Aid".tr,
                                          style: h3.copyWith(fontSize: 26, color: AppColors.mainColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        sw5,
                                        Text(
                                          "Resources.".tr,
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
                          Image.asset(isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood"? AppImages.firstAidKit : AppImages.tipsLightIcon,scale: isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood" ? 4 : 8, color: isFirstAidTapped.value? AppColors.white : null),
                          sh5,
                          Text(isFire|| MessageController.helpType == "fire" || MessageController.helpType == "earthquake" || MessageController.helpType == "flood"? "First Aid".tr : "Tips To Find Lost Pets".tr,style: h2.copyWith(fontSize: 20, color: isFirstAidTapped.value? AppColors.white : AppColors.black),textAlign: TextAlign.center, )
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

  Future<dynamic> customShowDialog({required BuildContext context, required List helpList}) {
    return showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          content: Obx(() => Padding(
                            padding: EdgeInsets.only(left: 20.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(
                                helpList.length,
                                    (index) {
                                  // Get the key (police name) and value (police number) from the map
                                  String name = helpList[index].keys.first;
                                  String number = helpList[index].values.first;

                                  return GestureDetector(
                                    onTap: () {
                                      FlutterPhoneDirectCaller.callNumber(number);
                                      // Use the value (police number) when tapped
                                      print.log('Police Number: $number'); // Replace with your action
                                      selectedItem.value = index;
                                    },
                                    child: SizedBox(
                                      height: 50,
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(4.r),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              border: Border.all(
                                                color: Colors.black.withOpacity(.2),
                                                width: 1,
                                              ),
                                              color: index == selectedItem.value
                                                  ? AppColors.green
                                                  : AppColors.white,
                                            ),
                                            child: Icon(Icons.call_outlined, color: index != selectedItem.value
                                                ? AppColors.green
                                                : AppColors.white,),
                                          ),
                                          CustomText(
                                            text: name.tr, // Display the police name (key)
                                            color: index == selectedItem.value? AppColors.mainColor : AppColors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            left: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )),
                        );
                      },);
  }
  Row cardShortSelection(int value, String text) {
    return Row(
      children: [
        Radio<int>(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: value,
            groupValue: selectedItem.value,
            activeColor: AppColors.black,
            fillColor: MaterialStateProperty.all(AppColors.black),
            splashRadius: 20,
            onChanged: (value) {
              selectedItem.value = value!.toInt();
            },
            visualDensity: VisualDensity(horizontal: -4, vertical: -2)),
        SizedBox(width: 12.w),
        CustomText(
          text: text,
          fontSize: 16,
          color: AppColors.black,
        )
      ],
    );
  }
}
