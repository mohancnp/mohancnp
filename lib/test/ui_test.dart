import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UITest extends StatelessWidget {
  const UITest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return CustomBtnActionSheet();
                    });
              },
              child: Text("Click me"),
            )
          ],
        ),
      )),
    );
  }
}

class CustomBtnActionSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 300.h,
      decoration: BoxDecoration(
          color: Color(0xFFE9E9F8),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18))),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 133.w,
            height: 4.h,
            margin: EdgeInsets.only(top: 25,bottom: 18),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(2)),
          ),
          Column(
            children: [
              Action(
                  text: "Add to playlist",
                  assetIcon: "assets/images/testcanberemoved/paperplus.svg"),
              Action(
                  text: "Add to favorites",
                  assetIcon: "assets/images/testcanberemoved/heart.svg"),
              Action(
                  text: "Share",
                  assetIcon: "assets/images/testcanberemoved/send.svg"),
            ],
          ),
        ],
      ),
    );
  }
}

class Action extends StatelessWidget {
  final String text, assetIcon;

  Action({Key? key, required this.text, required this.assetIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 32,
        top: 22,
      ),
      color: Colors.transparent,
      child: Row(
        children: [
          SvgPicture.asset(
            assetIcon,
            width: 17.w,
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
