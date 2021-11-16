import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';

class SomeThingWentWrongPage extends StatelessWidget {
  const SomeThingWentWrongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UtilityInfoWidget(
        title: "Oops!",
        content: "Something went wrong please try again.",
        onPressed: () {
          Get.toNamed(PageName.homepage);
          Get.find<BaseController>().currentindex = 0;
        },
        svgImageUri: UtilityIcons.somethingWrong,
        buttonText: "Try Again");
  }
}
