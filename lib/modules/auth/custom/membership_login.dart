import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/enums/uistate.dart';
import 'package:metrocoffee/modules/auth/widgets/custom_form_feild.dart';
import 'package:metrocoffee/screens/widgets/dialogs/loading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MembershipLoginPage extends StatelessWidget {
  MembershipLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenheight = MediaQuery.of(context).size.height;
    // double screenwidth = MediaQuery.of(context).size.width;

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
//  width: 58,
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
                    CustomFormFeild(),

                    // membershiplogincontroller.loginfields(context),
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
                    // membershiplogincontroller.memberShipLoginErrorMsg == null
                    // ? SizedBox()
                    // :
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Text(
                          "membershiplogincontroller error",
                          style: TextStyle(
                              fontFamily: proximanovaregular,
                              color: Colors.redAccent,
                              //                           fontSize: 14.5
                              fontSize: 14.sp),
                        ),
                      ),
                    ),
                    Center(
                        child: GestureDetector(
                      onTap: () async {
                        // var result =
                        //     await membershiplogincontroller.memberShipLogin();
                      },
                      child: Container(
                        margin: EdgeInsets.only(
//                        top: 34
                            top: 34.h),
//                    height: 46, width: 181,
                        height: 46.h,
                        width: 181.w,
                        decoration: BoxDecoration(
                            color: Color(0xffD4874C),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xffC3916A4D),
                                  blurRadius: 30.r,
                                  offset: Offset(0, 9.r))
                            ]),
                        child: Center(
                          child: Container(
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                  fontFamily: poppinsregular,
                                  color: Colors.white,
                                  //                         fontSize: 16
                                  fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            )),
        // getLoadingDialog(membershiplogincontroller.state)
      ],
    );
  }

  Widget getLoadingDialog(UIState state) {
    switch (state) {
      case UIState.passive:
        return SizedBox(
          height: 0,
        );
      case UIState.processing:
        return LoadingPage();
      case UIState.completed:
        return SizedBox(
          height: 0,
        );
      default:
        return SizedBox(
          height: 0,
        );
    }
  }
}
