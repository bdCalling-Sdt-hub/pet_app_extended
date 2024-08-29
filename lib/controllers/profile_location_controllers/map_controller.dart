import 'dart:async';
import 'dart:convert';
import 'package:felpus/controllers/complete_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer' as print;

import '../../utils/app_images/app_images.dart';


class MapController extends GetxController {


  static MapController get instance => Get.put(MapController());

  final Completer<GoogleMapController> googleMapController = Completer();

  final searchText = TextEditingController().obs;
  RxBool isSearched = false.obs;
  RxBool isTapped = false.obs;

  RxDouble userLatitude = 23.7814561.obs;
  RxDouble userLongitude = 90.4215143.obs;

  RxDouble targetLatitude = 0.0.obs;
  RxDouble targetLongitude = 0.0.obs;
  List<Marker> marker = [];
  List<Placemark> placeAddress = [];
  List<Location> locationCoOrdinates = [];
  CameraPosition? kGooglePlex;

  void updateLocation(double lat, double lng) {
    userLatitude.value = lat;
    userLongitude.value = lng;
  }

  void setTargetLocation(double lat, double lng) {
    print.log("++++++++++ Set Target Location+++++++++");
    targetLatitude.value = lat;
    targetLongitude.value = lng;
    print.log("${targetLatitude.value}, ${targetLongitude.value}");
  }

  CameraPosition get initialCameraPosition => CameraPosition(
        target: LatLng(userLatitude.value, userLongitude.value),
        zoom: 14.0,
      );

  CameraPosition get kRandom => CameraPosition(
      bearing: 180,
      target: isTapped.value
          ? LatLng(targetLatitude.value, targetLongitude.value)
          : LatLng(userLatitude.value, userLongitude.value),
      tilt: 59.440717697143555,
      zoom: 15);



  var uuid = const Uuid();
  String sessionToken = '112233';
  RxList placesList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getUserCurrentLocation().then((value) => getCurrentLocation(),);
    searchText.value.addListener(() {
      onChange();
    });
    super.onInit();
  }

  void onChange() {
    sessionToken ??= uuid.v4();
    getSuggestion(searchText.value.text);
  }

  Future<BitmapDescriptor> customMarkerImage(BuildContext context) async {
    return await BitmapDescriptor.asset(ImageConfiguration(devicePixelRatio: MediaQuery.of(context).devicePixelRatio),
      AppImages.icon, height: 40, width: 40);
  }

  setMarker({required LatLng latlng}) async {
    final BitmapDescriptor customMarker = await customMarkerImage(Get.context!);

    marker.add(
        Marker(
          markerId: const MarkerId('customMarker'),
          position: LatLng(latlng.latitude, latlng.longitude),
          icon: customMarker,
          infoWindow: const InfoWindow(title: "My current location"),
        )
    );
  }

  void getSuggestion(String inputText) async {
    String kPlacesApiKey = "AIzaSyDUjNaRwWEUbn__efy3duv9cFQak66jI4o";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$inputText&key=$kPlacesApiKey&sessiontoken= $sessionToken';

    var response = await http.get(Uri.parse(request));

    print.log(response.body.toString());
    if (response.statusCode == 200) {
      placesList.value = jsonDecode(response.body.toString())['predictions'];
    } else {
      print.log("--------------------- Error -------------------");
      throw Exception('Failed to load data');
    }
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print.log("Error ${error.toString()}");
    });
    print.log("============>>>${Geolocator.getCurrentPosition}");
    return await Geolocator.getCurrentPosition();
  }

  getCurrentLocation() {
    getUserCurrentLocation().then((value) async {
      kGooglePlex = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 14,
      );
      updateLocation(value.latitude, value.longitude);
      setMarker(latlng: LatLng(value.latitude, value.longitude));
      placeAddress = await placemarkFromCoordinates(value.latitude, value.longitude);

      print.log("My Current Location:>>>>>$placeAddress");

      String address = "${placeAddress.first.street}, ${placeAddress.first.locality}, ${placeAddress.first.subAdministrativeArea}, ${placeAddress.first.administrativeArea}, ${placeAddress.first.postalCode}";

      CompleteProfileController.instance.setLocation(address: address);
      final GoogleMapController controller = await googleMapController.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(kRandom));
    });
  }
}
