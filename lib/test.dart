import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/checkout/checkoutcontroller.dart';
import 'package:metrocoffee/GetXController/maps/map_controller.dart';

class TestingScreen extends StatelessWidget {
  TestingScreen({Key? key}) : super(key: key);

  final googleMapController = Get.put(MapController());
  final checkoutController = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/GoogleMapPage");
          },
          child: Center(
            child: Text("Open Map"),
          ),
        ),
      ),
    );
  }
}
