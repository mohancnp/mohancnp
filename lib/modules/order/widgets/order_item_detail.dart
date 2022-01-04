import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ItemDetail extends StatelessWidget {
  final CartInstance cartInstance;
  const ItemDetail({
    Key? key,
    required this.cartInstance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const dimText = Color(0xDE000000);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 6,
          child: Text(
            cartInstance.name,
            style: TextStyle(
              color: Palette.darkGery,
              fontSize: 12.sp,
              fontFamily: CustomFont.poppinsMedium,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            "${cartInstance.qty} item",
            style: TextStyle(
              color: const Color(0xAB000000),
              fontSize: 12.sp,
              fontFamily: CustomFont.poppinsRegular,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            "${Currency.symbol} ${cartInstance.totalPrice}",
            style: TextStyle(
              color: dimText,
              fontSize: 12.sp,
              fontFamily: CustomFont.poppinsRegular,
            ),
          ),
        ),
      ],
    );
  }
}
