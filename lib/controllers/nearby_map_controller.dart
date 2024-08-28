import 'dart:async';
import 'dart:convert';
import 'package:felpus/services/location_service.dart';
import 'package:felpus/utils/app_images/app_images.dart';
import 'package:felpus/views/screens/nearby_map_screen/widget/address_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:developer' as print;

import 'package:http/http.dart' as http;


///============================ Nearby Search ========================

class ShowGoogleMapController extends GetxController {
  List<Marker> marker = [];
  static String searchForText = "vets";
  bool isMe = false;
  String markerAddress = "";
  bool isMarkerTapped = false;

  num latitude = 0;
  num longitude = 0;

  static ShowGoogleMapController get instance =>
      Get.put(ShowGoogleMapController());

  final Completer<GoogleMapController> controller =
  Completer<GoogleMapController>();

  CameraPosition? kGooglePlex;
  bool isCurrent = true;

  Future<BitmapDescriptor> customMarkerImage(BuildContext context) async {
    return await BitmapDescriptor.asset(
        ImageConfiguration(
            devicePixelRatio: MediaQuery.of(context).devicePixelRatio),
        isCurrent ? AppImages.icon : AppImages.shelterIcon,
        height: 40,
        width: 40);
  }

  /// ================== Set Marker Method =========================

  setMarker(LatLng latLng, String placeId, String address) async {
    final BitmapDescriptor customMarker = await customMarkerImage(Get.context!);
    Marker newMarker = Marker(
      onTap: () {
        if (placeId == '1') {
          isMe = true;
          update();
        } else {
          isMe = false;
          update();
        }
        markerAddress = address;
        isMarkerTapped = true;
        update();
      },
      infoWindow: InfoWindow(title: address.split(",")[0]),
      icon: customMarker,
      markerId: MarkerId(placeId), // Use a unique MarkerId for each marker
      position: LatLng(latLng.latitude, latLng.longitude),
    );

    marker.add(newMarker);
    update();
  }

  setMarkerTappedFalse() {
    isMarkerTapped = false;
    update();
  }

  ///=================== Get Current Location Method ====================
  bool isLoading = false;

  getCurrentLocation() async {
    isLoading = true;
    update();

    Position? positions = await LocationService.getCurrentPosition();
    if (positions != null) {
      latitude = positions.latitude;
      longitude = positions.longitude;

      List<Placemark> myCurrentLocation =
      await placemarkFromCoordinates(positions.latitude, positions.longitude);

      setMarker(
          LatLng(positions.latitude, positions.longitude),
          '1',
          "${myCurrentLocation.last.street},${myCurrentLocation.last.locality},${myCurrentLocation.last.subLocality}");

      kGooglePlex = CameraPosition(
        target: LatLng(positions.latitude, positions.longitude),
        zoom: 14,
      );

      CameraPosition newCameraPosition = CameraPosition(
          target: LatLng(positions.latitude, positions.longitude), zoom: 14);

      List<AddressModel> shelters =
      await searchPetShelters(searchForText, positions);

      isCurrent = false;
      update();
      for (var shelter in shelters) {
        setMarker(LatLng(shelter.latitude, shelter.longitude), shelter.placeId,
            "${shelter.mainText},${shelter.description}");
      }

      isLoading = false;
      update();

      final GoogleMapController googleMapController = await controller.future;
      await googleMapController
          .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
      update();
    }
  }

  ///<<<===================== Query Based Nearby Search =====================>>>

  Future<List<AddressModel>> searchPetShelters(
      String query, Position position) async {
    var apiKey = 'AIzaSyBT1HkkjBVBLJVm0pWHdj6WcG_gnUmaoaE';
    var url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${position.latitude},${position.longitude}&radius=5000&keyword=$query&key=$apiKey';

    var response = await http.get(Uri.parse(url)).timeout(
      const Duration(seconds: 30),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List results = data['results'];

      List<AddressModel> addresses = [];
      for (var result in results) {
        var address = AddressModel(
          description: result['vicinity'],
          placeId: result['place_id'],
          mainText: result['name'],
          secondaryText: result['vicinity'],
          types: List<String>.from(result['types'] ?? []),
          latitude: result['geometry']['location']['lat'],
          longitude: result['geometry']['location']['lng'],
        );
        addresses.add(address);
      }

      return addresses;
    } else {
      throw Exception('Failed to load suggestions');
    }
  }

  @override
  void onInit() {
    getCurrentLocation();
    super.onInit();
  }
}

class AddressModel {
  final String description;
  final String placeId;
  final String mainText;
  final String secondaryText;
  final List<String> types;
  final double latitude;
  final double longitude;

  AddressModel({
    required this.description,
    required this.placeId,
    required this.mainText,
    required this.secondaryText,
    required this.types,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      description: json['vicinity'] ?? '',
      placeId: json['place_id'] ?? '',
      mainText: json['name'] ?? '',
      secondaryText: json['vicinity'] ?? '',
      types: List<String>.from(json['types'] ?? []),
      latitude: json['geometry']['location']['lat'] ?? 0.0,
      longitude: json['geometry']['location']['lng'] ?? 0.0,
    );
  }
}


///============================ Auto Complete Search ========================


