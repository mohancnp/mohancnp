import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/user_order_preference.dart';
import 'package:metrocoffee/ui/src/custom_text_theme.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import '../google_map_controller.dart';

class SetOnMapButton extends StatelessWidget {
  const SetOnMapButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 35.h,
      margin: const EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Palette.grieshWhite,
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
                  color: Palette.darkGrey1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Set on map',
                  style: Theme.of(context).textTheme.normalText,
                ),
              ),
            ],
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        ),
      ),
    );
  }
}

class AddressDetailWidget extends StatelessWidget {
  final String mainLocation;
  final String subLocation;
  final void Function() onEdit;
  final void Function() onDelete;
  final int onItemSelected;
  final UserOrderPreference? uop;

  const AddressDetailWidget({
    Key? key,
    required this.mainLocation,
    required this.subLocation,
    required this.onEdit,
    required this.onDelete,
    required this.onItemSelected,
    this.uop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomGoogleMapController.to.selectedAddressIndex = onItemSelected;
      },
      child: Obx(() {
        return AnimatedContainer(
          height: 72.h,
          width: 320.w,
          duration: const Duration(milliseconds: 500),
          padding: EdgeInsets.all(4.r),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: (onItemSelected ==
                        CustomGoogleMapController.to.selectedAddressIndex)
                    ? Palette.coffeeColor
                    : Colors.white,
              )),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50.r,
                    width: 50.r,
                    margin: EdgeInsets.only(left: 4.w),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.home,
                      color: Colors.black54,
                      size: 20.sp,
                    ),
                    decoration: BoxDecoration(
                      color: Palette.grieshWhite,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        mainLocation,
                        style: Theme.of(context).textTheme.normalTextHeading,
                      ),
                      Expanded(
                        child: Text(
                          subLocation,
                          style: Theme.of(context).textTheme.normalText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              (uop != null)
                  ? const SizedBox()
                  : Padding(
                      padding: EdgeInsets.only(right: 8.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: onEdit,
                            child: Icon(
                              Icons.edit,
                              size: 20.h,
                              color: Palette.darkGrey1,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          GestureDetector(
                            onTap: onDelete,
                            child: Icon(
                              CupertinoIcons.delete,
                              size: 20.h,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          ),
        );
      }),
    );
  }
}

class SearchDestinationBox extends StatelessWidget {
  final String? hintText;
  final bool textFeildEnabled;
  final void Function() onPressed;
  const SearchDestinationBox({
    Key? key,
    this.hintText,
    required this.onPressed,
    required this.textFeildEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 36.h,
        width: 320.w,
        decoration: BoxDecoration(
          color: Palette.grieshWhite,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: TextField(
          decoration: InputDecoration(
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              enabled: textFeildEnabled,
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
                      hintText ?? 'search your destination',
                      style: Theme.of(context).textTheme.normalText,
                    ),
                  ),
                ],
              ),
              prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
              suffixIcon: const Icon(
                CupertinoIcons.search,
                size: 13,
              )),
        ),
      ),
    );
  }
}

class CurrentAddressBox extends StatelessWidget {
  const CurrentAddressBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      width: 302.w,
      decoration: BoxDecoration(
          color: Palette.grieshWhite, borderRadius: BorderRadius.circular(8.r)),
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
              Obx(() {
                final controller = Get.find<CustomGoogleMapController>();
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    controller.currentLocation,
                    style: Theme.of(context).textTheme.normalText,
                  ),
                );
              }),
            ],
          ),
          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        ),
      ),
    );
  }
}
