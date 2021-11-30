import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/payment/add_card_controller.dart';

class AddCardDialog extends StatelessWidget {
  AddCardDialog({Key? key}) : super(key: key);
  final AddCardController addCardController = Get.put(AddCardController());
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<AddCardController>(
        initState: (v) {},
        init: AddCardController(),
        builder: (addcardcontroller) {
          return Container(
            padding: EdgeInsets.symmetric(
//          horizontal: 22,vertical: 12
                horizontal: screenwidth * 0.0535,
                vertical: screenwidth * 0.0291),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(9)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Add your card",
                        textAlign: TextAlign.center,
                        style: getpoppins(TextStyle(
                            letterSpacing: 0.4,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff054B83),
//                    fontSize: 14.5
                            fontSize: screenwidth * 0.0352)),
                      ),
                    ),
                  ],
                ),
                addcardcontroller.addcardtextfields(context)
              ],
            ),
          );
        });
  }
}