// class ShowGoogleMapController extends GetxController {
//   List<Marker> marker = [];
//   String searchForText = "pets shelter";
//   bool isMe = false;
//   String markerAddress = "" ;
//   bool isMarkerTapped = false ;
//
//   num latitude = 0;
//   num longitude = 0;
//
//   static ShowGoogleMapController get instance =>
//       Get.put(ShowGoogleMapController());
//
//   final Completer<GoogleMapController> controller =
//       Completer<GoogleMapController>();
//
//   CameraPosition? kGooglePlex;
//   bool isCurrent = true;
//
//   Future<BitmapDescriptor> customMarkerImage(BuildContext context) async {
//     return await BitmapDescriptor.asset(
//         ImageConfiguration(
//             devicePixelRatio: MediaQuery.of(context).devicePixelRatio),
//         isCurrent? AppImages.icon : AppImages.shelterIcon,
//         height: 40,
//         width: 40);
//   }
//
//   /// ================== Set Marker Method =========================
//
//   setMarker(LatLng latLng, String placeId, String address) async {
//     final BitmapDescriptor customMarker = await customMarkerImage(Get.context!);
//     Marker newMarker = Marker(
//       onTap: () {
//         if(placeId == '1'){
//           isMe = true;
//           update();
//         }else{
//           isMe = false;
//           update();
//         }
//         markerAddress = address;
//         isMarkerTapped = true;
//         update();
//       },
//         infoWindow:  InfoWindow( title: address.split(",")[0]),
//         icon: customMarker,
//         markerId: MarkerId(placeId), // Use a unique MarkerId for each marker
//         position: LatLng(latLng.latitude, latLng.longitude));
//
//     marker.add(newMarker);
//     update();
//   }
//
//   setMarkerTappedFalse(){
//     isMarkerTapped = false;
//     update();
//   }
//
//   ///=================== Get Current Location Method ====================
//   bool isLoading = false;
//
//   getCurrentLocation() async {
//     isLoading = true;
//     update();
//
//     print.log("Current location is called-1");
//     Position? positions = await LocationService.getCurrentPosition();
//     if (positions != null) {
//       latitude = positions.latitude;
//       longitude = positions.longitude;
//
//       List<Placemark> myCurrentLocation = await placemarkFromCoordinates(positions.latitude, positions.longitude);
//
//       setMarker(LatLng(positions.latitude, positions.longitude), '1', "${myCurrentLocation.last.street},${myCurrentLocation.last.locality},${myCurrentLocation.last.subLocality}");
//
//       kGooglePlex = CameraPosition(
//         target: LatLng(positions.latitude, positions.longitude),
//         zoom: 14,
//       );
//       print.log("Current location is called-2");
//       CameraPosition newCameraPosition = CameraPosition(target: LatLng(positions.latitude, positions.longitude), zoom: 14);
//
//       List<AddressModel> shelters = await searchPetShelters(searchForText, positions);
//
//       isCurrent = false;
//       update();
//       for (var shelter in shelters) {
//         setMarker(LatLng(shelter.latitude, shelter.longitude), shelter.placeId, "${shelter.mainText},${shelter.description}");
//         print.log('Address >>>>><<<<<: ${shelter.mainText},${shelter.description}');
//         print.log('Latitude >>>>><<<<<: ${shelter.latitude}');
//         print.log('Longitude >>>>><<<<<: ${shelter.longitude}');
//       }
//       isLoading = false;
//       update();
//
//       final GoogleMapController googleMapController = await controller.future;
//       await googleMapController.animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
//       update();
//     }
//
//   }
//
//   ///<<<===================== Query Based Nearby Search =====================>>>
//
//   Future<List<AddressModel>> searchPetShelters(String query, Position position) async {
//
//     var apiKey = 'AIzaSyBT1HkkjBVBLJVm0pWHdj6WcG_gnUmaoaE';
//     // var url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${position.latitude},${position.longitude}&radius=5000&type=shelter&keyword=$query&key=$apiKey';
//     var url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$query&location=${position.latitude},${position.longitude}&radius=5000&key=$apiKey';
//
//     var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       List predictions = data['predictions'];
//
//       List<AddressModel> addresses = [];
//       for (var prediction in predictions) {
//         // Fetch lat & lng using Place Details API
//         var placeId = prediction['place_id'];
//         var address = await getLatLngFromPlaceId(placeId);
//         addresses.add(address);
//       }
//
//       return addresses;
//     } else {
//       throw Exception('Failed to load suggestions');
//     }
//   }
//
//
//   Future<AddressModel> getLatLngFromPlaceId(String placeId) async {
//     var apiKey = 'AIzaSyBT1HkkjBVBLJVm0pWHdj6WcG_gnUmaoaE';
//     var url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';
//
//     var response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       var result = data['result'];
//
//       return AddressModel(
//         description: result['formatted_address'],
//         placeId: placeId,
//         mainText: result['name'],
//         secondaryText: result['formatted_address'],
//         types: List<String>.from(result['types'] ?? []),
//         latitude: result['geometry']['location']['lat'],
//         longitude: result['geometry']['location']['lng'],
//       );
//     } else {
//       throw Exception('Failed to load place details');
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
// }
//
// class AddressModel {
//   final String description;
//   final String placeId;
//   final String mainText;
//   final String secondaryText;
//   final List<String> types;
//   final double latitude;
//   final double longitude;
//
//   AddressModel({
//     required this.description,
//     required this.placeId,
//     required this.mainText,
//     required this.secondaryText,
//     required this.types,
//     required this.latitude,
//     required this.longitude,
//   });
//
//   factory AddressModel.fromJson(Map<String, dynamic> json) {
//     return AddressModel(
//       description: json['description'] ?? '',
//       placeId: json['place_id'] ?? '',
//       mainText: json['structured_formatting']['main_text'] ?? '',
//       secondaryText: json['structured_formatting']['secondary_text'] ?? '',
//       types: List<String>.from(json['types'] ?? []),
//       latitude: json['geometry']['location']['lat'] ?? 0.0,
//       longitude: json['geometry']['location']['lng'] ?? 0.0,
//     );
//   }
// }


