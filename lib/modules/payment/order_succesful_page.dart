import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/services.dart';
import 'package:metrocoffee/modules/payment/widgets/order_succesful_dialog.dart';

class OrderSuccesfulPage extends StatelessWidget {
  const OrderSuccesfulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAEEEE),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [OrderSuccesfulDialog()],
        ),
      ),
    );
  }
}
