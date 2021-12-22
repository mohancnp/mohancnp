import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/maps/map.dart';

class InitialMap extends StatelessWidget {
  const InitialMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: MaterialButton(
          onPressed: () {
            Get.to(() => const GoogleMapScreen());
          },
          child: const Text("Goto Map"),
        ),
      ),
    );
  }
}
