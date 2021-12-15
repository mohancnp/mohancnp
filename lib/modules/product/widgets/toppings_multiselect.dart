import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:metrocoffee/modules/product/product_detail_page_controller.dart';
import 'package:multiselect/multiselect.dart';

class ToppingsMultiSelect extends StatefulWidget {
  const ToppingsMultiSelect({Key? key}) : super(key: key);

  @override
  State<ToppingsMultiSelect> createState() => _ToppingsMultiSelectState();
}

class _ToppingsMultiSelectState extends State<ToppingsMultiSelect> {
  List<String> selectedToppings = <String>[];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 28.w),
      child: DropDownMultiSelect(
        onChanged: (List<String> x) {
          setState(() {
            selectedToppings = x;
          });
          ProductDetailPageController.to.toppingStringList = x;
          ProductDetailPageController.to.calculateTotal();
          // print(x);
          //  .refreshToppingList(x);
        },
        options: ProductDetailPageController.to.getToppingsList(),
        selectedValues: selectedToppings,
        whenEmpty: 'Select Toppings',
      ),
    );
  }
}
