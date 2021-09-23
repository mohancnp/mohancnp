import 'dart:ui';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/auth/social_login_controller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  // final LoginController loginController = Get.put(LoginController());
  final SocialLoginController socialLoginController =
      Get.put(SocialLoginController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return GetBuilder<SocialLoginController>(
        init: SocialLoginController(),
        initState: (v){

        },
        builder: (logincontroller) {
          return Stack(
            children: [
              Scaffold(
                  body: Image.asset(
                "assets/images/nathan-dumlao-c2Y16tC3yO8-unsplash@3x.png",
                width: screenheight,
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
                  padding: EdgeInsets.symmetric(
                      //        horizontal: 18
                      horizontal: screenwidth * 0.04379),
                  height: screenheight,
                  width: screenwidth,
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
                          width: screenwidth * 0.1411,
                        ),
                        padding: EdgeInsets.all(
                            //     5
                            screenwidth * 0.0121),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            //          top: 25
                            top: screenwidth * 0.0608),
                        child: Text(
                          "Welcome to\nMetro Coffee",
                          style: TextStyle(
                              fontFamily: freightbold,
                              color: Colors.white,
                              //       fontSize: 42
                              fontSize: screenwidth * 0.102),
                        ),
                      ),
                      ClipRRect(
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                              child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/MembershipLogin');
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MembershipLogin()));
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        //       top: 33
                                        top: screenwidth * 0.0802),
                                    width: screenwidth,
                                    //    height: 49,
                                    height: screenwidth * 0.119,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 2, color: Color(0xfff3f3f3)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(23)),
                                        color: Colors.black87),
                                    child: Center(
                                      child: Container(
                                        child: Text(
                                          "Continue with Membership",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: poppinsregular,
                                              //        fontSize: 15,
                                              fontSize: screenwidth * 0.03649,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )))),
                      emailbox(context),
                      ClipRRect(
                          child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: GestureDetector(
                            onTap: () async {
                              //goggle sign in
                              // logincontroller.performGoogleSignin();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  //      top: 27
                                  top: screenwidth * 0.0656),
                              width: screenwidth,
                              //     height: 49,
                              height: screenwidth * 0.1192,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(23)),
                                  color: Colors.white),
                              child: Center(
                                  child: Container(
                                      width: screenwidth * 0.59,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.google,
                                              color: Colors.black87,
                                              //     size: 20,
                                              size: screenwidth * 0.0486,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  //       left: 17
                                                  left: screenwidth * 0.04136),
                                              child: Text(
                                                "Continue with Gmail",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily: poppinsregular,
                                                    //        fontSize: 15,
                                                    fontSize:
                                                        screenwidth * 0.0364,
                                                    color: Colors.black87),
                                              ),
                                            )
                                          ]))),
                            )),
                      )),
                      ClipRRect(
                          child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: GestureDetector(
                          onTap: () async {
                            //login through facebook
                            // socialLoginController.performFacebookLogin();
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                //      top: 27
                                top: screenwidth * 0.0656),
                            width: screenwidth,
                            //     height: 49,
                            height: screenwidth * 0.1192,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(23)),
                                color: Colors.white),
                            child: Center(
                                child: Container(
                                    width: screenwidth * 0.59,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.facebookF,
                                            color: Colors.black87,
                                            //     size: 20,
                                            size: screenwidth * 0.0486,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                //       left: 17
                                                left: screenwidth * 0.04136),
                                            child: Text(
                                              "Continue with Facebook",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: poppinsregular,
                                                  //        fontSize: 15,
                                                  fontSize:
                                                      screenwidth * 0.0364,
                                                  color: Colors.black87),
                                            ),
                                          )
                                        ]))),
                          ),
                        ),
                      )),

                      //      instagrambox(context),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget facebookbox(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ClipRRect(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: Container(
        margin: EdgeInsets.only(
            //      top: 27
            top: screenwidth * 0.0656),
        width: screenwidth,
        //     height: 49,
        height: screenwidth * 0.1192,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(23)),
            color: Colors.white),
        child: Center(
            child: Container(
                width: screenwidth * 0.59,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.black87,
                    //     size: 20,
                    size: screenwidth * 0.0486,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        //       left: 17
                        left: screenwidth * 0.04136),
                    child: Text(
                      "Continue with Facebook",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: poppinsregular,
                          //        fontSize: 15,
                          fontSize: screenwidth * 0.0364,
                          color: Colors.black87),
                    ),
                  )
                ]))),
      ),
    ));
  }

  Widget gmailbox(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ClipRRect(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: GestureDetector(
          onTap: () async {},
          child: Container(
            margin: EdgeInsets.only(
                //      top: 27
                top: screenwidth * 0.0656),
            width: screenwidth,
            //     height: 49,
            height: screenwidth * 0.1192,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Colors.white),
            child: Center(
                child: Container(
                    width: screenwidth * 0.59,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.black87,
                            //     size: 20,
                            size: screenwidth * 0.0486,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                //       left: 17
                                left: screenwidth * 0.04136),
                            child: Text(
                              "Continue with Gmail",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: poppinsregular,
                                  //        fontSize: 15,
                                  fontSize: screenwidth * 0.0364,
                                  color: Colors.black87),
                            ),
                          )
                        ]))),
          )),
    ));
  }

  Widget emailbox(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ClipRRect(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: GestureDetector(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, "/EmailLoginPage", (route) => true);
          },
          child: Container(
            margin: EdgeInsets.only(
                //      top: 27
                top: screenwidth * 0.0656),
            width: screenwidth,
            //     height: 49,
            height: screenwidth * 0.1192,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(23)),
                color: Colors.white),
            child: Center(
                child: Container(
                    width: screenwidth * 0.58,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FeatherIcons.mail,
                            color: Colors.black87,
                            //     size: 20,
                            size: screenwidth * 0.0486,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                //       left: 17
                                left: screenwidth * 0.04136),
                            child: Text(
                              "Continue with Email",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: poppinsregular,
                                  //        fontSize: 15,
                                  fontSize: screenwidth * 0.0364,
                                  color: Colors.black87),
                            ),
                          )
                        ]))),
          )),
    ));
  }

  Widget instagrambox(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ClipRRect(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
      child: GestureDetector(
          child: Container(
        margin: EdgeInsets.only(
            //      top: 27
            top: screenwidth * 0.0656),
        width: screenwidth,
        //     height: 49,
        height: screenwidth * 0.1192,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(23)),
            color: Colors.white),
        child: Center(
            child: Container(
                width: screenwidth * 0.58,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.black87,
                    //     size: 20,
                    size: screenwidth * 0.0486,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        //       left: 17
                        left: screenwidth * 0.04136),
                    child: Text(
                      "Continue with Instagram",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: poppinsregular,
                          //        fontSize: 15,
                          fontSize: screenwidth * 0.0364,
                          color: Colors.black87),
                    ),
                  )
                ]))),
      )),
    ));
  }
}
