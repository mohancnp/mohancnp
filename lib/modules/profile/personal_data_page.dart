import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/profile/personal_data_page_controller.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'widgets/user_data_feilds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDataPage extends StatelessWidget {
  PersonalDataPage({Key? key}) : super(key: key);
  final personalDataPageController = Get.put(PersonalDataPageController());
  final profilePageController = Get.find<ProfilePageController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalDataPageController>(
      initState: (v) {
        personalDataPageController.initializeFeilds();
      },
      init: PersonalDataPageController(),
      builder: (personaldatacontroller) {
        return Scaffold(
          backgroundColor: Palette.pagebackgroundcolor,
          body: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              padding: EdgeInsets.only(
                bottom: 20.h,
              ),
              width: 375.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBar(
                    title: Text(
                      "PERSONAL DATA",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: darkgrey,
                        fontSize: 16.sp,
                      ),
                    ),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: Get.back,
                      icon: Icon(
                        CupertinoIcons.back,
                        color: darkgrey,
                        size: 28.sp,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                left: 20.w,
                                right: 20.w,
                              ),
                              padding: EdgeInsets.all(
                                16.r,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 10.r,
                                    offset: Offset(0, 4.r),
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  36.w,
                                ),
                                child: Image.network(
                                  "${AppConfig.baseUrl}/${profilePageController.newUser.image}",
                                  width: 76.w,
                                  loadingBuilder:
                                      (context, widget, imageProgress) {
                                    if (imageProgress == null) {
                                      return widget;
                                    } else {
                                      return const Center(
                                        child: Text("Loading..."),
                                      );
                                    }
                                  },
                                  errorBuilder: (a, b, c) => Container(
                                    alignment: Alignment.center,
                                    width: 60.r,
                                    height: 60.r,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      Get.find<ProfilePageController>()
                                          .getImagePlacholder(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Palette.textColor,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              )),
                          Positioned(
                            left: 80.w,
                            bottom: 10.h,
                            child: GestureDetector(
                              onTap: personalDataPageController.getUserImage,
                              child: Container(
                                height: 20.w,
                                width: 20.w,
                                decoration: const BoxDecoration(
                                  color: Palette.coffeeColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  size: 16.r,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 14.w, bottom: 24.h),
                    width: 375.w,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Palette.pagebackgroundcolor.withOpacity(0.4),
                    ),
                  ),
                  Form(
                    key: personalDataPageController.key,
                    child: UserDataFeildWidget(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Palette.coffeeColor,
                    ),
                    width: 130.w,
                    height: 50.h,
                    child: MaterialButton(
                      child: const Text(
                        "UPDATE",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: personaldatacontroller.updateUserInfo,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
