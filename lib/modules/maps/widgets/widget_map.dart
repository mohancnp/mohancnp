import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:metrocoffee/modules/maps/map_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';

Widget getSetOnMapFeild(size) {
  return Container(
    margin: EdgeInsets.only(top: 11),
    width: size.width * (302 / 375),
    height: size.width * (35 / 375),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: Color(0xFFF3F3F3),
    ),
    child: TextField(
      decoration: InputDecoration(
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        enabled: false,
        prefixIcon: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset(
                "assets/images/iconmappin.svg",
                height: 14.h,
                width: 14.w,
                fit: BoxFit.none,
                // color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'set on map',
                style: TextStyle(
                    color: Color(0xC2404D4D), fontWeight: FontWeight.w200),
              ),
            ),
          ],
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
      ),
    ),
  );
}

Widget getDeliveryAddressFeild(size) {
  return Container(
    height: 34.h,
    width: 302.w,
    margin: EdgeInsets.only(bottom: 18),
    decoration: BoxDecoration(
        color: Color(0xffF3F3F3), borderRadius: BorderRadius.circular(8)),
    child: TextField(
      decoration: InputDecoration(
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        enabled: false,
        prefixIcon: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.location_on,
                size: 11.w,
                color: Colors.red,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GetX<MapController>(builder: (mapC) {
                  var loc = mapC.current.value;
                  return Text(
                    "${loc.mainLocation},${loc.subLocation}",
                    style: getpoppins(TextStyle(fontSize: 11)),
                  );
                }),
              ),
            ),
          ],
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        // suffixIcon: ,
        // helperText: 'Address',
      ),
    ),
  );
}

Widget getSearchYourAddressFeild(size) {
  return Container(
    height: size.width * (34 / 375),
    width: size.width * (302 / 375),
    decoration: BoxDecoration(
        color: Color(0xFFE8E8E8), borderRadius: BorderRadius.circular(8)),
    child: TextField(
      decoration: InputDecoration(
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabled: false,
          prefixIcon: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.location_on_rounded,
                  size: 11.w,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'search your destination',
                  style: TextStyle(
                      color: Color(0xC2404D4D), fontWeight: FontWeight.w200),
                ),
              ),
            ],
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: Icon(
            CupertinoIcons.search,
            size: 13,
          )
          // suffixIcon: ,
          // helperText: 'Address',
          ),
    ),
  );
}
