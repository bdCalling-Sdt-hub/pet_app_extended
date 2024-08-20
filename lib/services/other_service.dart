
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:developer' as print;

import '../utils/App_Utils/app_utils.dart';
import '../utils/app_color/app_colors.dart';

class OtherService {
  static bool isFirst = true;

  static checkConnection() {
    Connectivity().onConnectivityChanged.listen((event) {
      checkInternet();
    });
  }

  static checkInternet() async {
    print.log("Internet is checking");
    List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      Utils.showToastWithIcon("You are currently offline", FontAwesomeIcons.exclamationTriangle, AppColors.mainColor);
    } else {
      if (isFirst) {
        if (connectivityResult.contains(ConnectivityResult.none)) {
          Utils.showToastWithIcon("You are currently offline", FontAwesomeIcons.exclamationTriangle, AppColors.mainColor);
        }
      } else {
        Utils.showToastWithIcon("Your internet connection is restored", FontAwesomeIcons.wifi, AppColors.blue);
      }
    }
    isFirst = false ;

  }
}
