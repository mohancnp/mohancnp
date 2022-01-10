import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class SingleOrder extends StatelessWidget {
  const SingleOrder({Key? key, required this.cartModel}) : super(key: key);
  final CartInstance cartModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(left: 28.w, right: 28.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 3),
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              top: 8.h,
              bottom: 8.h,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9.r),
              child: Image.network(
                "${AppConfig.webBaseUrl}/${cartModel.imageUri}",
                loadingBuilder: (context, widget, imageChunkEvent) {
                  if (imageChunkEvent == null) {
                    return widget;
                  } else {
                    return CircularProgressIndicator(
                      color: Palette.coffeeColor,
                    );
                  }
                },
                errorBuilder: (context, object, stackTrace) {
                  return Center(
                    child: Image.asset(
                      AppConfig.metroCoffeeLogoAssetPath,
                    ),
                  );
                },
                width: 84.w,
                height: 84.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 21.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: cartModel.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Palette.textColor,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text:
                        "${Currency.symbol} ${cartModel.totalPrice.toStringAsPrecision(3)}",
                    children: [
                      TextSpan(
                        text: " (${cartModel.qty})",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff550E1C),
                          fontSize: 16.sp,
                        ),
                      )
                    ],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff550E1C),
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(
                  width: 200.w,
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 2.0,
                    runSpacing: 1.0,
                    children: getListItems(cartModel),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> getListItems(CartInstance order) {
  var widgetList = [
    Text(
      "Size",
      style: TextStyle(
        fontWeight: FontWeight.w300,
        color: Palette.coffeeColor,
        fontSize: 12.sp,
      ),
    ),
    order.selectedProductType == null
        ? Text(
            "default",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Palette.coffeeColor,
              fontSize: 12.sp,
            ),
          )
        : Text(
            " ${order.selectedProductType!.name} ",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Palette.coffeeColor,
              fontSize: 12.sp,
            ),
          ),
  ];
  final toppings = List.generate(
    order.toppingsList.length,
    (index) {
      return Text(
        "| ${order.toppingsList[index].name}",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Palette.coffeeColor,
          fontSize: 12.sp,
        ),
      );
    },
  );
  widgetList.addAll(toppings);
  final addons = List.generate(
    order.addons.length,
    (index) {
      return Text(
        "| ${order.addons[index].name}",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Palette.coffeeColor,
          fontSize: 12.sp,
        ),
      );
    },
  );
  widgetList.addAll(addons);
  return widgetList;
}
