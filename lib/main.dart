import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:metrocoffee/core/controllerbinding.dart';
import 'package:metrocoffee/core/routing/routes_handler.dart';
import 'package:metrocoffee/screens/authentication/change_password.dart';
import 'package:metrocoffee/screens/authentication/email_login.dart';
import 'package:metrocoffee/screens/authentication/login.dart';
import 'package:metrocoffee/screens/authentication/membershiplogin.dart';
// import 'package:metrocoffee/screens/authentication/membershiplogin.dart';
import 'package:metrocoffee/modules/home/base.dart';
import 'package:metrocoffee/screens/contents/homecontent/product_detail_page.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/all_menu.dart';
import 'package:metrocoffee/screens/contents/profilecontent/favorite_products.dart';
import 'package:metrocoffee/screens/contents/profilecontent/my_order.dart';
import 'package:metrocoffee/screens/contents/profilecontent/personal_data.dart';
import 'package:metrocoffee/modules/initial/splashscreen.dart';
import 'package:metrocoffee/screens/maps/map.dart';
import 'package:metrocoffee/modules/onboarding/onboardingscreen.dart';
// import 'package:metrocoffee/screens/initial/splashscreen.dart';
import 'package:metrocoffee/screens/sharables/checkout.dart';
import 'package:metrocoffee/screens/sharables/drink_detail.dart';
import 'package:metrocoffee/screens/sharables/order_details.dart';
import 'package:metrocoffee/screens/sharables/order_succesful_page.dart';
import 'package:metrocoffee/screens/sharables/payment_page.dart';
import 'package:metrocoffee/screens/sharables/product_detail.dart';
// import 'package:metrocoffee/theme.dart';
import 'GetXController/base/cartcontroller.dart';
import 'screens/authentication/register.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await setupLocator();
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
          initialRoute: '/',
          // home: SplashScreen(),
          routes: RouteHandler.getRoutes()),
    );
  }
}
