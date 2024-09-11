
import 'package:felpus/controllers/groups_n_contacts_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/utils/app_color/app_colors.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AllContactsView extends StatelessWidget {
  const AllContactsView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
            child: Icon(Icons.arrow_back_ios)),
        title: CustomText(text: "All Contacts".tr, color: AppColors.mainColor, fontSize: 26, fontWeight: FontWeight.w600,),
      ),
      body: GetBuilder<GroupsNContactsController>(builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView.builder(
            itemCount: controller.contactsList.length,
            itemBuilder: (context, index) {
              var contactListItem = controller.contactsList[index];
              return Row(
                children: [
                  const Icon(Icons.account_circle, size: 28, color: AppColors.black,),
                  12.width,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: contactListItem.fullName, fontWeight: FontWeight.w600, fontSize: 16,),
                        CustomText(text: contactListItem.phone, color: AppColors.textColor,),
                      ],
                    ),
                  ),
                  IconButton(onPressed: () {
                    // makePhoneCall(controller.contactsList[index].phone);
                    FlutterPhoneDirectCaller.callNumber(controller.contactsList[index].phone);
                  }, icon: Icon(Icons.phone_outlined, size: 26,)),

                ],
              );
            },),
        );
      },),
    );
  }
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }
}
