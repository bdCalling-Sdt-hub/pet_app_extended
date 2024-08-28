import 'package:felpus/services/location_service.dart';
import 'package:felpus/views/screens/nearby_map_screen/nearby_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/app_routes.dart';
import 'core/dependency_injection.dart';
import 'helpers/prefs_helper.dart';
import 'services/other_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OtherService.checkConnection();
  LocationService.locationPermission() ;

  await dotenv.load(fileName: 'assets/.env');
  await PrefsHelper.getAllPrefData();
  DependencyInjection dI = DependencyInjection();
  dI.dependencies();

  runApp(
    ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Felpus",
            defaultTransition: Transition.noTransition,
            transitionDuration:  const Duration(milliseconds: 400),
            initialRoute: AppRoutes.splashView,
            getPages: AppRoutes.routes,
            // home: NearbyMapScreen(),
          );
        }),
  );
}
