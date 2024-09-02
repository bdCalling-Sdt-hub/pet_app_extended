import 'dart:io';
import 'package:felpus/controllers/groups_n_contacts_controller.dart';
import 'package:felpus/views/components/custom_button.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as print;

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../helpers/image_picker.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';

class CreateGroupView extends StatefulWidget {
  const CreateGroupView({super.key});

  @override
  State<CreateGroupView> createState() => _CreateGroupViewState();
}

class _CreateGroupViewState extends State<CreateGroupView> {
  final ImagePickerController imagePickerController =
  Get.put(ImagePickerController());

  final Map<int, bool> _selectedItems = {};

  void _printSelectedIndices() {
    final selectedIndices = _selectedItems.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
    print.log('Selected indices: $selectedIndices');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupsNContactsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Text(
              'Create Group'.tr,
              style: h2.copyWith(fontSize: 26, color: AppColors.mainColor),
            ),
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
                Center(
                    child: Text(
                      "Group Name".tr,
                      style: h2.copyWith(fontSize: 18),
                    )),
                sh5,
                Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.grayLight)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: controller.groupNameController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintStyle: h2),
                    ),
                  ),
                ),
                sh10,
                Center(
                    child: Text(
                      "Upload Group Image".tr,
                      style: h2.copyWith(fontSize: 18),
                    )),
                sh5,
                Obx(
                      () => imagePickerController.selectedImagePath.value == ''
                      ? GestureDetector(
                    onTap: () {
                      imagePickerController
                          .pickImage(ImageSource.gallery);
                    },
                    child: Container(
                      height: 110,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.gray,
                              style: BorderStyle.solid,
                              width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.photo,
                            scale: 4,
                            color: AppColors.black,
                          ),
                          Text(
                            "Upload a picture for your group".tr,
                            style: h3,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  )
                      : GestureDetector(
                    onTap: () {
                      imagePickerController
                          .pickImage(ImageSource.gallery);
                    },
                    child: Container(
                        height: 110,
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColors.gray,
                                style: BorderStyle.solid,
                                width: 1)),
                        child: ClipOval(
                            child: Image.file(File(imagePickerController
                                .selectedImagePath.value)))),
                  ),
                ),
                sh10,
                Center(
                    child: Text(
                      "Add Members".tr,
                      style: h2.copyWith(fontSize: 18),
                    )),
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
                      controller: controller.searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Your Contacts".tr,
                        hintStyle: h4.copyWith(color: AppColors.grayLight),
                        prefixIcon: const Icon(Icons.search,
                            color: AppColors.grayLight),
                      ),
                      onChanged: (value) {
                        Get.find<GroupsNContactsController>()
                            .filterContacts(value);
                      },
                    ),
                  ),
                ),
                sh10,
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.filteredContacts.length,
                    itemBuilder: (context, index) {
                      var contact = controller.filteredContacts[index];
                      return contact.phone.isEmpty
                          ? const SizedBox()
                          : ListTile(
                        title: Text(contact.fullName),
                        leading: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColors.grayLight.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: CustomImage(
                              imageSrc: contact.photo,
                              imageType: ImageType.network,
                            ),
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            if (_selectedItems[index] ?? false) {
                              controller.selectedContacts.remove(contact.id);
                            } else {
                              controller.selectedContacts.add(contact.id);
                            }

                            print.log(
                                "Selected Contacts : ${controller.selectedContacts}");
                            setState(() {
                              _selectedItems[index] =
                              !(_selectedItems[index] ?? false);
                              print.log("$_selectedItems");
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
                                  shape: const CircleBorder(),
                                  color: _selectedItems[index] ?? false
                                      ? AppColors.mainColor
                                      : Colors.transparent,
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
                  CustomButton(
                    title: "Cancel".tr,
                    width: Get.width / 2.8,
                    color: AppColors.light,
                    titleColor: AppColors.black,
                  ),
                  controller.isLoading
                      ? const CustomLoader()
                      : CustomButton(
                      onTap: () {
                        controller.createGroupRepo();
                        _printSelectedIndices();
                      },
                      title: "Create Group".tr,
                      width: Get.width / 2.8,
                      color: AppColors.mainColor),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
