import 'package:felpus/app/common/helper/prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/common/services/other_service.dart';
import 'app/core/dependency_injection.dart';
import 'app/routes/app_pages.dart';

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
            initialRoute: AppPages.INITIAL,
            debugShowCheckedModeBanner: false,
            getPages: AppPages.routes,
          );
        }),
  );
}
