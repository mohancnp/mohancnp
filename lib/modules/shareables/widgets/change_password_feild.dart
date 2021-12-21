import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import '../../profile/personal_data_page_controller.dart';

class ChangePasswordFeild extends StatelessWidget {
  const ChangePasswordFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return GetBuilder<PersonalDataPageController>(
        init: PersonalDataPageController(),
        builder: (controller) {
          return Container(
            width: screenwidth,
            padding: EdgeInsets.only(
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
                      margin: EdgeInsets.only(left: screenwidth * 0.0097),
                      child: Text(
                        "Current Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                           
                          fontSize: screenwidth * 0.0304,
                          color: Palette.darkGery.withOpacity(0.65),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: screenwidth * 0.0182,
                    bottom: screenwidth * 0.0486,
                  ),
                  padding: EdgeInsets.only(left: screenwidth * 0.03406),
                  width: screenwidth,
                  decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ]),
                  child: TextField(
                    onChanged: (v) {
                      controller.setchangesmadetrue();
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                       
                      fontSize: screenwidth * 0.0328,
                      color: const Color(0xff1A1C1C),
                    ),
                    cursorColor: const Color(0xff1A1C1C),
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
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff1A1C1C).withOpacity(0.85),
                            size: screenwidth * 0.0450,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                           
                          fontSize: screenwidth * 0.0328,
                          color: const Color(0xff1A1C1C).withOpacity(0.65),
                        ),
                        hintText: "Type your current password"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: screenwidth * 0.0097),
                      child: Text(
                        "New Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                           
                          fontSize: screenwidth * 0.0304,
                          color: Palette.darkGery.withOpacity(0.65),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: screenwidth * 0.0182, bottom: screenwidth * 0.0486),
                  padding: EdgeInsets.only(left: screenwidth * 0.03406),
                  width: screenwidth,
                  decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ]),
                  child: TextField(
                    textInputAction: TextInputAction.next,
                    onChanged: (v) {
                      controller.setchangesmadetrue();
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: screenwidth * 0.0328,
                       
                      color: const Color(0xff1A1C1C),
                    ),
                    cursorColor: const Color(0xff1A1C1C),
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
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color(0xff1A1C1C).withOpacity(0.85),
                            size: screenwidth * 0.0450,
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                           
                          fontSize: screenwidth * 0.0328,
                          color: const Color(0xff1A1C1C).withOpacity(0.65),
                        ),
                        hintText: "Type a new strong password"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: screenwidth * 0.0097),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                           
                          fontSize: screenwidth * 0.0304,
                          color: Palette.darkGery.withOpacity(0.65),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: screenwidth * 0.0182, bottom: screenwidth * 0.0486),
                  padding: EdgeInsets.only(left: screenwidth * 0.03406),
                  width: screenwidth,
                  decoration: BoxDecoration(
                      color: const Color(0xffF9F9F9),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 3))
                      ]),
                  child: TextField(
                    textInputAction: TextInputAction.done,
                    onChanged: (v) {
                      controller.setchangesmadetrue();
                    },
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                       
                      fontSize: screenwidth * 0.0328,
                      color: const Color(0xff1A1C1C),
                    ),
                    cursorColor: const Color(0xff1A1C1C),
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
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xff1A1C1C).withOpacity(0.85),
                          size: screenwidth * 0.0450,
                        ),
                      ),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                         
                        fontSize: screenwidth * 0.0328,
                        color: const Color(0xff1A1C1C).withOpacity(0.65),
                      ),
                      hintText: "Re-Type your new password",
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
