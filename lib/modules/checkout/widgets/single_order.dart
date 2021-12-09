import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/models/cart_model.dart';
import 'package:metrocoffee/resource/app_config.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class SingleOrder extends StatelessWidget {
  const SingleOrder({Key? key, required this.cartModel}) : super(key: key);
  final CartModel cartModel;
  @override
  Widget build(BuildContext context) {
    var extras = cartModel.extras.split(',');
    var options = jsonDecode(cartModel.options);
    // print(cartModel.extras.split(','));
    return Container(
      // width: 320.w,
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
              // clipBehavior: Clip.hardEdge,
              child: Image.network(
                "${AppConfig.baseUrl}${cartModel.imageUri}",
                loadingBuilder: (context, widget, imageChunkEvent) {
                  if (imageChunkEvent == null) {
                    return widget;
                  } else
                    return CircularProgressIndicator(
                      color: Palette.coffeeColor,
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
                    //       fontSize: 14.5
                    fontSize: 14.sp,
                  )),
                ),
                Text(
                  "\$ ${cartModel.price}",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff550E1C),
                      //      fontSize: 16
                      fontSize: 16.sp)),
                ),
                Row(
                  children: [
                    Text(
                      " ${cartModel.size} ",
                      style: getpoppins(
                        TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Palette.coffeeColor,
                            //         fontSize: 11.5
                            fontSize: 11.sp),
                      ),
                    ),
                    options.length > 0
                        ? Row(
                            children: [
                              Text(
                                " ${options[0]} ",
                                style: getpoppins(
                                  TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Palette.coffeeColor,
                                      //         fontSize: 11.5
                                      fontSize: 11.sp),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                    options.length > 1
                        ? Row(
                            children: [
                              Text(
                                "|",
                                style: getpoppins(
                                  TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Palette.coffeeColor,
                                      //         fontSize: 11.5
                                      fontSize: 11.sp),
                                ),
                              ),
                              Text(
                                " ${options[1]} ",
                                style: getpoppins(
                                  TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Palette.coffeeColor,
                                      //         fontSize: 11.5
                                      fontSize: 11.sp),
                                ),
                              ),
                              Text(
                                "|",
                                style: getpoppins(
                                  TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Palette.coffeeColor,
                                      //         fontSize: 11.5
                                      fontSize: 11.sp),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                    options.length > 2
                        ? Text(
                            " ${options[2]} ",
                            style: getpoppins(
                              TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Palette.coffeeColor,
                                  //         fontSize: 11.5
                                  fontSize: 11.sp),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
                Row(
                  children: [
                    extras.length > 0
                        ? Text(
                            "${extras[0]}",
                            style: getpoppins(
                              TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Palette.coffeeColor,
                                  //         fontSize: 11.5
                                  fontSize: 11.sp),
                            ),
                          )
                        : SizedBox(),
                    extras.length > 1
                        ? Row(
                            children: [
                              Text(
                                "|",
                                style: getpoppins(
                                  TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Palette.coffeeColor,
                                      //         fontSize: 11.5
                                      fontSize: 11.sp),
                                ),
                              ),
                              Text(
                                "${extras[1]} ",
                                style: getpoppins(
                                  TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: Palette.coffeeColor,
                                      //         fontSize: 11.5
                                      fontSize: 11.sp),
                                ),
                              ),
                            ],
                          )
                        : SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
