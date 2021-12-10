import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/modules/profile/contents/order_history_controller.dart';
import 'package:metrocoffee/modules/profile/widgets/timeframeorders.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';
import '../../../core/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF3F5F5),
      body: GetBuilder<OrderHistoryController>(
          init: OrderHistoryController(),
          initState: (v) {
            Get.find<OrderHistoryController>().getAllOrders();
          },
          builder: (controller) {
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                width: screenwidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppBar(
                      title: Text(
                        "MY ORDER",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkgrey,
                            //    fontSize: 16.5
                            fontSize: screenwidth * 0.0401)),
                      ),
                      centerTitle: true,
                      // leading: IconButton(
                      //   onPressed: () {
                      //     Get.back();
                      //   },
                      //   icon: Icon(
                      //     CupertinoIcons.back,
                      //     color: darkgrey,
                      //     //                size: 28,
                      //     size: screenwidth * 0.0681,
                      //   ),
                      // ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        //                top:14,bottom: 24
                        left: screenwidth * 0.0535,
                        right: screenwidth * 0.0535,
                        bottom: 0,
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
                          //                top:14,bottom: 24
                          left: screenwidth * 0.0535,
                          right: screenwidth * 0.0535,
                        ),
                        child: controller.dataState == DataState.loading
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SpinKitCubeGrid(
                                    color: Palette.coffeeColor,
                                  ),
                                ],
                              )
                            : (controller.dataState == DataState.error)
                                ? SizedBox(
                                    child: Center(
                                      child:
                                          Text('Error retrieving your order'),
                                    ),
                                  )
                                : GetX<OrderHistoryController>(
                                    builder: (controller) {
                                    var myOrderList =
                                        controller.orderHistoryList;
                                    if (myOrderList.length < 3) {
                                      return Container(
                                        width: 375.w,
                                        height: 500.h,
                                        alignment: Alignment.center,
                                        child: UtilityInfoWidget(
                                            title: "No Order History",
                                            content:
                                                "Looks Like you have no history",
                                            onPressed: () {
                                              // print(0);
                                              Get.find<BaseController>()
                                                  .setindex(0);
                                            },
                                            svgImageUri:
                                                UtilityIcons.noDocuments,
                                            buttonText: "Start Browsing"),
                                      );
                                    }
                                    // print(myOrderList);
                                    return ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: myOrderList.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          var newData = myOrderList[index];
                                          if (newData == 0) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, bottom: 8.0),
                                              child: Text("Today"),
                                            );
                                          }
                                          if (newData == 1) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, bottom: 8.0),
                                              child: Text("This Month"),
                                            );
                                          }
                                          if (newData is OrderHistory) {
                                            return TimeFrameOrders(
                                                index: index,
                                                orderData: newData);
                                          }
                                          return SizedBox();
                                        });
                                  }))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
