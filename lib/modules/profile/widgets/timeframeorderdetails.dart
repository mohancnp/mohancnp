import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/order_status.dart';
import 'package:metrocoffee/core/models/order_model.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/profile/widgets/cancel_order_dialog.dart';
import 'package:metrocoffee/modules/profile/widgets/order_detail_row.dart';
import 'package:metrocoffee/modules/profile/widgets/reorder_dialog.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class TimeFrameOrderDetails extends StatelessWidget {
  final OrderDetail orderDetail;

  TimeFrameOrderDetails({Key? key, required this.orderDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          //     bottom: 20,top:16
          left: screenwidth * 0.0535,
          right: screenwidth * 0.0535,
          top: screenwidth * 0.0389,
          bottom: screenwidth * 0.0486),
      padding: EdgeInsets.only(
//          vertical: 12, horizontal: 16
          top: screenwidth * 0.0291,
          left: screenwidth * 0.0389,
          right: screenwidth * 0.0389,
          bottom: 24),
      decoration: BoxDecoration(
          color: Color(0xffFBFBFB),
          borderRadius: BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 10,
                offset: Offset(0, 3))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Order ID: #${orderDetail.id}",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w500,
                      color: coffeecolor,
//                      fontSize: 13.5
                      fontSize: screenwidth * 0.0328)),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Status",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w300,
                            color: darkgrey,
//                            fontSize: 9.5
                            fontSize: screenwidth * 0.023)),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            orderDetail.status == OrderStatus.cancelled
                                ? Icons.cancel_rounded
                                : CupertinoIcons.timer_fill,
                            color: orderDetail.status == OrderStatus.cancelled
                                ? Colors.red
                                : orderDetail.status == OrderStatus.delivered
                                    ? Palette.coffeeColor
                                    : Color(0xffE1C40D),
//                            size: 15,
                            size: screenwidth * 0.0364,
                          ),
                          Container(
                            margin: EdgeInsets.only(
//                                left: 4
                                left: screenwidth * 0.0097),
                            child: Text(
                              "${orderDetail.status}",
                              style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: orderDetail.status ==
                                          OrderStatus.cancelled
                                      ? Colors.red
                                      : orderDetail.status ==
                                              OrderStatus.delivered
                                          ? Palette.coffeeColor
                                          : Color(0xffE1C40D),
//                                  fontSize: 10.5
                                  fontSize: screenwidth * 0.0255)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
//                    bottom: 2.5
                    bottom: screenwidth * 0.00608),
                child: Text(
                  "Date: ${orderDetail.createdAt!.substring(0, 17)}",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w400,
                      color: darkgrey,
                      //      fontSize: 11.5
                      fontSize: screenwidth * 0.0279)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
//                    bottom: 4
                    bottom: screenwidth * 0.00973),
                child: Text(
                  "${orderDetail.deliveryTimeEnd}",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w400,
                      color: darkgrey,
//                      fontSize: 11.5
                      fontSize: screenwidth * 0.0279)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                //      size: 15,
                size: screenwidth * 0.0364,
                color: darkgrey,
              ),
              Container(
                margin: EdgeInsets.only(
//                    left: 4, bottom: 2.5
                    left: screenwidth * 0.0097,
                    bottom: screenwidth * 0.00608),
                child: Text(
                  (orderDetail.address == null)
                      ? "N/A"
                      : "${orderDetail.address?.addr1}",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w400,
                      color: coffeecolor,
                      decoration: TextDecoration.underline,
//                      fontSize: 11
                      fontSize: screenwidth * 0.0267)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
//                    bottom: 4
                    bottom: screenwidth * 0.00973),
                child: Text(
                  "${orderDetail.orderProductList?.length} items",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w400,
                      color: darkgrey.withOpacity(0.8),
//                      fontSize: 11
                      fontSize: screenwidth * 0.0267)),
                ),
              ),
            ],
          ),
          ListView.builder(
              itemCount: orderDetail.orderProductList!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                OrderProduct? orderProduct =
                    orderDetail.orderProductList?.elementAt(index);
                // print(orderProduct?.variant);
                if (orderProduct != null) {
                  return OrderDetailRow(
                    odp: orderProduct,
                  );
                }
                return SizedBox();
              }),
          totalpricebox(context)
        ],
      ),
    );
  }

  Widget totalpricebox(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
//          top:30
          top: screenwidth * 0.0729),
      width: screenwidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Text(
              "\$ ${orderDetail.cost}",
              style: getpoppins(TextStyle(
                  fontWeight: FontWeight.w500,
                  color: coffeecolor,
//                      fontSize: 20.5
                  fontSize: screenwidth * 0.0498)),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
//                horizontal: 22
                horizontal: screenwidth * 0.0535),
//            height: 31, width: 1.8,
            height: screenwidth * 0.0754, width: screenwidth * 0.00437,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.grey.withOpacity(0.5)),
          ),
          GestureDetector(
            onTap: () {
              //allow to cancel order if it is pending
              if (orderDetail.status == OrderStatus.pending) {
                // showDialog(
                //     context: context,
                //     builder: (_) {
                //       return ClipRRect(
                //           borderRadius: BorderRadius.all(Radius.circular(18)),
                //           child: SimpleDialog(
                //               shape: RoundedRectangleBorder(
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(18)),
                //               ),
                //               children: [
                //                 orderDetail.id != null
                //                     ? CancelOrderDialog(
                //                         orderId: orderDetail.id!,
                //                       )
                //                     : SizedBox()
                //               ]));
                //     });
              } else if (orderDetail.status == OrderStatus.delivered) {
                showDialog(
                    context: context,
                    builder: (_) {
                      return ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          child: SimpleDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                              children: [
                                orderDetail.id != null
                                    ? ReOrderDialog(
                                        orderId: orderDetail.id!,
                                        amount: orderDetail.cost,
                                      )
                                    : SizedBox()
                              ]));
                    });
              }
            },
            child: Container(
//            height: 31,width: 123,
              height: screenwidth * 0.0754, width: screenwidth * 0.299,
              decoration: BoxDecoration(
                  color: orderDetail.status == OrderStatus.delivered
                      ? Palette.coffeeColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: orderDetail.status == OrderStatus.delivered
                          ? Colors.black
                          : Colors.redAccent,
                      width: 1.5)),
              child: Center(
                child: Text(
                  getTextAccordingToStatus(),
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w400,
                      color: orderDetail.status == OrderStatus.delivered
                          ? Colors.white
                          : Colors.redAccent,
//                      fontSize: 12.5
                      fontSize: screenwidth * 0.0304)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  String getTextAccordingToStatus() {
    if (orderDetail.status == OrderStatus.pending) {
      return "In Progress";
    } else if (orderDetail.status == OrderStatus.delivered) {
      return "Re Order";
    }
    return orderDetail.status ?? "N/A";
  }
}
