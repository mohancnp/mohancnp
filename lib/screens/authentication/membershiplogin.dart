import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/auth/membershipcontroller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/enums/uistate.dart';
import 'package:metrocoffee/screens/widgets/dialogs/loading.dart';

class MembershipLogin extends StatelessWidget {
  MembershipLogin({Key? key}) : super(key: key);

  final MemberShipController memberShipController =
      Get.put(MemberShipController());
  // final BaseController baseController = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<MemberShipController>(
        init: MemberShipController(),
        builder: (membershiplogincontroller) {
          return Stack(
            children: [
              Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Image.asset(
                    "assets/images/nathan-dumlao-c2Y16tC3yO8-unsplash@3x.png",
                    width: screenheight,
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
                        size: screenwidth * 0.0681,
                      ),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  body: SingleChildScrollView(
                    child: Container(
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
//  width: 58,
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
                          membershiplogincontroller.loginfields(context),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
//                            top: 13,left: 10
                                      top: screenwidth * 0.0316,
                                      left: screenwidth * 0.02433),
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        fontFamily: proximanovaregular,
                                        color: Colors.white70,
                                        //                           fontSize: 14.5
                                        fontSize: screenwidth * 0.0352),
                                  ),
                                )
                              ]),
                          membershiplogincontroller.memberShipLoginErrorMsg ==
                                  null
                              ? SizedBox()
                              : Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      membershiplogincontroller
                                          .memberShipLoginErrorMsg!,
                                      style: TextStyle(
                                          fontFamily: proximanovaregular,
                                          color: Colors.redAccent,
                                          //                           fontSize: 14.5
                                          fontSize: screenwidth * 0.0352),
                                    ),
                                  ),
                                ),
                          Center(
                              child: GestureDetector(
                            onTap: () async {
                              var result = await membershiplogincontroller
                                  .memberShipLogin();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
//                        top: 34
                                  top: screenwidth * 0.08272),
//                    height: 46, width: 181,
                              height: screenwidth * 0.111,
                              width: screenwidth * 0.4403,
                              decoration: BoxDecoration(
                                  color: Color(0xffD4874C),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xffC3916A4D),
                                        blurRadius: 30,
                                        offset: Offset(0, 9))
                                  ]),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    "SIGN IN",
                                    style: TextStyle(
                                        fontFamily: poppinsregular,
                                        color: Colors.white,
                                        //                         fontSize: 16
                                        fontSize: screenwidth * 0.0389),
                                  ),
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                  )),
              getLoadingDialog(membershiplogincontroller.state)
            ],
          );
        });
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
