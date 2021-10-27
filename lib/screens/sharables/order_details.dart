import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/constants/instances.dart';
import 'package:metrocoffee/enums/uistate.dart';
import 'package:metrocoffee/models/order_data.dart';
import 'package:metrocoffee/screens/widgets/product/singletimeframeorderdetails.dart';
import 'package:metrocoffee/screens/widgets/product/timeframeorderdetails.dart';

import '../../theme.dart';

class OrderDetails extends StatefulWidget {
  final bool? reorder;

  const OrderDetails({Key? key, this.reorder}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  OrderDetail? orderDetail;
  UIState status = UIState.processing;
  int orderId = 0;
  @override
  void initState() {
    super.initState();
    orderId = Get.arguments;
    // print("received Id: $orderId");
    orderService.getOrderWithId(orderId).then((value) {
      if (value != null) {
        orderDetail = OrderDetail.fromJson(value['data']);
        setState(() {
          if (orderDetail == null) {
            status = UIState.passive;
          } else {
            status = UIState.completed;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
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
                  Navigator.pop(context);
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
            status == UIState.passive
                ? SizedBox()
                : (status == UIState.processing)
                    ? SpinKitCubeGrid(
                        color: coffeecolor,
                      )
                    : ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return TimeFrameOrderDetails(
                            index: index,
                            reorder: widget.reorder,
                            orderId: orderId,
                            orderDetail: orderDetail,
                          );
                        })
          ],
        ),
      ),
    );
  }
}
