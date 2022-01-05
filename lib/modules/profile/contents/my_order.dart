import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/modules/profile/contents/order_history_controller.dart';
import 'package:metrocoffee/modules/profile/widgets/time_frame_orders.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';
import '../../../core/theme.dart';

class MyOrderPage extends StatelessWidget {
  MyOrderPage({Key? key}) : super(key: key);
  final controller = Get.put(OrderHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      body: GetBuilder<OrderHistoryController>(
        initState: (v) {
          controller.dataState = DataState.loading;
          controller.getAllOrders();
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
                      color: Palette.pagebackgroundcolor.withOpacity(0.4),
                    ),
                  ),
                  Container(
                    width: 375.w,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                    ),
                    child: controller.dataState == DataState.loading
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Center(
                                child: SpinKitCircle(
                                  color: Palette.coffeeColor,
                                ),
                              ),
                            ],
                          )
                        : (controller.dataState == DataState.authError)
                            ? Container(
                                width: 375.w,
                                height: 500.h,
                                alignment: Alignment.center,
                                child: UtilityInfoWidget(
                                  title: " Your Order Couldn't be retreived",
                                  content:
                                      "Please log back in, and try again!!",
                                  onPressed: () =>
                                      Get.toNamed(PageName.loginpage),
                                  svgImageUri: UtilityIcons.noResults,
                                  buttonText: "Login",
                                ),
                              )
                            : (controller.dataState == DataState.error)
                                ? Container(
                                    width: 375.w,
                                    height: 500.h,
                                    alignment: Alignment.center,
                                    child: UtilityInfoWidget(
                                      title: "Error Occured",
                                      content:
                                          "We couldn't retreive your order, please retry later.",
                                      onPressed: () {
                                        Get.find<BaseController>().setindex(0);
                                      },
                                      svgImageUri: UtilityIcons.noDocuments,
                                      buttonText: "Browse Products",
                                    ),
                                  )
                                : controller.orderHistoryList.isEmpty
                                    ? Container(
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
                                          buttonText: "Start Browsing",
                                        ),
                                      )
                                    : ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount:
                                            controller.orderHistoryList.length,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          final newData = controller
                                              .orderHistoryList[index];
                                          final orderStatus =
                                              controller.getStatusStringForId(
                                                  newData.status);
                                          return TimeFrameOrders(
                                            index: index,
                                            orderData: newData,
                                            orderStatus: orderStatus,
                                            onPressed: () => controller
                                                .goToOrderDetail(newData.id),
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
