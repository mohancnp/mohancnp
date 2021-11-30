import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';

class NoNotificationPage extends StatelessWidget {
  const NoNotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UtilityInfoWidget(
        title: "You Are All Caught Up",
        content: "Looks like you do not have any notifications",
        onPressed: () {
          Get.find<BaseController>().setindex(0);
        },
        svgImageUri: UtilityIcons.illustrations,
        buttonText: "Start Browsing");
  }
}
