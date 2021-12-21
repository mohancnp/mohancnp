import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/order_status.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/profile/widgets/order_detail_row.dart';
import 'package:metrocoffee/modules/profile/widgets/reorder_dialog.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class TimeFrameOrderDetails extends StatelessWidget {
  final OrderDetail orderDetail;

  const TimeFrameOrderDetails({Key? key, required this.orderDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        left: screenwidth * 0.0535,
        right: screenwidth * 0.0535,
        top: screenwidth * 0.0389,
        bottom: screenwidth * 0.0486,
      ),
      padding: EdgeInsets.only(
          top: screenwidth * 0.0291,
          left: screenwidth * 0.0389,
          right: screenwidth * 0.0389,
          bottom: 24),
      decoration: BoxDecoration(
          color: const Color(0xffFBFBFB),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 10,
                offset: const Offset(0, 3))
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order ID: #${orderDetail.id}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: coffeecolor,
                   
                  fontSize: screenwidth * 0.0328,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: darkgrey,
                       
                      fontSize: screenwidth * 0.023,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        orderDetail.status == OrderStatus.cancelled
                            ? Icons.cancel_rounded
                            : CupertinoIcons.timer_fill,
                        color: orderDetail.status == OrderStatus.cancelled
                            ? Colors.red
                            : orderDetail.status == OrderStatus.delivered
                                ? Palette.coffeeColor
                                : const Color(0xffE1C40D),
                        size: screenwidth * 0.0364,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: screenwidth * 0.0097),
                        child: Text(
                          "${orderDetail.status}",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                             
                            color: orderDetail.status == OrderStatus.cancelled
                                ? Colors.red
                                : orderDetail.status == OrderStatus.delivered
                                    ? Palette.coffeeColor
                                    : const Color(0xffE1C40D),
                            fontSize: screenwidth * 0.0255,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: screenwidth * 0.00608),
                child: Text(
                  "Date: ${orderDetail.createdAt!.substring(0, 17)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: darkgrey,
                     
                    fontSize: screenwidth * 0.0279,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: screenwidth * 0.00973),
                child: Text(
                  "${orderDetail.deliveryTimeEnd}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                     
                    color: darkgrey,
                    fontSize: screenwidth * 0.0279,
                  ),
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
                size: screenwidth * 0.0364,
                color: darkgrey,
              ),
              Container(
                margin: EdgeInsets.only(
                    left: screenwidth * 0.0097, bottom: screenwidth * 0.00608),
                child: Text(
                  (orderDetail.address == null)
                      ? "N/A"
                      : "${orderDetail.address?.addr1}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: coffeecolor,
                    decoration: TextDecoration.underline,
                     
                    fontSize: screenwidth * 0.0267,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: screenwidth * 0.00973),
                child: Text(
                  "${orderDetail.orderProductList?.length} items",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: darkgrey.withOpacity(0.8),
                     
                    fontSize: screenwidth * 0.0267,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
              itemCount: orderDetail.orderProductList!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                OrderProduct? orderProduct =
                    orderDetail.orderProductList?.elementAt(index);

                if (orderProduct != null) {
                  return OrderDetailRow(
                    odp: orderProduct,
                  );
                }
                return const SizedBox();
              }),
          totalpricebox(context)
        ],
      ),
    );
  }

  Widget totalpricebox(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: screenwidth * 0.0729),
      width: screenwidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "\$ ${orderDetail.cost}",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: coffeecolor,
              fontSize: screenwidth * 0.0498,
               
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenwidth * 0.0535),
            height: screenwidth * 0.0754,
            width: screenwidth * 0.00437,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Colors.grey.withOpacity(0.5)),
          ),
          GestureDetector(
            onTap: () {
              if (orderDetail.status == OrderStatus.pending) {
              } else if (orderDetail.status == OrderStatus.delivered) {
                showDialog(
                    context: context,
                    builder: (_) {
                      return ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          child: SimpleDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                              children: [
                                orderDetail.id != null
                                    ? ReOrderDialog(
                                        orderId: orderDetail.id!,
                                        amount: orderDetail.cost,
                                      )
                                    : const SizedBox()
                              ]));
                    });
              }
            },
            child: Container(
              height: screenwidth * 0.0754,
              width: screenwidth * 0.299,
              decoration: BoxDecoration(
                  color: orderDetail.status == OrderStatus.delivered
                      ? Palette.coffeeColor
                      : Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: orderDetail.status == OrderStatus.delivered
                          ? Colors.black
                          : Colors.redAccent,
                      width: 1.5)),
              child: Center(
                child: Text(
                  getTextAccordingToStatus(),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                     
                    color: orderDetail.status == OrderStatus.delivered
                        ? Colors.white
                        : Colors.redAccent,
                    fontSize: screenwidth * 0.0304,
                  ),
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
