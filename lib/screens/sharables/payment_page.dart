import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/payment/payment_page_controller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/widgets/payment/credit_card_box.dart';
import 'package:metrocoffee/screens/widgets/product/final_checkout_bottomnavigation.dart';

import '../../theme.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({Key? key}) : super(key: key);
  final PaymentPageController paymentPageController =
      Get.put(PaymentPageController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return GetBuilder<PaymentPageController>(
        initState: (v) {},
        init: PaymentPageController(),
        builder: (paymentpagecontroller) {
          return Scaffold(
            backgroundColor: Color(0xffF3F5F5),
            bottomNavigationBar: FinalCheckoutBottomNavigation(),
            body: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: EdgeInsets.only(bottom: 75),
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
                          "PAYMENT",
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w500,
                              color: darkgrey,
                              //      fontSize: 17
                              fontSize: screenwidth * 0.0413)),
                        ),
                      ),
                    ),
                    CreditCardBox(),
                    paymentpagecontroller.paymentoptions(context),
                    paymentpagecontroller.receiptemailswitchrow(context),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
