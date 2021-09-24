import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/GetXController/checkout/checkoutcontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/enums/checkout_type.dart';
import 'package:metrocoffee/models/cart_data.dart';
import 'package:metrocoffee/models/order.dart';

import '../../../theme.dart';

class CheckoutoPaymentsBottomNav extends StatelessWidget {
  CheckoutType checkoutType;
  final List<CartData>? orders;

  CheckoutoPaymentsBottomNav(
      {Key? key, required this.checkoutType, this.orders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        //       vertical:18,
        //       horizontal: 16
        vertical: screenwidth * 0.0437,
        horizontal: screenwidth * 0.0389,
      ),
      width: screenwidth,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 25, offset: Offset(0, -6))
          ]),
      child: GetX<CheckoutController>(builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              //       height: 47,
              height: screenwidth * 0.1153,
              width: screenwidth * 0.4166,
              padding: EdgeInsets.symmetric(
                  //       horizontal: 22
                  horizontal: screenwidth * 0.0535),
              decoration: BoxDecoration(
                  color: darkgrey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffC3916A).withOpacity(0.25),
                        blurRadius: 30,
                        offset: Offset(0, 9))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    (checkoutType == CheckoutType.single)
                        ? "\$ ${controller.totalAmount}"
                        : "\$ 1.00",
                    style: getpoppins(TextStyle(
                        color: Colors.white,
                        //        fontSize: 16,
                        fontSize: screenwidth * 0.0389,
                        fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                print("${controller.addresses}${controller.timeFromEnd}");
                if (orders != null) {
                  Order order = new Order();
                  order.orderProductList
                      ?.add(orders!.elementAt(0).orderProducts);
                  order.addressId = controller.addresses.elementAt(0).id;
                  order.deliveryTimeFrom = controller.timeFromEnd.elementAt(0);
                  order.deliveryTimeEnd = controller.timeFromEnd.elementAt(1);
                  var status = await controller.sendOrderToServer(order);
                  if (status != null) {
                    Get.toNamed('/PaymentsPage');
                  } else {
                    final snackBar = SnackBar(
                      content: Text('Unable to place order try again'),
                      action: SnackBarAction(
                        label: 'close',
                        onPressed: () {
                          //code to do something
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else {
                  print('there is no order');
                }
                // Navigator.pushNamedAndRemoveUntil(
                //     context, "/PaymentsPage", (route) => true);
              },
              child: Container(
                //       height: 47,
                height: screenwidth * 0.1153,
                width: screenwidth * 0.4166,
                padding: EdgeInsets.symmetric(
                    //       horizontal: 22
                    horizontal: screenwidth * 0.0535),
                decoration: BoxDecoration(
                    color: coffeecolor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffC3916A).withOpacity(0.25),
                          blurRadius: 30,
                          offset: Offset(0, 9))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Check Out",
                      textAlign: TextAlign.center,
                      style: getpoppins(TextStyle(
                          color: Colors.white,
                          //        fontSize: 16,
                          fontSize: screenwidth * 0.0389,
                          fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
