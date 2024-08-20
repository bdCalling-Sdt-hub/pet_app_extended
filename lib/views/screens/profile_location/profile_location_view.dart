
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/controllers/profile_location_controllers/map_controller.dart';
import 'package:felpus/controllers/profile_location_controllers/profile_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:developer' as print;
import '../../../controllers/complete_profile_controller.dart';
import '../../../helpers/image_picker.dart';
import '../../../utils/app_color/app_colors.dart';
import '../../../utils/app_images/app_images.dart';
import '../../../utils/app_text_style/styles.dart';
import '../../../utils/size_box/custom_sizebox.dart';
import '../../../views/components/custom_auth_appbar.dart';
import '../../../views/components/custom_button.dart';
import '../../../views/components/custom_textfelid.dart';
import '../dashboard/dashboard_view.dart';



class ProfileLocationView extends GetView<ProfileLocationController> {
  ProfileLocationView({super.key});

  final CompleteProfileController completeProfileController = Get.put(CompleteProfileController());
  final ImagePickerController imagePickerController = Get.put(ImagePickerController());
  final MapController mapController = Get.put(MapController());
  String mapTheme = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: CustomAuthAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              sh20,
              Center(
                child: Column(
                  children: [
                    Text("Add Your",style:  h3.copyWith(fontSize: 30,),textAlign: TextAlign.center,),
                    Text("Location.",style:  h3.copyWith(fontSize: 30,color: AppColors.mainColor),textAlign: TextAlign.center,),
                    sh5,
                    Text("You can edit this later in your account setting.",style:  h4,textAlign: TextAlign.center,),
                  ],
                ),
              ),
              sh15,
              Container(
                // padding: EdgeInsets.symmetric(horizontal: 20),
                height: 350,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24)
                ),
                child: Obx(() => GoogleMap(
                  initialCameraPosition: mapController.initialCameraPosition,
                  compassEnabled: true,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  markers: Set<Marker>.of(mapController.marker),
                  onMapCreated: (GoogleMapController controller) {
                    controller.setMapStyle(mapTheme);
                    mapController.googleMapController.complete(controller);
                  },
                  onCameraMove: (CameraPosition position){
                    print.log("Camera position is moving: ${position.target.latitude}, ${position.target.longitude}################");
                    mapController.updateLocation(
                        position.target.latitude, position.target.longitude
                    );
                  },
                  onTap: (LatLng latlng) async{
                    mapController.isTapped.value = true;
                    mapController.setTargetLocation(latlng.latitude, latlng.longitude);
                    mapController.placeAddress = await placemarkFromCoordinates(latlng.latitude, latlng.longitude);

                    var tappedAddress = mapController.placeAddress;

                    final BitmapDescriptor customMarker = await mapController.customMarkerImage(Get.context!);

                    mapController.marker.add(
                        Marker(
                          markerId: const MarkerId('customMarker'),
                          position: LatLng(latlng.latitude, latlng.longitude),
                          icon: customMarker,
                          infoWindow: InfoWindow(
                              title: "${tappedAddress.first.subLocality}: ${latlng.latitude}, ${latlng.longitude}"
                          ),
                        )
                    );

                    final GoogleMapController controller = await mapController.googleMapController.future;
                    await controller.animateCamera(CameraUpdate.newCameraPosition(mapController.kRandom));

                    String address = "${tappedAddress.first.street}, ${tappedAddress.last.subLocality}, ${tappedAddress.last.locality}, ${tappedAddress.last.postalCode}";
                    completeProfileController.setLocation(address: address);

                    print.log("==============Map Tapped Here: ${mapController.placeAddress} ====================");
                    mapController.isTapped.value = false;
                  },
                ),),
              ),
              sh5,
              Text("Select on map",style:  h4,textAlign: TextAlign.center,),
              CustomTextField(
                controller: completeProfileController.locationController,
                title: "", width: Get.width,hintText: "Location details", preIcon: const Icon(Icons.location_on, color: AppColors.hintColor,),),
              sh10,
              completeProfileController.isLoading? const CustomLoader():
              CustomButton(onTap: () {
                completeProfileController.updateProfileRepo();
                },title: "Next", width: Get.width, color: AppColors.mainColor,),
              sh10,

            ],
          ),
        )
    );
  }

  ///<<<========================= Bottom Modal Sheet ========================>>>
  static void showCustomBottomSheet() {
    Get.bottomSheet(
      Container(
        width: Get.width,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(70),topRight: Radius.circular(70)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              sh10,
              Container(
                height: 2,
                width: 100,
                color: AppColors.grayLight,
              ),
              Image.asset(AppImages.success,scale: 4,),
              sh10,
              Text("Your Account Has Been",style:  h3.copyWith(fontSize: 26,),textAlign: TextAlign.center,),
              Text("Successfully Completed.",style:  h3.copyWith(fontSize: 26,color: AppColors.mainColor),textAlign: TextAlign.center,),
              sh50,
              CustomButton(
                  onTap: () => Get.to(() => DashboardView()),
                  title: "Finish",
                  width: Get.width,
                  color: AppColors.mainColor,
              ),
              sh10,
            ],
          ),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      isDismissible: true,
    );
  }
}
