import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_it/get_it.dart';
import 'package:metrocoffee/core/controllerbinding.dart';
import 'package:metrocoffee/modules/maps/new/google_map_page.dart';
import 'package:metrocoffee/modules/maps/new/widgets/map_widgets.dart';
import 'package:metrocoffee/ui/app_name.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import 'core/locator.dart';
import 'core/routing/names.dart';
import 'core/routing/routes_handler.dart';
import 'modules/maps/new/google_map_controller.dart';

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

        initialRoute: PageName.splashscreenpage,
        // home: Test(),
        routes: RouteHandler.getRoutes(),
      ),
    );
  }
}

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final controller = Get.put(CustomGoogleMapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.h,
              width: 375.w,
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    itemCount: controller.userAddresses.length,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    itemBuilder: (context, index) {
                      var admodel = controller.userAddresses[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16.h),
                        child: AddressDetailWidget(
                          mainLocation: admodel.title,
                          subLocation: admodel.subtitle,
                          onDelete: () {},
                          onItemSelected: 0,
                          onEdit: () {
                            Get.to(() => GoogleMapPage(
                                initialLat: admodel.mapLocation.lat,
                                initialLong: admodel.mapLocation.long));
                          },
                        ),
                      );
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}
