import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/icons/socials.dart';
import 'package:metrocoffee/core/constants/placeholder.dart';
import 'package:metrocoffee/core/routing/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            loginBackgroundImage,
            width: 375.w,
            //TODO: remove width by checking
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Column(
              //TODO: try using stretch
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 148.h),
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.4),
                  ),
                  child: Image.asset(
                    AppConfig.metroCoffeeLogoAssetPath,
                    width: 54.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: Text(
                    "Welcome to\nMetro Coffee",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(PageName.membershiploginpage),
                  child: Container(
                    margin: EdgeInsets.only(top: 32.h),
                    //TODO: remove width
                    height: 48.h,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2.w, color: const Color(0xfff3f3f3)),
                      borderRadius: BorderRadius.all(Radius.circular(24.r)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "Continue with Membership",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
                emailbox(context),
                SizedBox(
                  height: 36.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          height: 2.h,
                          color: Colors.white30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                        child: Text(
                          "or login with",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 2.h,
                          color: Colors.white30,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 33.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 52.w,
                        height: 52.w,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          SocialIcons.google,
                          width: 20.w,
                          height: 20.w,
                        ),
                      ),
                      SizedBox(
                        width: 36.w,
                      ),
                      Container(
                        width: 52.w,
                        height: 52.w,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Image.asset(
                          SocialIcons.facebook,
                          width: 20.w,
                          height: 20.w,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget emailbox(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(PageName.emailloginpage),
      child: Container(
        margin: EdgeInsets.only(top: 24.h),
        height: 44.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(24.r),
          ),
          color: Colors.black87,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.mail,
                color: Colors.white,
                size: 16.w,
              ),
              Container(
                margin: EdgeInsets.only(left: 16.w),
                child: Text(
                  "Continue with Email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                     
                    fontSize: 12.w,
                    color: Colors.white54,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
