import 'package:felpus/helpers/prefs_helper.dart';
import 'package:felpus/services/ads_service.dart';
import 'package:felpus/services/location_service.dart';
import 'package:felpus/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'Languages/languages.dart';
import 'core/app_routes.dart';
import 'core/dependency_injection.dart';
import 'services/other_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OtherService.checkConnection();
  LocationService.locationPermission() ;
  SocketServices.connectToSocket();

  await dotenv.load(fileName: 'assets/.env');
  await PrefsHelper.getAllPrefData();
  DependencyInjection dI = DependencyInjection();
  dI.dependencies();
  await MobileAds.instance.initialize();
  AdsServices.loadBannerAd();

  runApp(
    ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Felpus",
            locale: Locale(PrefsHelper.localizationLanguageCode,
                PrefsHelper.localizationCountryCode),
            fallbackLocale: const Locale("en", "US"),
            translations: LocalConstants(),
            defaultTransition: Transition.noTransition,
            transitionDuration:  const Duration(milliseconds: 400),
            initialRoute: AppRoutes.splashView,
            getPages: AppRoutes.routes,
            // home: ProfileLocationView(),
          );
        }),
  );
}
