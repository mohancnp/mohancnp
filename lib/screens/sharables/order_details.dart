import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/constants/instances.dart';
import 'package:metrocoffee/models/order_data.dart';
import 'package:metrocoffee/screens/widgets/product/singletimeframeorderdetails.dart';
import 'package:metrocoffee/screens/widgets/product/timeframeorderdetails.dart';

import '../../theme.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  OrderDetail? orderDetail;
  @override
  void initState() {
    super.initState();
    int orderId = Get.arguments ?? 0;
    print("receoved Id: $orderId");

    orderService.getOrderWithId(orderId).then((value) {
      if (value != null) {
        setState(() {
          orderDetail = OrderDetail.fromJson(value['data']);
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
            orderDetail == null
                ? SizedBox()
                : ListView.builder(
                    itemCount: 1,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return TimeFrameOrderDetails(
                        index: index,
                        orderDetail: orderDetail,
                      );
                    })
          ],
        ),
      ),
    );
  }
}
