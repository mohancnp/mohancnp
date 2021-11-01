import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/categoriescontroller.dart';
import 'package:metrocoffee/screens/contents/homecontent/category_tab_widget.dart';

class CategoriesTabs extends StatelessWidget {
  CategoriesTabs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF3F5F5),
      child: Container(
        margin: EdgeInsets.only(top: 23.h, left: 28.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 7.h),
              child: Text(
                "Category",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 49.h,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.h),
                  child: GetBuilder<CategoriesController>(
                      builder: (categoriesController) {
                    return ListView.builder(
                        itemCount: categoriesController.categoryList.length,
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) {
                          var category = categoriesController.categoryList
                              .elementAt(index);
                          return CategoryTab(
                            name: category.name,
                            imagePath: category.imageUri,
                            pressed: category.selected,
                            index: index,
                          );
                        });
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
