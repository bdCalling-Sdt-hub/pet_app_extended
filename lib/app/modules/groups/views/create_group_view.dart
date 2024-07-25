import 'dart:io';

import 'package:felpus/app/common/size_box/custom_sizebox.dart';
import 'package:felpus/app/common/widgets/custom_button.dart';
import 'package:felpus/app/common/widgets/custom_textfelid.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/app_color/app_colors.dart';
import '../../../common/app_images/app_images.dart';
import '../../../common/app_text_style/styles.dart';
import '../../../common/helper/image_picker.dart';

class CreateGroupView extends StatefulWidget {
   CreateGroupView({super.key});

  @override
  State<CreateGroupView> createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<CreateGroupView> {
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());
  final List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4','Item 1',
    'Item 2',
    'Item 3',
    'Item 4',

  ];

  final Map<int, bool> _selectedItems = {};
  void _printSelectedIndices() {
    final selectedIndices = _selectedItems.entries
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
        title:  Text('Create Group',style: h2.copyWith(fontSize: 26,color: AppColors.mainColor),),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Group Name",style: h2.copyWith(fontSize: 18),)),
            sh5,
            Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.grayLight)
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: h2
                  ),
                ),
              ),
            ),
            sh10,
            Center(child: Text("Upload Group Image",style: h2.copyWith(fontSize: 18),)),
            sh5,
            Obx(() =>   imagePickerController.selectedImagePath.value == ''? GestureDetector(
              onTap: () {
                imagePickerController.pickImage(ImageSource.gallery);
              },
              child: Container(
                height: 110,
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.gray,style: BorderStyle.solid,width: 1)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.photo,scale: 4,color: AppColors.black,),
                    Text("Upload a picturefor your group",style: h3,textAlign: TextAlign.center,)

                  ],
                ),
              ),
            ): GestureDetector(
              onTap: () {
                imagePickerController.pickImage(ImageSource.gallery);
              },
              child: Container(
                  height: 110,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.gray,style: BorderStyle.solid,width: 1)
                  ),
                  child: ClipOval(child: Image.file(File(imagePickerController.selectedImagePath.value)))
              ),
            ),),
            sh10,
            Center(child: Text("Add Members",style: h2.copyWith(fontSize: 18),)),
            sh5,
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: Get.width,
                height: 45,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search Your Contacts",
                    hintStyle: h4.copyWith(color: AppColors.grayLight),
                    prefixIcon: Icon(Icons.search,color: AppColors.grayLight,)
                  ),
                ),
              ),

            ),
            sh10,
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.grayLight.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppImages.boy,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedItems[index] = !(_selectedItems[index] ?? false);
                        });
                      },
                      child: Container(
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
                            decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color: _selectedItems[index] ?? false ? AppColors.mainColor : Colors.transparent,
                            ),
                            child: SizedBox(
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
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Container(
          width: Get.width,
          color: AppColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(title: "Cancel", width: Get.width / 2.8, color: AppColors.light,titleColor: AppColors.black,),
              CustomButton(ontap: (){
                _printSelectedIndices();
              },title: "Create Group", width: Get.width / 2.8, color: AppColors.mainColor),
            ],
          ),
        ),
      ),
    );
  }
}
