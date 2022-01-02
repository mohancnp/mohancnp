import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/util/internet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  String noInernetMsg =
      "No Internet Connection Found,please restore your internet and try again";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      appBar: AppBar(
        title: Text(
          "Metro Coffee",
          style: TextStyle(color: Palette.darkGery),
        ),
        elevation: 1,
        backgroundColor: Palette.pagebackgroundcolor,
        // centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/no-wifi.png',
              height: 100.w,
              width: 100.w,
              color: Palette.deepOrange,
            ),
            SizedBox(height: 50.h),
            Text(
              noInernetMsg,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    color: Palette.darkGrey1.withOpacity(0.8),
                    fontSize: 15.sp,
                  ),
            ),
            SizedBox(height: 50.h),
            Center(
              child: MaterialButton(
                onPressed: () async {
                  var ready =
                      await InternetConnectionHelper.isConnectionReady();
                  if (ready) {
                    Get.offAllNamed(PageName.splashscreenpage);
                  }
                },
                color: Palette.deepOrange,
                child: const Text("tap to refresh"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
