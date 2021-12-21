import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/modules/profile/contents/order_history_controller.dart';
import 'package:metrocoffee/modules/profile/widgets/time_frame_orders.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';

import '../../../core/theme.dart';

class MyOrderPage extends StatelessWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      body: GetBuilder<OrderHistoryController>(
        init: OrderHistoryController(),
        initState: (v) {
          Get.find<OrderHistoryController>().getAllOrders();
        },
        builder: (controller) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: SizedBox(
              width: 375.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBar(
                    title: Text(
                      "MY ORDER",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: darkgrey,
                         
                        fontSize: 16.sp,
                      ),
                    ),
                    centerTitle: true,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      bottom: 0,
                    ),
                    width: 375.w,
                    height: 1,
                    decoration: BoxDecoration(
                      color: const Color(0xffA5A5A5).withOpacity(0.4),
                    ),
                  ),
                  Container(
                    width: 375.w,
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
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
                            ? const SizedBox(
                                child: Center(
                                  child: Text('Error retrieving your order'),
                                ),
                              )
                            : GetX<OrderHistoryController>(
                                builder: (controller) {
                                  var myOrderList = controller.orderHistoryList;
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
                                            Get.find<BaseController>()
                                                .setindex(0);
                                          },
                                          svgImageUri: UtilityIcons.noDocuments,
                                          buttonText: "Start Browsing"),
                                    );
                                  }

                                  return ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: myOrderList.length,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      var newData = myOrderList[index];
                                      if (newData == 0) {
                                        return const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Text("Today"),
                                        );
                                      }
                                      if (newData == 1) {
                                        return const Padding(
                                          padding: EdgeInsets.only(
                                              top: 8.0, bottom: 8.0),
                                          child: Text("This Month"),
                                        );
                                      }
                                      if (newData is OrderHistory) {
                                        return TimeFrameOrders(
                                          index: index,
                                          orderData: newData,
                                        );
                                      }
                                      return const SizedBox();
                                    },
                                  );
                                },
                              ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
