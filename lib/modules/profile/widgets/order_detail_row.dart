import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/models/order_detail.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class OrderDetailRow extends StatelessWidget {
  final OrderItem order;
  const OrderDetailRow({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 375.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.productName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: darkgrey,
                  fontSize: 12.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 90.w),
                    child: Text(
                      "${order.productQty} item",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: darkgrey.withOpacity(0.8),
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                  Text(
                    Currency.symbol + getItemSubTotal(order).toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: darkgrey.withOpacity(0.8),
                      fontSize: 8.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            width: 200.w,
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 2.0,
              runSpacing: 1.0,
              alignment: WrapAlignment.start,
              children: getListItems(order),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            width: 375.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: darkgrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.r),
            ),
          )
        ],
      ),
    );
  }
}

double getItemSubTotal(OrderItem order) {
  double subTotal = order.productPrice;
  for (var item in order.toppings) {
    subTotal += item.price;
  }
  for (var item in order.addons) {
    subTotal += item.price;
  }
  // print(subTotal);
  return double.parse((subTotal * order.productQty).toStringAsFixed(3));
}

List<Widget> getListItems(OrderItem order) {
  var widgetList = [
    Text(
      "Size",
      style: TextStyle(
        fontWeight: FontWeight.w300,
        color: Palette.coffeeColor,
        fontSize: 12.sp,
      ),
    ),
    Text(
      " ${order.productSize} ",
      style: TextStyle(
        fontWeight: FontWeight.w300,
        color: Palette.coffeeColor,
        fontSize: 12.sp,
      ),
    ),
  ];
  final toppings = List.generate(order.toppings.length, (index) {
    return Text("| ${order.toppings[index].name}",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Palette.coffeeColor,
          fontSize: 12.sp,
        ));
  });
  widgetList.addAll(toppings);
  final addons = List.generate(order.addons.length, (index) {
    return Text("| ${order.addons[index].name}",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: Palette.coffeeColor,
          fontSize: 12.sp,
        ));
  });
  widgetList.addAll(addons);
  return widgetList;
}
