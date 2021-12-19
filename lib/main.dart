import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:metrocoffee/core/controller_binding.dart';
import 'package:metrocoffee/ui/app_name.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'core/locator.dart';
import 'core/routing/routes.dart';
import 'core/routing/routes_handler.dart';

void mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: ControllerBinding(),
        title: metrocoffee,
        theme: ThemeData(
          primarySwatch: MetroColor.coffee,
          brightness: Brightness.light,
          fontFamily: CustomFont.poppinsRegular,
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 42.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: CustomFont.freightDispBold,
            ),
            button: TextStyle(
              fontFamily: CustomFont.poppinsRegular,
              fontSize: 15.sp,
              color: Colors.black,
            ),
            bodyText1:
                TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
            bodyText2:
                TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
            caption: TextStyle(
              fontFamily: CustomFont.poppinsLight,
              color: Color(0xF3F3F3D6),
              fontSize: 11.5.sp,
            ),
          ),
        ),
        getPages: PageNameHandler.getPages(),
        initialRoute: PageName.splashscreenpage,
      ),
    );
  }
}
