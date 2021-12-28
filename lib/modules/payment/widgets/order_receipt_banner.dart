import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class CustomBanner extends StatelessWidget {
  final int orderId;
  const CustomBanner({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.coffeeColor,
      child: SizedBox(
        height: 86.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(
                  AppConfig.metroCoffeeLogoAssetPath,
                  width: 52.r,
                  height: 52.r,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Order ID: ",
                  children: [
                    TextSpan(
                      text: "#5432",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
