import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/payment/creditcardscontroller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/screens/widgets/dialogs/add_card_dialog.dart';
import 'package:metrocoffee/core/theme.dart';

class CreditCardBox extends StatelessWidget {
  CreditCardBox({Key? key}) : super(key: key);
  final CreditCardsController creditCardsController =
      Get.put(CreditCardsController());

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<CreditCardsController>(
        initState: (v) {},
        init: CreditCardsController(),
        builder: (creditcardscontroller) {
          return Container(
            width: screenwidth,
            margin: EdgeInsets.only(
                left: screenwidth * 0.05352,
                right: screenwidth * 0.05352,
//            top: 28,bottom: 14
                top: screenwidth * 0.0681,
                bottom: screenwidth * 0.0340),
            padding: EdgeInsets.symmetric(
//                horizontal: 17, vertical: 15.5
                horizontal: screenwidth * 0.0413,
                vertical: screenwidth * 0.0377),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Credit Card",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.black87,
                            //      fontSize: 14.5
                            fontSize: screenwidth * 0.0352)),
                      ),
                    ),
                    Icon(
                      CupertinoIcons.chevron_up,
                      color: Colors.grey[750],
//                      size: 21,
                      size: screenwidth * 0.051,
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
//                      top: 14.5
                      top: screenwidth * 0.0352),
                  width: screenwidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          creditcardscontroller
                              .setcurrentcreditcardoption("visa");
                        },
                        child: AnimatedContainer(
                          padding: EdgeInsets.symmetric(
//                    horizontal: 9.5, vertical: 4
                              horizontal: screenwidth * 0.0231,
                              vertical: screenwidth * 0.0097),
                          duration: Duration(milliseconds: 250),
                          //         height: 40,width: 77,
                          height: screenwidth * 0.0973,
                          width: screenwidth * 0.187,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                  color: creditcardscontroller
                                              .currentcreditcardoption ==
                                          "visa"
                                      ? coffeecolor
                                      : Color(0x70707061),
                                  width: creditcardscontroller
                                              .currentcreditcardoption ==
                                          "visa"
                                      ? 1.7
                                      : 1)),
                          child: Center(
                            child: Image.asset(
                              "assets/images/paymentimages/favpng_visa-debit-card-credit-card-logo-mastercard@3x.png",
//                  width: 53,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          creditcardscontroller
                              .setcurrentcreditcardoption("mastercard");
                        },
                        child: AnimatedContainer(
                          padding: EdgeInsets.symmetric(
//                    horizontal: 9.5, vertical: 4
                              horizontal: screenwidth * 0.0231,
                              vertical: screenwidth * 0.0097),
                          duration: Duration(milliseconds: 250),
                          //             height: 40,width: 77,
                          height: screenwidth * 0.0973,
                          width: screenwidth * 0.187,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                  color: creditcardscontroller
                                              .currentcreditcardoption ==
                                          "mastercard"
                                      ? coffeecolor
                                      : Color(0x70707061),
                                  width: creditcardscontroller
                                              .currentcreditcardoption ==
                                          "mastercard"
                                      ? 1.7
                                      : 1)),
                          child: Center(
                            child: Image.asset(
                              "assets/images/productimages/mastercard.png",
//                  width: 53,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          creditcardscontroller
                              .setcurrentcreditcardoption("paypal");
                        },
                        child: AnimatedContainer(
                          padding: EdgeInsets.symmetric(
//                    horizontal: 9.5, vertical: 4
                              horizontal: screenwidth * 0.0231,
                              vertical: screenwidth * 0.0170),
                          duration: Duration(milliseconds: 250),
//                height: 40,width: 77,
                          height: screenwidth * 0.0973,
                          width: screenwidth * 0.187,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              border: Border.all(
                                  color: creditcardscontroller
                                              .currentcreditcardoption ==
                                          "paypal"
                                      ? coffeecolor
                                      : Color(0x70707061),
                                  width: creditcardscontroller
                                              .currentcreditcardoption ==
                                          "paypal"
                                      ? 1.7
                                      : 1)),
                          child: Center(
                            child: Image.asset(
                              "assets/images/paymentimages/paypal@3x.png",
//                  width: 53,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
//                      top: 27
                      top: screenwidth * 0.0656),
                  child: Image.asset(
                    "assets/images/paymentimages/creditcardpic.png",
                    width: screenwidth,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18)),
                              child: SimpleDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18)),
                                  ),
                                  children: [
                                    //      AddCardDialog()
                                    //   OrderSuccesfulDialog()
                                    //  CancelOrderDialog()
                                    AddCardDialog()
                                  ]));
                        });
                  },
                  child: Container(
                    margin: EdgeInsets.only(
//                      top: 14
                        top: screenwidth * 0.0340),
                    child: Text(
                      "add new card",
                      textAlign: TextAlign.center,
                      style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.6,
                          color: Color(0xff054B83),
                          //      fontSize: 17
//                        fontSize: 14.5
                          fontSize: screenwidth * 0.0352)),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
