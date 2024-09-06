import 'package:dotted_border/dotted_border.dart';
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controllers/groups_n_contacts_controller.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../notifications/notifications_view.dart';
import 'create_group_view.dart';

class GroupsView extends GetView<GroupsNContactsController> {
  const GroupsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        title: Text('Groups'.tr, style: h2.copyWith(fontSize: 26, color: AppColors.mainColor)),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => const NotificationsView()),
            child: Image.asset(
              AppImages.notification,
              scale: 4,
            ),
          ),
          sw15,
          ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CustomImage(imageSrc: PrefsHelper.userImageUrl, imageType: ImageType.network, height: 40, width: 40)),
          sw10,
        ],
      ),
      body: GetBuilder<GroupsNContactsController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sh10,
              DottedBorder(
                color: AppColors.black,
                strokeWidth: 1,
                dashPattern: const [6, 6],
                borderType: BorderType.RRect,
                radius: const Radius.circular(10),
                child: GestureDetector(
                  onTap: () => Get.to(() => const CreateGroupView()),
                  child: Container(
                    height: 110,
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.add_circle, size: 50),
                        Text("Create a new Group".tr, style: h3, textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
              ),
              sh5,
              Text('Your Groups'.tr, style: h2.copyWith(fontSize: 20, color: AppColors.mainColor)),
              sh10,
              controller.isGettingGroups
                  ? SizedBox(
                height: 150.h,
                  child: CustomLoader())
                  : controller.groupsList.isEmpty
                  ? SizedBox(
                  height: 150.h, child: const NoData())
                  : SizedBox(
                height: 76,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.groupsList.length,
                    itemBuilder: (context, index) {
                      var groupItems = controller.groupsList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7.0),
                        child: Container(
                          height: 76.h,
                          width: 108.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), color: AppColors.olive),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  groupItems.groupName,
                                  style: h1.copyWith(fontSize: 14),
                                  maxLines: 1,
                                ),
                                Text(
                                  "${groupItems.participants.length} Members".tr,
                                  style: h3.copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              sh5,
              Text('Contacts'.tr, style: h2.copyWith(fontSize: 20, color: AppColors.mainColor)),
              sh10,
              controller.isLoading
                  ? SizedBox(
                height: 150.h,
                  child: const CustomLoader())
                  : controller.contactsList.isEmpty
                  ? SizedBox(
                height: 150.h,
                  child: const NoData())
                  : Flexible(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.contactsList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 18.0, mainAxisExtent: 45),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: controller.contactsList[index].phone.isEmpty
                            ? const SizedBox()
                            : InkWell(
                          onTap: () {
                            FlutterPhoneDirectCaller.callNumber(
                                controller.contactsList[index].phone);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25), color: AppColors.lowGray),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                              child: Center(
                                child: Text(
                                  controller.contactsList[index].fullName,
                                  style: h2.copyWith(fontSize: 14, color: AppColors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      }),
    );
  }
}
