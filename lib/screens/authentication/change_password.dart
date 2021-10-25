import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/profile/personaldatapagecontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import '../../theme.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  final PersonalDataPageController personalDataPageController =
      Get.find<PersonalDataPageController>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<PersonalDataPageController>(
        initState: (v) {
          personalDataPageController.currentpasswordcontroller.text = "";
          personalDataPageController.newpasswordcontroller.text = "";
          personalDataPageController.confirmpasswordcontroller.text = "";
        },
        init: PersonalDataPageController(),
        builder: (personaldatacontroller) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: !personaldatacontroller
                    .passwordchangedsuccesfully
                ? SizedBox(
                    height: 0,
                  )
                : GestureDetector(
                    onTap: () {},
                    child: AnimatedContainer(
                      height: 42,
                      width: 295,
                      duration: Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 11, horizontal: 14),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FeatherIcons.check,
                            color: Colors.white,
                            size: 24,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 11),
                            child: Center(
                              child: Text(
                                "Password changes successfully",
                                style: getpoppins(TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 14.5)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
            backgroundColor: Color(0xffF3F5F5),
            body: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                width: screenwidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppBar(
                      title: Text(
                        "NEW PASSWORD",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: darkgrey,
                            //    fontSize: 16.5
                            fontSize: screenwidth * 0.0401)),
                      ),
                      centerTitle: true,
                      leading: IconButton(
                        onPressed: () {
                          personalDataPageController
                              .passwordchangedsuccesfully = false;
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          CupertinoIcons.back,
                          color: darkgrey,
//                size: 28,
                          size: screenwidth * 0.0681,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        //          horizontal: 22
                        left: screenwidth * 0.0535,
                        right: screenwidth * 0.0535,
                      ),
                      width: screenwidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: screenwidth * 0.0535,
                              right: screenwidth * 0.0535,
                            ),
                            padding: EdgeInsets.all(
                                //            14
                                screenwidth * 0.0340),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      offset: Offset(0, 3))
                                ]),
                            child: Image.asset(
                              "assets/images/profilep.png",
                              //     width: 82.5,
                              width: screenwidth * 0.2007,
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
//                top:14,bottom: 24
                        top: screenwidth * 0.0340,
                        bottom: screenwidth * 0.0340,
                      ),
                      width: screenwidth,
                      height: 1,
                      decoration: BoxDecoration(
                        color: Color(0xffA5A5A5).withOpacity(0.4),
                      ),
                    ),
                    Container(
                      width: screenwidth,
                      padding: EdgeInsets.only(
                        left: screenwidth * 0.0535,
                        right: screenwidth * 0.0535,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Create new password",
                              style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w500,
//                                  fontSize: 22.5,
                                  fontSize: screenwidth * 0.0547,
                                  color: darkgrey)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: screenwidth,
                        padding: EdgeInsets.only(
                          left: screenwidth * 0.0535,
                          right: screenwidth * 0.0535,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
//                                  top: 6, bottom: 32
                                  top: screenwidth * 0.0145,
                                  bottom: screenwidth * 0.0778),
                              child: Text(
                                "Your new password must be different\nfrom previous used passwords.",
                                style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w400,
                                  //       fontSize: 12.5,
                                  fontSize: screenwidth * 0.0304,
                                  color: darkgrey.withOpacity(0.66),
                                )),
                              ),
                            )
                          ],
                        )),
                    personaldatacontroller.changepasswordtextfields(context),
                    Text(
                      "${personalDataPageController.errorMessage ?? ''}",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                    personaldatacontroller.changepasswordbutton(context),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
