import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/profile/personal_data_page_controller.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/modules/shareables/widgets/change_password_feild.dart';
import 'package:metrocoffee/resource/app_config.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import '../../core/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  final PersonalDataPageController personalDataPageController =
      Get.find<PersonalDataPageController>();
  final controller = Get.find<ProfilePageController>();

  @override
  Widget build(BuildContext context) {
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
                      height: 42.h,
                      width: 295.w,
                      duration: Duration(milliseconds: 250),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.all(Radius.circular(24.r)),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 11.h, horizontal: 14.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            FeatherIcons.check,
                            color: Colors.white,
                            size: 24.r,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 11.w),
                            child: Center(
                              child: Text(
                                "Password changes successfully",
                                style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 14.5.sp,
                                )),
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
                width: 375.w,
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
                          fontSize: 16.5,
                        )),
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
                          size: 28.r,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 22.w,
                        right: 22.w,
                      ),
                      width: 375.w,
                      child: Obx(() {
                        var user = controller.newUser;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                              ),
                              padding: EdgeInsets.all(
                                14.r,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 10.r,
                                        offset: Offset(0, 3.r))
                                  ]),
                              child: user.imageUri == null
                                  ? Obx(() {
                                      var newUser = controller
                                          .getFirstLetterOfNameAndSurname();

                                      return Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          newUser,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.textColor,
                                          ),
                                        ),
                                      );
                                    })
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        32.r,
                                      ),
                                      child: Image.network(
                                        "${AppConfig.baseUrl}${user.imageUri}",
                                        fit: BoxFit.cover,
                                        height: 64.r,
                                        width: 64.r,
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
                        top: 14.h,
                        bottom: 24.h,
                      ),
                      width: 375.w,
                      height: 1.h,
                      decoration: BoxDecoration(
                        color: Color(0xffA5A5A5).withOpacity(0.4),
                      ),
                    ),
                    Container(
                      width: 375.w,
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Create new password",
                              style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22.5.sp,
                                  color: darkgrey)),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        width: 375.w,
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: 6.h,
                                bottom: 32.h,
                              ),
                              child: Text(
                                "Your new password must be different\nfrom previous used passwords.",
                                style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.5.sp,
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
                            left: 22.w,
                            right: 22.w,
                            top: 26.h,
                          ),
                          width: 268.w,
                          height: 46.h,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                              color: coffeecolor,
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Color(0xffC3916A4D).withOpacity(0.38),
                                    blurRadius: 30.r,
                                    offset: Offset(0, 9.h))
                              ]),
                          child: Center(
                            child: Text(
                              "Change Password",
                              style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 14.5,
                              )),
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
