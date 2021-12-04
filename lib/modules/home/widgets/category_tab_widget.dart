import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/modules/home/home_controller.dart';
import 'package:metrocoffee/modules/home/widgets/categories_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';

class CategoryTab extends StatelessWidget {
  final String name;
  final bool? pressed;
  final String imagePath;
  final int? index;
  CategoryTab({
    Key? key,
    required this.name,
    required this.imagePath,
    this.pressed = false,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CategoriesController.to.setActiveCategory = index ?? 0;
        HomeController.to.getCategoryData();
      },
      child: AnimatedContainer(
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        duration: Duration(
          milliseconds: 400,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Image.asset(
                  "$imagePath",
                )),
            // SvgPicture.asset("assetName"),
            Center(
              child: Text(
                "$name",
                style: getpoppins(TextStyle(
                    color: pressed! ? Color(0xE5FFFFFF) : Color(0xFF344141),
                    fontSize: 12.sp,
                    fontFamily: poppinsregular)),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.r),
            boxShadow: pressed!
                ? [
                    BoxShadow(
                        color: Color(0x33550E1C),
                        offset: Offset(0, 3),
                        blurRadius: 6.r),
                  ]
                : [
                    BoxShadow(
                        color: Color(0x1A000000),
                        offset: Offset(0, 3),
                        blurRadius: 6.r),
                  ],
            color: pressed! ? coffeecolor : Colors.white),
      ),
    );
  }
}
