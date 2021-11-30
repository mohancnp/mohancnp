import 'dart:ui';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/icons/socials.dart';
import 'package:metrocoffee/core/routing/names.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:metrocoffee/ui/src/fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            body: Image.asset(
          "assets/images/nathan-dumlao-c2Y16tC3yO8-unsplash@3x.png",
          width: 375.w,
          fit: BoxFit.cover,
        )),
        Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0.14),
            automaticallyImplyLeading: false,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            height: 812.h,
            width: 375.w,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black.withOpacity(0.14),
                  Colors.black.withOpacity(0.8)
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/metro_coffee_logo.png",
                    width: 54.w,
                  ),
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 25.h),
                  child: Text(
                    "Welcome to\nMetro Coffee",

                    style: Theme.of(context).textTheme.headline1,
                    // style: TextStyle(
                    //   fontFamily: MetroFontsFamily.freightDispBold,
                    //   color: Colors.white,
                    //   fontSize: 42.sp,
                    // ),
                  ),
                ),
                ClipRRect(
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: GestureDetector(
                            onTap: () {
                              Get.toNamed(PageName.membershiploginpage);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 33.h),
                              width: 375.w,
                              height: 49.h,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2.w, color: Color(0xfff3f3f3)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(23.r)),
                                  color: Colors.white),
                              child: Center(
                                child: Text(
                                  "Continue with Membership",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.button,
                                ),
                              ),
                            )))),
                emailbox(context),
                Container(
                  width: 342.w,
                  margin: EdgeInsets.only(
                    top: 36.h,
                    left: 16.w,
                    right: 16.w,
                  ),
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 115.w,
                          height: 2.h,
                          color: Colors.white30,
                        ),
                        Text(
                          "or login with",
                          style:
                              TextStyle(color: Colors.white54, fontSize: 14.sp),
                        ),
                        Container(
                          width: 115.w,
                          height: 2.h,
                          color: Colors.white30,
                        ),
                      ],
                    ),
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
                        decoration: BoxDecoration(
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
                        decoration: BoxDecoration(
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
        )
      ],
    );
  }

  Widget emailbox(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ClipRRect(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: GestureDetector(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(top: screenwidth * 0.0656),
            width: screenwidth,
            height: screenwidth * 0.1192,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Colors.black87),
            child: Center(
                child: Container(
                    width: screenwidth * 0.58,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FeatherIcons.mail,
                            color: Colors.white,
                            size: screenwidth * 0.0486,
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: screenwidth * 0.04136),
                            child: Text(
                              "Continue with Email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: poppinsregular,
                                  fontSize: screenwidth * 0.0364,
                                  color: Colors.white54),
                            ),
                          )
                        ]))),
          )),
    ));
  }
}
