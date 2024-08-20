import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'core/dependency_injection.dart';
import 'helpers/prefs_helper.dart';
import 'services/other_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OtherService.checkConnection();

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
            title: "Felpus",
            // initialRoute: AppPages.INITIAL,
            debugShowCheckedModeBanner: false,
            // getPages: AppPages.routes,
          );
        }),
  );
}
