import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class LoadingWidget extends StatelessWidget {
  final backgroundColor;
  const LoadingWidget({Key? key, this.backgroundColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Palette.pagebackgroundcolor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.only(top: 18.r),
              height: 38.r,
              width: 38.r,
              color: Colors.transparent,
              child: SpinKitFadingCircle(
                color: Palette.coffeeColor,
              )),
          Text("Please Wait...")
        ],
      ),
    );
  }
}
