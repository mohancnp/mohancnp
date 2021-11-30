import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import '../../profile/personal_data_page_controller.dart';

class ChangePasswordFeild extends StatelessWidget {
  ChangePasswordFeild({Key? key}) : super(key: key);
  // final personalPagecontroller = Get.find<PersonalDataPageController>();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return GetBuilder<PersonalDataPageController>(
        init: PersonalDataPageController(),
        builder: (controller) {
          return Container(
            width: screenwidth,
            padding: EdgeInsets.only(
              //          horizontal: 22
              left: screenwidth * 0.0535,
              right: screenwidth * 0.0535,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          //         left: 4
                          left: screenwidth * 0.0097),
                      child: Text(
                        "Current Password",
                        style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                          fontSize: screenwidth * 0.0304,
                          color: Palette.darkGery.withOpacity(0.65),
                        )),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                      top: screenwidth * 0.0182,
                      bottom: screenwidth * 0.0486),
                  padding: EdgeInsets.only(
//                horizontal: 14
                      left: screenwidth * 0.03406),
                  width: screenwidth,
                  decoration: BoxDecoration(
                      color: Color(0xffF9F9F9),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ]),
                  child: TextField(
                    onChanged: (v) {
                      controller.setchangesmadetrue();
                    },
                    style: getpoppins(
                      TextStyle(
                          fontWeight: FontWeight.w400,
                          //    fontSize: 13.5,
                          fontSize: screenwidth * 0.0328,
                          color: Color(0xff1A1C1C)),
                    ),
                    cursorColor: Color(0xff1A1C1C),
                    obscureText: controller.obscurecurrentpassword,
                    controller: controller.currentpasswordcontroller,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.setcurrentpasswordview();
                          },
                          child: Icon(
                            controller.obscurecurrentpassword
                                ? FeatherIcons.eye
                                : FeatherIcons.eyeOff,
                            color: Color(0xff1A1C1C).withOpacity(0.85),
                            //     size: 18.5,
                            size: screenwidth * 0.0450,
                          ),
                        ),
                        hintStyle: getpoppins(
                          TextStyle(
                              fontWeight: FontWeight.w400,
                              //      fontSize: 13.5,
                              fontSize: screenwidth * 0.0328,
                              color: Color(0xff1A1C1C).withOpacity(0.65)),
                        ),
                        hintText: "Type your current password"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          //         left: 4
                          left: screenwidth * 0.0097),
                      child: Text(
                        "New Password",
                        style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                          fontSize: screenwidth * 0.0304,
                          color: Palette.darkGery.withOpacity(0.65),
                        )),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                      top: screenwidth * 0.0182,
                      bottom: screenwidth * 0.0486),
                  padding: EdgeInsets.only(
//                horizontal: 14
                      left: screenwidth * 0.03406),
                  width: screenwidth,
                  decoration: BoxDecoration(
                      color: Color(0xffF9F9F9),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ]),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    onChanged: (v) {
                      controller.setchangesmadetrue();
                    },
                    style: getpoppins(
                      TextStyle(
                          fontWeight: FontWeight.w400,
                          //    fontSize: 13.5,
                          fontSize: screenwidth * 0.0328,
                          color: Color(0xff1A1C1C)),
                    ),
                    cursorColor: Color(0xff1A1C1C),
                    obscureText: controller.obscurecurrentpassword,
                    controller: controller.newpasswordcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.setcurrentpasswordview();
                          },
                          child: Icon(
                            controller.obscurecurrentpassword
                                ? FeatherIcons.eye
                                : FeatherIcons.eyeOff,
                            color: Color(0xff1A1C1C).withOpacity(0.85),
                            //     size: 18.5,
                            size: screenwidth * 0.0450,
                          ),
                        ),
                        hintStyle: getpoppins(
                          TextStyle(
                              fontWeight: FontWeight.w400,
                              //      fontSize: 13.5,
                              fontSize: screenwidth * 0.0328,
                              color: Color(0xff1A1C1C).withOpacity(0.65)),
                        ),
                        hintText: "Type a new strong password"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          //         left: 4
                          left: screenwidth * 0.0097),
                      child: Text(
                        "Confirm Password",
                        style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                          fontSize: screenwidth * 0.0304,
                          color: Palette.darkGery.withOpacity(0.65),
                        )),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                      top: screenwidth * 0.0182,
                      bottom: screenwidth * 0.0486),
                  padding: EdgeInsets.only(
//                horizontal: 14
                      left: screenwidth * 0.03406),
                  width: screenwidth,
                  decoration: BoxDecoration(
                      color: Color(0xffF9F9F9),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ]),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    onChanged: (v) {
                      controller.setchangesmadetrue();
                    },
                    style: getpoppins(
                      TextStyle(
                          fontWeight: FontWeight.w400,
                          //    fontSize: 13.5,
                          fontSize: screenwidth * 0.0328,
                          color: Color(0xff1A1C1C)),
                    ),
                    cursorColor: Color(0xff1A1C1C),
                    obscureText: controller.obscurecurrentpassword,
                    controller: controller.confirmpasswordcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.setcurrentpasswordview();
                          },
                          child: Icon(
                            controller.obscurecurrentpassword
                                ? FeatherIcons.eye
                                : FeatherIcons.eyeOff,
                            color: Color(0xff1A1C1C).withOpacity(0.85),
                            //     size: 18.5,
                            size: screenwidth * 0.0450,
                          ),
                        ),
                        hintStyle: getpoppins(
                          TextStyle(
                              fontWeight: FontWeight.w400,
                              //      fontSize: 13.5,
                              fontSize: screenwidth * 0.0328,
                              color: Color(0xff1A1C1C).withOpacity(0.65)),
                        ),
                        hintText: "Re-Type your new password"),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
