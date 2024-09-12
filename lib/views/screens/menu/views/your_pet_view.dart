import 'package:felpus/controllers/my_pet_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/views/components/CustomPopUP/pop_up.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/no_data.dart';
import 'package:felpus/views/screens/adoption/create_adoption_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/app_color/app_colors.dart';
import '../../../../utils/app_images/app_images.dart';
import '../../../../utils/app_text_style/styles.dart';
import 'create_update_lost_pet_view.dart';

class YourPetView extends StatefulWidget {
  const YourPetView({super.key});

  @override
  State<YourPetView> createState() => _YourPetViewState();
}

class _YourPetViewState extends State<YourPetView> {
  var selectedPet = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'Your Pet Cards'.tr,
          style: h2.copyWith(fontSize: 22, color: AppColors.mainColor),
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () => Get.back(), child: const Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<MyPetController>(
        builder: (controller) {
          return controller.isLoading
              ? const CustomLoader()
              : controller.myPetList.isEmpty
              ? const NoData()
              : Stack(
            children: [
              SizedBox(
                  height: Get.height,
                  width: Get.width,
                  child: Image.asset(AppImages.backgroundImage, fit: BoxFit.fill)),
              Container(
                width: Get.width,
                height: Get.height,
                color: AppColors.white.withOpacity(0.7),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.myPetList.length,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 18.0,
                    mainAxisExtent: 280, // Remove fixed height
                  ),
                  itemBuilder: (context, index) {
                    var petListItems = controller.myPetList[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPet = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          width: 158.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.olive,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CustomImage(
                                    imageSrc: petListItems.photo,
                                    imageType: ImageType.network,
                                    height: 120.h,
                                    width: 158.w,
                                  ),
                                ),
                                const SizedBox(height: 8), // Add some spacing
                                Wrap(
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${petListItems.petName}, ",
                                      style: h2.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: selectedPet == index
                                            ? AppColors.white
                                            : AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      petListItems.breed,
                                      style: h2.copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: selectedPet == index
                                            ? AppColors.white
                                            : AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4), // Add some spacing
                                Row(
                                  children: [
                                    Text(
                                      "${petListItems.sex.tr}, ",
                                      style: h4.copyWith(
                                        fontSize: 13,
                                        color: selectedPet == index
                                            ? AppColors.white
                                            : AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      "${petListItems.age} ${"Years".tr}.",
                                      style: h4.copyWith(
                                        fontSize: 13,
                                        color: selectedPet == index
                                            ? AppColors.white
                                            : AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4), // Add some spacing
                                Row(
                                  children: [
                                    Icon(
                                      CupertinoIcons.location_solid,
                                      color: selectedPet == index
                                          ? AppColors.white
                                          : AppColors.mainColor,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        width: 115.w,
                                        child: Text(
                                          petListItems.address,
                                          style: h5.copyWith(
                                            fontSize: 12,
                                            color: selectedPet == index
                                                ? AppColors.white
                                                : AppColors.black,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    petCardButton(
                      onTap: () {
                        if (controller.myPetList[selectedPet].forPets == "adopt") {
                          CreateAdoptionView.isUpdate = true;
                          CreateAdoptionView.petListDetails = controller.myPetList[selectedPet];
                          Get.to(() => const CreateAdoptionView());
                        } else {
                          CreateLostPetView.isUpdate = true;
                          CreateLostPetView.petListDetails = controller.myPetList[selectedPet];
                          Get.to(() => const CreateLostPetView());
                        }
                      },
                      tittle: "Update Your Pet Card".tr,
                      width: Get.width,
                      buttonColor: AppColors.light,
                      titleColor: AppColors.black,
                      height: 60,
                      icon: AppImages.refreshIcon,
                    ),
                    10.height,
                    petCardButton(
                      onTap: () {
                        PopUp.deleteItemsPopUp(onDelete: () {
                          controller.deleteMyPet(petId: controller.myPetList[selectedPet].id);
                        });
                      },
                      tittle: "Delete Your Pet Card".tr,
                      width: Get.width,
                      buttonColor: AppColors.light,
                      titleColor: AppColors.black,
                      height: 60,
                      icon: AppImages.deleteIcon,
                    ),
                    20.height,
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  GestureDetector petCardButton(
      {required VoidCallback onTap,
        required String tittle,
        required double height,
        required double width,
        required Color titleColor,
        required Color buttonColor,
        required String icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.3), // Shadow color
                spreadRadius: 0, // Spread radius
                blurRadius: 5, // Blur radius
                offset: const Offset(1, 2), // Offset in x and y
              ),
            ],
          ),
          child: Row(
            children: [
              30.width,
              Image.asset(
                icon,
                height: 24,
                width: 24,
              ),
              30.width,
              Center(
                child: Text(
                  tittle,
                  style: h2.copyWith(color: titleColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
