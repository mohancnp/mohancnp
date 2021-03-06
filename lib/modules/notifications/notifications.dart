import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/modules/notifications/no_notifications_widget.dart';
import 'package:metrocoffee/modules/notifications/notification_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/modules/notifications/single_notification.dart';
import 'package:metrocoffee/modules/shareables/something_went_wrong_page.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);
  final controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "MY NOTIFICATIONS",
          style: TextStyle(
            fontFamily: CustomFont.poppinsMedium,
            color: Palette.darkGery,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: GetBuilder<NotificationController>(
        init: NotificationController(),
        initState: (v) {
          Get.find<NotificationController>().getAllNotifications(pageNumber: 1);
        },
        builder: (controller) {
          DataState _ds = controller.dataState;
          return _ds == DataState.loading
              ? Container(
                  alignment: Alignment.center,
                  child: SpinKitCubeGrid(
                    color: Palette.coffeeColor,
                  ))
              : _ds == DataState.loaded
                  ? Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: controller.notifications.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return SingleNotification(
                            index: index,
                            notification: controller.notifications[index],
                          );
                        },
                      ),
                    )
                  : _ds == DataState.na
                      ? const NoNotificationPage()
                      : const SomeThingWentWrongPage();
        },
      ),
    );
  }
}
