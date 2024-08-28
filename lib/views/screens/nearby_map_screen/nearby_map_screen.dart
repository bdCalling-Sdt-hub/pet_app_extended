
import 'package:felpus/controllers/nearby_map_controller.dart';
import 'package:felpus/extensions/extension.dart';
import 'package:felpus/utils/app_color/app_colors.dart';
import 'package:felpus/utils/app_images/app_images.dart';
import 'package:felpus/views/components/custom_image.dart';
import 'package:felpus/views/components/custom_loader.dart';
import 'package:felpus/views/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyMapScreen extends StatelessWidget {
  NearbyMapScreen( {super.key,
    this.latitude = 0,
    this.longitude = 0,
    this.onTapLatLong});

  final double latitude;

  final double longitude;
  Function(LatLng value)? onTapLatLong;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowGoogleMapController>(
      builder: (controller) {

        return Scaffold(
          body:  controller.isLoading? const CustomLoader() : Column(
            children: [
              Expanded(
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: controller.kGooglePlex ??
                      const CameraPosition(
                        target: LatLng(37.42796133580664, -122.085749655962),
                        zoom: 14,
                      ),
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  cameraTargetBounds: CameraTargetBounds.unbounded,
                  onTap: (LatLng latLng) {
                    if(onTapLatLong != null){
                      onTapLatLong!(latLng);
                    }
                    controller.setMarkerTappedFalse();
                    // controller.setMarker(latLng);
                  },
                  markers: Set<Marker>.of(controller.marker),
                  onMapCreated: (GoogleMapController googleMapController) {
                    controller.controller.complete(googleMapController);
                  },
                ),
              ),
              controller.isMarkerTapped?
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 8.h),
                width: Get.width,
                decoration: const BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24))
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomImage(imageSrc: controller.isMe? AppImages.icon : AppImages.shelterIcon, imageType: ImageType.png, imageColor: AppColors.white, height: 40, width: 40,),
                    8.width,
                    Expanded(child: CustomText(text: controller.markerAddress, color: AppColors.white, fontSize: 18, fontWeight: FontWeight.w600,))

                  ],
                ),
              ) : const SizedBox()
            ],
          ),
        );
      },
    );
  }
}
