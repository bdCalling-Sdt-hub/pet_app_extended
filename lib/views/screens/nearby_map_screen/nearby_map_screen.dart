
import 'package:felpus/controllers/nearby_map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyMapScreen extends StatefulWidget {
  NearbyMapScreen( {super.key,
    this.latitude = 0,
    this.longitude = 0,
    this.onTapLatLong});

  final double latitude;

  final double longitude;
  Function(LatLng value)? onTapLatLong;

  @override
  State<NearbyMapScreen> createState() => _NearbyMapScreenState();
}

class _NearbyMapScreenState extends State<NearbyMapScreen> {
  ShowGoogleMapController showGoogleMapController =
  Get.put(ShowGoogleMapController());

  @override
  void initState() {
    // TODO: implement initState
    showGoogleMapController.getCurrentLocation();
    super.initState();
  }

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
            if(widget.onTapLatLong != null){
              widget.onTapLatLong!(latLng);
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
