import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metrocoffee/screens/widgets/dialogs/order_succesful_dialog.dart';
class OrderSuccesfulPage extends StatelessWidget {
  const OrderSuccesfulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffEAEEEE),
      body: Container(
        height: screenheight,
        width: screenwidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OrderSuccesfulDialog()
          ],
        ),
      ),
    );
  }
}
