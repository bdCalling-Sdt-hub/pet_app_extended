
import 'package:felpus/controllers/nearby_map_controller.dart';
import 'package:flutter/material.dart';
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

  ShowGoogleMapController showGoogleMapController =
  Get.put(ShowGoogleMapController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShowGoogleMapController>(
      builder: (controller) {
        return GoogleMap(
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
            // controller.setMarker(latLng);
          },
          markers: Set<Marker>.of(controller.marker),
          onMapCreated: (GoogleMapController googleMapController) {
            controller.controller.complete(googleMapController);
          },
        );
      },
    );
  }
}
