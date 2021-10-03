import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/models/order_data.dart';
import 'package:metrocoffee/screens/widgets/dialogs/cancel_order_dialog.dart';
import 'package:metrocoffee/screens/widgets/product/order_detail_row.dart';
import 'package:metrocoffee/theme.dart';

class TimeFrameOrderDetails extends StatelessWidget {
  final int? index;
  final OrderDetail? orderDetail;

  TimeFrameOrderDetails({Key? key, @required this.index, this.orderDetail})
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
                  "Order ID: #${orderDetail!.id}",
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
                            CupertinoIcons.timer_fill,
                            color: Color(0xffE1C40D),
//                            size: 15,
                            size: screenwidth * 0.0364,
                          ),
                          Container(
                            margin: EdgeInsets.only(
//                                left: 4
                                left: screenwidth * 0.0097),
                            child: Text(
                              "${orderDetail!.status}",
                              style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xffE1C40D),
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
                  "Date: ${orderDetail!.createdAt!.substring(0, 17)}",
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
                  "${orderDetail!.deliveryTimeEnd}",
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
                  "${orderDetail!.address!.addr1}",
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
                  "${orderDetail?.orderProductList?.length} items",
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
              itemCount: orderDetail?.orderProductList?.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                UserOrder? userOrder =
                    orderDetail?.orderProductList?.elementAt(index);
                return OrderDetailRow(index: index, userOrder: userOrder);
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
              "\$ ${orderDetail!.cost}",
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
              if (orderDetail?.status == "pending") {
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
                                //      AddCardDialog()
                                //   OrderSuccesfulDialog()
                                CancelOrderDialog(
                                  orderId: orderDetail?.id ?? 0,
                                )
                              ]));
                    });
              }
            },
            child: Container(
//            height: 31,width: 123,
              height: screenwidth * 0.0754, width: screenwidth * 0.299,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.redAccent, width: 1.5)),
              child: Center(
                child: Text(
                  orderDetail?.status == "pending"
                      ? "Cancel Order"
                      : "${orderDetail?.status}",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.redAccent,
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
}
