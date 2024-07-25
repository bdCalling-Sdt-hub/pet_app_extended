import 'package:felpus/app/common/app_text_style/styles.dart';
import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/modules/message/views/select_pets_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/app_color/app_colors.dart';

class EmergencySendSmsTypeView extends StatefulWidget {
  const EmergencySendSmsTypeView({super.key});

  @override
  State<EmergencySendSmsTypeView> createState() => _EmergencySendSmsTypeViewState();
}

class _EmergencySendSmsTypeViewState extends State<EmergencySendSmsTypeView> {

  var selectedGroup = -1;
  var selectedContact = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sh20,
            Center(child: Text("Whom do you\n want to alert?",style: h1.copyWith(fontSize: 32),textAlign: TextAlign.center,)),
            sh30,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Groups",
                  style: h2.copyWith(
                      fontSize: 20, color: AppColors.mainColor),
                ),
                Text(
                  "See all",
                  style:
                  h2.copyWith(fontSize: 18, color: AppColors.ash),
                ),
              ],
            ),
            sh10,
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 18.0,
                    mainAxisExtent: 80
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedGroup = index;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: selectedGroup == index? AppColors.mainColor :  AppColors.lowGray),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: Center(
                                  child: Text(
                                    "Family",
                                    style: h2.copyWith(fontSize: 14,color: selectedGroup == index? AppColors.white :  AppColors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        sh5,
                        selectedGroup == index?   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                             Get.to(() => SelectPetsView());
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors.green,
                                radius: 10,
                                child: Center(child: Icon(Icons.check,color: AppColors.white,size: 12,),),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                debugPrint("Close");
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors.mainColor,
                                radius: 10,
                                child: Center(child: Icon(Icons.close,color: AppColors.white,size: 12,),),
                              ),
                            ),
                          ],
                        ) : SizedBox()
                      ],
                    );
                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Contacts",
                  style: h2.copyWith(
                      fontSize: 20, color: AppColors.mainColor),
                ),
                Text(
                  "See all",
                  style:
                  h2.copyWith(fontSize: 18, color: AppColors.ash),
                ),
              ],
            ),
            sh10,
            Flexible(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 18.0,
                      mainAxisExtent: 70
                  ),
              //    physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.symmetric(horizontal: 15.0),
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                selectedContact = index!;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: selectedContact == index? AppColors.mainColor :  AppColors.lowGray),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 10),
                                child: Center(
                                  child: Text(
                                    "James",
                                    style: h2.copyWith(fontSize: 14,color: selectedContact == index? AppColors.white :  AppColors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        sh5,
                        selectedContact == index?   Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: (){
                                debugPrint("goooooooo");
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors.green,
                                radius: 10,
                                child: Center(child: Icon(Icons.check,color: AppColors.white,size: 12,),),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                debugPrint("Close");
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors.mainColor,
                                radius: 10,
                                child: Center(child: Icon(Icons.close,color: AppColors.white,size: 12,),),
                              ),
                            ),
                          ],
                        ) : SizedBox(),
                      ],
                    );
                  }
              ),
            ),
          ],
        ),
      )
    );
  }
}
