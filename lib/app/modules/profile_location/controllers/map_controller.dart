import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer' as print;

class MapController extends GetxController {
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
    searchText.value.addListener(() {
      onChange();
    });
    super.onInit();
  }

  // customMarker(
  //     {required String markerId,
  //     required double latitude,
  //     required double longitude,
  //     required String infoTitle,
  //     String? iconPath,
  //     double? width,
  //     double? height}) async {
  //   Marker(
  //       markerId: MarkerId(markerId),
  //       position: LatLng(latitude, longitude),
  //       infoWindow: InfoWindow(
  //         title: infoTitle,
  //       ),
  //       icon: await MarkerIcon.pictureAsset(
  //           assetPath: iconPath!, width: width!, height: height!));
  // }

  void onChange() {
    sessionToken ??= uuid.v4();
    getSuggestion(searchText.value.text);
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
    return await Geolocator.getCurrentPosition();
  }

  getCurrentLocation() {
    getUserCurrentLocation().then((value) async {
      updateLocation(value.latitude, value.longitude);
      print.log('My current location');
      print.log(
          "My Current Location:^^^^^^^^^^^^^^^^^^${value.latitude}, ${value.longitude}");
      marker.add(Marker(
          markerId: MarkerId("My location"),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: const InfoWindow(title: 'My current location')));
      final GoogleMapController controller = await googleMapController.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(kRandom));
    });
  }
}
