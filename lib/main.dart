import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:metrocoffee/core/controllerbinding.dart';
import 'package:metrocoffee/modules/home/widgets/searchbar.dart';
import 'package:metrocoffee/search_bar_test.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/locator.dart';
import 'core/routing/names.dart';
import 'core/routing/routes_handler.dart';

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
    return ResponsiveSizer(builder: (context, orientation, screenTYpe) {
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
          // home: Test(),
          routes: RouteHandler.getRoutes(),
        ),
      );
    });
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SearchBarTest(),
          SearchBar(),
        ],
      ),
    );
  }
}
