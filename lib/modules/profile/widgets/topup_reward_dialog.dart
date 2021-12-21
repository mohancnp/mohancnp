import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metrocoffee/core/theme.dart';

class TopUpRewardDialog extends StatelessWidget {
  const TopUpRewardDialog({Key? key, this.rewardPoint}) : super(key: key);
  final String? rewardPoint;
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.03041),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  CupertinoIcons.xmark_circle,
                  color: darkgrey,
                  size: screenwidth * 0.0583,
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenwidth * 0.199,
                width: screenwidth * 0.199,
                decoration: const BoxDecoration(
                    color: Color(0xffEBEBEB), shape: BoxShape.circle),
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/badge.svg",
                    color: const Color(0xff5AB898),
                    width: screenwidth * 0.0827,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: screenwidth * 0.0389, bottom: screenwidth * 0.07055),
            child: Text(
              "Earn 100 reward points with\nevery pound spent.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenwidth * 0.0328,
                color: Colors.black87,
                 
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
