import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/home/widgets/categories_controller.dart';
import 'package:metrocoffee/modules/home/widgets/category_tab_widget.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/on_empty_widget.dart';

class CategoriesTabs extends GetView<CategoriesController> {
  CategoriesTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.pagebackgroundcolor,
      child: Container(
        margin: EdgeInsets.only(left: 28.w, top: 42.h),
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
              child: controller.obx(
                (categories) {
                  if (categories != null) {
                    return ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        itemBuilder: (context, index) {
                          var category = categories.elementAt(index);
                          // print(category);
                          return CategoryTab(
                            name: category.title,
                            imagePath: category.imageUri,
                            pressed: category.selected,
                            index: index,
                          );
                        });
                  }
                  return Text("No Categories");
                },
                onLoading: SizedBox(
                  child: SpinKitRing(
                    color: Palette.coffeeColor,
                    size: 20.r,
                  ),
                ),
                onEmpty: EmptyDataWidget(message: "Empty Categories"),
                onError: (error) => Text("$error"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
