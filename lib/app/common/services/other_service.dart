
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../App_Utils/app_utils.dart';

class OtherService {
  static bool isFirst = true;

  static checkConnection() {
    Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
  }

  static checkInternet() async {
    print("Internet is checking");
    List<ConnectivityResult> connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      Utils.toastMessage(
          message: "You are currently offline", icon: Icons.wifi_off);
    } else {
      if (isFirst) {
        if (connectivityResult.contains(ConnectivityResult.none)) {
          Utils.toastMessage(
              message: "You are currently offline", icon: Icons.wifi_off);
        }
      } else {
        Utils.toastMessage(
            message: "Your internet connection is restored",
            icon: Icons.wifi);
      }
    }
    isFirst = false ;

  }
}
