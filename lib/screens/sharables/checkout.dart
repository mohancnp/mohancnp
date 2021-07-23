import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/checkout/checkoutcontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/widgets/product/cartproductcard.dart';
import 'package:metrocoffee/screens/widgets/product/checkouttopayments_bottom_nav.dart';
import 'package:metrocoffee/screens/widgets/product/final_checkout_bottomnavigation.dart';
import 'package:metrocoffee/theme.dart';

class CheckoutPage extends StatelessWidget {
  CheckoutPage({Key? key}) : super(key: key);
  final CheckoutController checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return GetBuilder<CheckoutController>(
        init: CheckoutController(),
        builder: (checkoutcontroller) {
          return Scaffold(
            bottomNavigationBar: CheckoutoPaymentsBottomNav(),
            backgroundColor: Color(0xffF3F5F5),
            body: SingleChildScrollView(
                child: Container(
              width: screenwidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        CupertinoIcons.back,
//                        size: 28,
                        size: screenwidth * 0.0681,
                        color: darkgrey,
                      ),
                    ),
                    title: Container(
                      child: Text(
                        "CHECKOUT",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: darkgrey,
                            //      fontSize: 17
                            fontSize: screenwidth * 0.0413)),
                      ),
                    ),
                  ),
                  Container(
                      width: screenwidth,
                      padding: EdgeInsets.symmetric(
                          //          horizontal: 22
                          horizontal: screenwidth * 0.0535),
                      child: ListView.builder(
                          itemCount: 1,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return CartProductCard(index: index);
                          })),
                  checkoutcontroller.checkoutlocation(context),
                  checkoutcontroller.setdeliverytime(context),
                  checkoutcontroller.orderconfirmationoptions(context),
                  checkoutcontroller.orderinstruction(context),
                ],
              ),
            )),
          );
        });
  }
}
