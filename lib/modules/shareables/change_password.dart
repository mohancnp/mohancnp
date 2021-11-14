import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/profile/personal_data_page_controller.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/modules/shareables/widgets/change_password_feild.dart';
import '../../core/theme.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  final PersonalDataPageController personalDataPageController =
      Get.find<PersonalDataPageController>();
  final controller = Get.find<ProfilePageController>();
  @override
  Widget build(BuildContext context) {
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
                      child: Obx(() {
                        var user = controller.newUser;
                        return Row(
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
                              child: user.imageUri == null
                                  ? Image.asset(
                                      "assets/images/profilep.png",
                                      fit: BoxFit.cover,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          screenwidth * 0.1733 * 0.5),
                                      child: Image.network(
                                        "$baseUrl${user.imageUri}",
                                        fit: BoxFit.cover,
                                        height: screenwidth * 0.1733,
                                        width: screenwidth * 0.1733,
                                        loadingBuilder:
                                            (context, widget, imageProgress) {
                                          if (imageProgress == null) {
                                            return widget;
                                          } else {
                                            return Center(
                                              child: Text("Loading"),
                                            );
                                          }
                                        },
                                        errorBuilder: (a, b, c) =>
                                            Center(child: Text("Error")),
                                      ),
                                    ),
                            ),
                          ],
                        );
                      }),
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
                    ChangePasswordFeild(),
                    Text(
                      "${personalDataPageController.errorMessage ?? ''}",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                    GestureDetector(
                        onTap: personalDataPageController.changePassword,
                        child: Container(
                          margin: EdgeInsets.only(
                              //          horizontal: 22
                              left: screenwidth * 0.0535,
                              right: screenwidth * 0.0535,
//          top: 26
                              top: screenwidth * 0.0632),
//      width: 267,height: 46,
                          width: screenwidth * 0.6496,
                          height: screenwidth * 0.1119,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: coffeecolor,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Color(0xffC3916A4D).withOpacity(0.38),
                                    blurRadius: 30,
                                    offset: Offset(0, 9))
                              ]),
                          child: Center(
                            child: Text(
                              "Change Password",
                              style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                  //    fontSize: 14.5
                                  fontSize: screenwidth * 0.0352)),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
