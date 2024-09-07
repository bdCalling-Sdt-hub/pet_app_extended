
import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/utils/app_color/app_colors.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends StatelessWidget {
  ChangeLanguageScreen({super.key});

  final List locale = [
    {"name": "es", "countryCode": "ES", "locale": const Locale("es", "ES")},
    {"name": "en", "countryCode": "US", "locale": const Locale("en", "US")},
  ];

  List languageList = [
    "Spanish",
    "English",
  ];
  RxInt selectedItem = 0.obs;
  updateLanguage(Locale locale) {
    Get.updateLocale(locale);
  }


  @override
  Widget build(BuildContext context) {
    selectedItem.value = PrefsHelper.localizationCountryCode == "US" ? 0 : 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  CustomText(
                    text: "Change Language".tr,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                  SizedBox(width: 30.w),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  children: List.generate(
                    languageList.length,
                        (index) {
                      return GestureDetector(
                        onTap: () {
                          selectedItem.value = index;
                          PrefsHelper.localizationCountryCode = locale[index]["countryCode"];
                          PrefsHelper.localizationLanguageCode = locale[index]["name"];
                          Get.updateLocale(locale[index]["locale"]);
                          PrefsHelper.setString(
                              "localizationLanguageCode", PrefsHelper.localizationLanguageCode);
                          PrefsHelper.setString(
                              "localizationCountryCode", PrefsHelper.localizationCountryCode);


                          if (kDebugMode) {
                            print(
                                "Language is: >>>>> ${locale[index]["name"]}, ${locale[index]["locale"]}");
                          }
                        },
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(.2),
                                      width: 1),
                                  color: index == selectedItem.value
                                      ? AppColors.blue
                                      : AppColors.white,
                                ),
                              ),
                              CustomText(
                                text: languageList[index],
                                color: AppColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
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
            ],
          ),
        ),
      ),
    );
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