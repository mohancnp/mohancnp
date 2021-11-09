import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/widgets/categories_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/home/widgets/category_tab_widget.dart';

class CategoriesTabs extends StatelessWidget {
  CategoriesTabs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF3F5F5),
      child: Container(
        margin: EdgeInsets.only(left: 28.w),
        // clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Category",
              style: TextStyle(fontSize: 15.sp, fontFamily: poppinssemibold),
            ),
            SizedBox(
              height: 17.h,
            ),
            SizedBox(
              height: 33.h,
              child: GetBuilder<CategoriesController>(
                  builder: (categoriesController) {
                return ListView.builder(
                    itemCount: categoriesController.categoryList.length,
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    itemBuilder: (context, index) {
                      var category =
                          categoriesController.categoryList.elementAt(index);
                      return CategoryTab(
                        name: category.name,
                        imagePath: category.imageUri,
                        pressed: category.selected,
                        index: index,
                      );
                    });
              }),
            )
          ],
        ),
      ),
    );
  }
}
