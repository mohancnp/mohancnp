import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:metrocoffee/core/controllerbinding.dart';
import 'package:metrocoffee/core/routing/routes_handler.dart';

import 'core/locator.dart';
import 'core/routing/names.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
    statusBarIconBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
//        smartManagement: SmartManagement.keepFactory,
          debugShowCheckedModeBanner: false,
          initialBinding: ControllerBinding(),
          title: 'Metro Coffee',
          theme: ThemeData(
            primarySwatch: Colors.brown,
          ),
          initialRoute: PageName.splashscreenpage,
          // home: SplashScreen(),
          routes: RouteHandler.getRoutes()),
    );
  }
}
