import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/profile/personal_data_page_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'widgets/user_data_feilds.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDataPage extends StatelessWidget {
  PersonalDataPage({Key? key}) : super(key: key);
  final PersonalDataPageController personalDataPageController =
      Get.put(PersonalDataPageController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PersonalDataPageController>(
        initState: (v) {
          personalDataPageController.initializeFeilds();
        },
        init: PersonalDataPageController(),
        builder: (personaldatacontroller) {
          return Scaffold(
            backgroundColor: Color(0xffF3F5F5),
            body: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: 22.h,
                  ),
                  width: 375.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppBar(
                        title: Text(
                          "PERSONAL DATA",
                          style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkgrey,
                            fontSize: 16.5.sp,
                          )),
                        ),
                        centerTitle: true,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
                          // personalDataPageController.imageData == null
                          //     ? SizedBox()
                          //     : Container(
                          //         color: Colors.red,
                          //         width: 76.w,
                          //         height: 76.w,
                          //         child: Image.file(
                          //           personalDataPageController.imageData,
                          //           fit:BoxFit.cover,
                          //           // height: 76.h,
                          //         ),
                          //       ),
                          Stack(
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
                                child:
                                    personalDataPageController.imageUri != null
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              38.w,
                                            ),
                                            child: Image.network(
                                              "${AppConfig.baseUrl}${personaldatacontroller.imageUri!}",
                                              width: 76.w,
                                              loadingBuilder: (context, widget,
                                                  imageChunkEvent) {
                                                if (imageChunkEvent == null) {
                                                  return widget;
                                                } else {
                                                  return Center(
                                                    child: Text("Loading.."),
                                                  );
                                                }
                                              },
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : Obx(() {
                                            var newUser = Get.find<
                                                    ProfilePageController>()
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
                                          }),
                              ),
                              Positioned(
                                left: 86.w,
                                top: 10.h,
                                child: GestureDetector(
                                  onTap: () =>
                                      personalDataPageController.getUserImage(),
                                  child: Container(
                                    height: 20.w,
                                    width: 20.w,
                                    decoration: BoxDecoration(
                                      color: Palette.coffeeColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      FeatherIcons.edit2,
                                      size: 14.r,
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
                          left: 20.w,
                          right: 20.w,
                          top: 14.w,
                          bottom: 24.h,
                        ),
                        width: 375.w,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Color(0xffA5A5A5).withOpacity(0.4),
                        ),
                      ),
                      UserDataFeildWidget(),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: coffeecolor),
                        width: 130.w,
                        height: 50.h,
                        child: MaterialButton(
                          child: Text(
                            "UPDATE",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: personaldatacontroller
                              .updateUserInfoInDbAndServer,
                        ),
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
