import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_images/app_images.dart';
import '../../../common/app_text_style/styles.dart';
import '../controllers/resources_controller.dart';

class ResourcesView extends StatefulWidget {
  const ResourcesView({super.key});

  @override
  State<ResourcesView> createState() => _ResourcesViewState();
}

class _ResourcesViewState extends State<ResourcesView> {


  List firstAidItems = [
    {"icon" : AppImages.monitoring, "title" : "Monitorizacion de signos vitales"},
    {"icon" : AppImages.heimlich, "title" : "Maniobra de Heimlich para Ahogos"},
    {"icon" : AppImages.heart, "title" : "RCP (Resucitación Cardiopulmonar)"},
    {"icon" : AppImages.seizure, "title" : "Manejo de convulsiones"},
    {"icon" : AppImages.boneIcon , "title" : "Tratamiento de fracturas"},
    {"icon" : AppImages.crossIcon , "title" : "Traslado de Mascota Lesionada"},
    {"icon" : AppImages.aidIcon , "title" : "Tratamiento Quemaduras y Golpes de Calor"},
    {"icon" : AppImages.smoke , "title" : "Inhalación de Humo"},
    {"icon" : AppImages.lightIcon , "title" : "Tips Para Encontrar tu Mascota Perdida"},
  ];

  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

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
    print('Selected indices: $selectedIndices');
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
          Image.asset(AppImages.multiPets),
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
                Container(
                  height: 122,
                  width: 142,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.pinkExtraLight
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.fireTruck,scale: 4,),
                      sh5,
                      Text("Call Fireman",style: h2.copyWith(fontSize: 20),)
                    ],
                  ),
                ),
                sh15,
                Container(
                  height: 122,
                  width: 142,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.pinkExtraLight
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.petHome,scale: 4,),
                      sh5,
                      Text("Pet Shelter\n Nearby",style: h2.copyWith(fontSize: 20),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
                sh15,
                Container(
                  height: 122,
                  width: 142,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.pinkExtraLight
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.petLeg,scale: 4,),
                      sh5,
                      Text("Vets Nearby",style: h2.copyWith(fontSize: 20),textAlign: TextAlign.center,)
                    ],
                  ),
                ),
                sh15,
                GestureDetector(
                  onTap: (){
                    isFirstAidTapped.value = !isFirstAidTapped.value;
                    isVetsNearbyTapped.value = false;
                    isPetSheltersTapped.value = false;
                    isCallFiremanTapped.value = false;

                    if(isFirstAidTapped.value){
                      Get.bottomSheet(
                        Container(
                          width: Get.width,
                          height: 700,
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 10),
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

                                    Text("First Aid",style:  h3.copyWith(fontSize: 26,color: AppColors.mainColor),textAlign: TextAlign.center,),
                                    sw5,
                                    Text("Resources.",style:  h3.copyWith(fontSize: 26,color: AppColors.black),textAlign: TextAlign.center,),
                                  ],
                                ),
                                sh10,
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: firstAidItems.length,
                                    itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: ListTile(
                                        title: CustomText(text: firstAidItems[index]["title"]),
                                        leading: Image.asset(firstAidItems[index]["icon"],scale: 4 ),
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
                                                color: AppColors.mainColor ,
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
                                  },),
                                )
                              ],
                            ),
                          ),
                        ),
                        barrierColor: Colors.black.withOpacity(0.5),
                        isDismissible: true,
                      );
                    }
                  },
                  child: Obx(() => Container(
                    height: 122,
                    width: 142,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: isFirstAidTapped.value? AppColors.mainColor : AppColors.pinkExtraLight
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(AppImages.firstAidKit,scale: 4, color: isFirstAidTapped.value? AppColors.white : null),
                        sh5,
                        Text("First Aid",style: h2.copyWith(fontSize: 20, color: isFirstAidTapped.value? AppColors.white : AppColors.black),textAlign: TextAlign.center, )
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
