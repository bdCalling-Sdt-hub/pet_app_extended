
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TermsAndServices extends StatelessWidget {
  const TermsAndServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: "Terms and Services".tr, fontWeight: FontWeight.w600, fontSize: 24,),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: Column(
          children: [

            CustomText(
              maxLines: 20,
                textAlign: TextAlign.justify,
                text: "By using Felpus, you agree to the following terms. We provide a platform connecting users to shelters and rescuers for pet rescue and adoption. You are responsible for providing accurate information and ensuring the well-being of pets. Felpus is not liable for the health, behavior, or actions of pets listed. Adoption and rescue processes are independent of Felpus. Any fees are clearly disclosed. Violation of these terms may result in account termination. Use of the app is subject to our Privacy Policy and local laws. \nContact us at [Contact Information] for inquiries."),
          ],
        ),
      ),
    );
  }
}
