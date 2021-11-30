import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/profile/contents/order_details_controller.dart';
import 'package:metrocoffee/modules/profile/widgets/timeframeorderdetails.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';
import '../../../core/theme.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<OrderDetailsController>(
        init: OrderDetailsController(),
        initState: (v) {
          int id = Get.arguments;
          Get.find<OrderDetailsController>().getOrderDetailWithId(id);
        },
        builder: (controller) {
          return Scaffold(
            backgroundColor: Color(0xffF3F5F5),
            body: Container(
              width: screenwidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBar(
                    title: Text(
                      "ORDER DETAILS",
                      style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w400,
                          color: darkgrey,
                          //    fontSize: 16.5
                          fontSize: screenwidth * 0.0401)),
                    ),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        CupertinoIcons.back,
                        color: darkgrey,
//                size: 28,
                        size: screenwidth * 0.0681,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  Container(
                    margin: EdgeInsets.only(
//                top:14,bottom: 24
                      left: screenwidth * 0.0535,
                      right: screenwidth * 0.0535,
                      top: 26,
                      bottom: 14,
                    ),
                    width: screenwidth,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Color(0xffA5A5A5).withOpacity(0.4),
                    ),
                  ),
                  controller.dataState == DataState.NA
                      ? SizedBox()
                      : (controller.dataState == DataState.loading)
                          ? SpinKitCubeGrid(
                              color: coffeecolor,
                            )
                          : (controller.dataState == DataState.error)
                              ? UtilityInfoWidget(
                                  title: "Oops!",
                                  content:
                                      "Something went wrong please try again.",
                                  onPressed: () {
                                    Get.offAllNamed(PageName.homepage);
                                  },
                                  svgImageUri: UtilityIcons.somethingWrong,
                                  buttonText: "Reload Page")
                              : ListView.builder(
                                  itemCount: 1,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return TimeFrameOrderDetails(
                                      orderDetail: controller.orderDetail,
                                    );
                                  })
                ],
              ),
            ),
          );
        });
  }
}
