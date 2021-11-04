import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/enums/uistate.dart';
import 'package:metrocoffee/modules/auth/custom/membership_login_controller.dart';
import 'package:metrocoffee/modules/auth/widgets/sign_in_btn.dart';
import 'package:metrocoffee/modules/auth/widgets/text_form_feild_skeleton.dart';
import 'package:metrocoffee/screens/widgets/dialogs/loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MembershipLoginPage extends StatelessWidget {
  MembershipLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: Image.asset(
              "assets/images/nathan-dumlao-c2Y16tC3yO8-unsplash@3x.png",
              width: 375.w,
              fit: BoxFit.cover,
            )),
        Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black.withOpacity(0.14),
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                  //      size: 28,
                  size: 28.w,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    //        horizontal: 18
                    horizontal: 18.w),
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
                        "assets/images/metro coffee logo@3x.png",
                        width: 58.w,
                      ),
                      padding: EdgeInsets.all(
                          //     5
                          5.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          //          top: 25
                          top: 25.h),
                      child: Text(
                        "Welcome to\nMetro Coffee",
                        style: TextStyle(
                            fontFamily: freightbold,
                            color: Colors.white,
                            //       fontSize: 42
                            fontSize: 42.sp),
                      ),
                    ),
                    GetBuilder<MemberShipLoginController>(
                        init: MemberShipLoginController(),
                        builder: (mc) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              FormFeildSkeleton(
                                child: TextFormField(
                                  controller: mc.membershipNumberController,
                                  cursorColor: Colors.black87,
                                  style: TextStyle(
                                      fontFamily: poppinsregular,
                                      color: Colors.black87,
                                      //       fontSize: 13.5
                                      fontSize: 13.sp),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      FeatherIcons.user,
                                      color: Color(0xff404d4d),
                                      //                 size: 18,
                                      size: 18.sp,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Membership No.',
                                    hintStyle: TextStyle(
                                        fontFamily: poppinsregular,
                                        color: Color(0xff404d4d)),
                                  ),
                                ),
                              ),
                              FormFeildSkeleton(
                                child: TextFormField(
                                  controller: mc.passwordController,
                                  cursorColor: Colors.black87,
                                  style: TextStyle(
                                      fontFamily: poppinsregular,
                                      color: Colors.black87,
                                      //       fontSize: 13.5
                                      fontSize: 13.sp),
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(
                                      FeatherIcons.user,
                                      color: Color(0xff404d4d),
                                      //                 size: 18,
                                      size: 18.sp,
                                    ),
                                    border: InputBorder.none,
                                    hintText: 'Membership No.',
                                    hintStyle: TextStyle(
                                        fontFamily: poppinsregular,
                                        color: Color(0xff404d4d)),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Container(
                        margin: EdgeInsets.only(
//                            top: 13,left: 10
                            top: 13.h,
                            left: 10.w),
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontFamily: proximanovaregular,
                              color: Colors.white70,
                              //                           fontSize: 14.5
                              fontSize: 14.sp),
                        ),
                      )
                    ]),
                    GetBuilder<MemberShipLoginController>(builder: (mc) {
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Text(
                            "${mc.errorMessage}",
                            style: TextStyle(
                                fontFamily: proximanovaregular,
                                color: Colors.redAccent,
                                //                           fontSize: 14.5
                                fontSize: 14.sp),
                          ),
                        ),
                      );
                    }),
                    Center(
                      child: SignInBtn(
                        onpressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            )),
        // getLoadingDialog(membershiplogincontroller.state)
      ],
    );
  }
}
