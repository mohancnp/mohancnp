import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/checkout/checkoutcontroller.dart';
import 'package:metrocoffee/GetXController/maps/map_controller.dart';
import 'package:metrocoffee/GetXController/productcontroller/productdetailscontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/enums/checkout_type.dart';
import 'package:metrocoffee/models/cart_data.dart';
import 'package:metrocoffee/models/profile.dart';
import 'package:metrocoffee/screens/widgets/product/cartproductcard.dart';
import 'package:metrocoffee/screens/widgets/product/checkouttopayments_bottom_nav.dart';
import 'package:metrocoffee/theme.dart';

class CheckoutPage extends StatelessWidget {
  final List<CartData>? orders;
  CheckoutPage({
    Key? key,
    this.orders,
  }) : super(key: key);
  final CheckoutController checkoutController = Get.put(CheckoutController());
  final MapController mapController = Get.put(MapController());
  int type = 1;

  @override
  Widget build(BuildContext context) {
    //0 self pickup and 1 delivery

    final ProductDetailController productDetailsController =
        Get.find<ProductDetailController>();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return GetBuilder<CheckoutController>(
        init: CheckoutController(),
        initState: (v) {
          type = Get.arguments;
        },
        builder: (checkoutcontroller) {
          // print(productDetailsController.orderProducts);

          return Scaffold(
            bottomNavigationBar: CheckoutoPaymentsBottomNav(
              orders: orders,
            ),
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
                      child: (orders != null)
                          ? ListView.builder(
                              itemCount: orders?.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return CartProductCard(
                                    index: index,
                                    tag: 1,
                                    cartData: orders?.elementAt(index));
                              })
                          : SizedBox(
                              child: Center(child: Text("no order selected")))),
                  (type == 1)
                      ? checkoutcontroller.checkoutlocation(context)
                      : checkoutController.companyLocation(context),
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
