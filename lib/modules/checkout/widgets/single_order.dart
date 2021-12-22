import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class SingleOrder extends StatelessWidget {
  const SingleOrder({Key? key, required this.cartModel}) : super(key: key);
  final CartInstance cartModel;
  @override
  Widget build(BuildContext context) {
    print(cartModel.selectedVariants);
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(left: 28.w, right: 28.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 3),
                blurRadius: 10)
          ]),
      child: Row(
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
                "${AppConfig.baseUrl}/${cartModel.imageUri}",
                loadingBuilder: (context, widget, imageChunkEvent) {
                  if (imageChunkEvent == null) {
                    return widget;
                  } else
                    return CircularProgressIndicator(
                      color: Palette.coffeeColor,
                    );
                },
                errorBuilder: (context, object, stackTrace) {
                  return Center(
                    child: Image.asset(
                      AppConfig.metroCoffeeLogoAssetPath,
                    ),
                  );
                },
                width: 85.w,
                height: 84.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.h, left: 21.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${cartModel.name} ",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Palette.textColor,
                    fontSize: 14.sp,
                  )),
                ),
                Text(
                  "${Currency.symbol} ${cartModel.totalPrice.toStringAsPrecision(3)}",
                  style: getpoppins(
                    TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff550E1C),
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Wrap(
                    direction: Axis.horizontal,
                    spacing: 2.0,
                    runSpacing: 1.0,
                    children: [
                      Text(
                        "Size",
                        style: getpoppins(
                          TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Palette.coffeeColor,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      Text(
                        " ${cartModel.selectedVariants.size} ",
                        style: getpoppins(
                          TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Palette.coffeeColor,
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                        child: ListView.builder(
                          itemCount: cartModel.toppingsList.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var cm = cartModel.toppingsList[index];
                            return Text(
                              "| ${cm.name}",
                              style: getpoppins(
                                TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Palette.coffeeColor,
                                  fontSize: 11.sp,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                        child: ListView.builder(
                          itemCount: cartModel.addons.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var cm = cartModel.addons[index];
                            return Text(
                              "| ${cm.name}",
                              style: getpoppins(
                                TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Palette.coffeeColor,
                                  fontSize: 11.sp,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
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
