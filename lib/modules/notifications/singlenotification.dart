import 'package:flutter/material.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/models/notification_model.dart' as n;
import 'package:metrocoffee/resource/app_config.dart';
import 'package:metrocoffee/util/date_trimmer.dart';

class SingleNotification extends StatelessWidget {
  final int? index;
  final n.Notification notification;
  const SingleNotification(
      {Key? key, @required this.index, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("${notification.notificationData.nestedData?.image}");
    return Container(
      margin: EdgeInsets.only(
        //         bottom: 12
        bottom: 12.h,
        left: 16.w,
        right: 16.w,
      ),

      width: 375.w,
      //  height: 72,
      height: 72.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 3), blurRadius: 30)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //        height: 72, width: 6,
            height: 72.h, width: 6.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
              color: index!.isOdd ? Colors.redAccent : Color(0xff550E1C),
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black12, offset: Offset(0, 3), blurRadius: 30)
              // ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(
                  //          left: 14,right: 12
                  left: 14.w,
                  right: 12.w),
              //     height: 54,width: 54,
              height: 54.w,
              width: 54.w,
              decoration: BoxDecoration(
                  color: Color(0xffE8E8E8), shape: BoxShape.circle),
              child: notification.notificationData.nestedData?.image != null
                  ? Image.network(
                      "${AppConfig.baseUrl}${notification.notificationData.nestedData?.image}",
                      height: 54.h,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Image.asset(
                        getorderimage(index),
                        //         height: 54,
                        height: 54.h,
                        fit: BoxFit.cover,
                      ),
                    )),
          Container(
            //      height: 54,
            height: 54.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    notification.notificationData.body,
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff404D4D),
                        //      fontSize: 12.5
                        fontSize: 12.5.sp)),
                  ),
                ),
                Container(
                  child: Text(
                    getTrimmedDateAndTime(dateToTrim: notification.createdAt),
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff404D4D).withOpacity(0.6),
                        //         fontSize: 11.5
                        fontSize: 11.5.sp)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  getordertext(int? index) {
    if (index!.isEven) {
      return "Your order has been delivered!";
    }
    if (index.isOdd) {
      return "Your order has been cancelled!";
    }
  }

  getorderimage(int? index) {
    if (index!.isEven) {
      return "assets/images/singlecup.png";
    }
    if (index.isOdd) {
      return "assets/images/favpng_coffee-cup-clip-art-image@3x.png";
    }
  }
}
