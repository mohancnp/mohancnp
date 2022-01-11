import 'package:flutter/material.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/custom_text_theme.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class AddonsToppings extends StatelessWidget {
  final CartInstance order;
  const AddonsToppings({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 2.0,
        runSpacing: 1.0,
        children: [
          Text(
            "Size",
            style: Theme.of(context).textTheme.addonsWrapperTheme,
          ),
          order.selectedProductType == null
              ? Text("default",
                  style: Theme.of(context).textTheme.addonsWrapperTheme)
              : Text(" ${order.selectedProductType!.name}",
                  style: Theme.of(context).textTheme.addonsWrapperTheme),
          ...List.generate(
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
          ),
          ...List.generate(
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
          ),
          ...List.generate(
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
          )
        ],
      ),
    );
  }
}
