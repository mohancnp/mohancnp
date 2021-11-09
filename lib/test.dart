import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/placeholder_image.dart';
import 'package:metrocoffee/modules/home/widgets/newcard.dart';

class TestingScreen extends StatelessWidget {
  TestingScreen({Key? key}) : super(key: key);

  // final googleMapController = Get.put(MapController());
  // final checkoutController = Get.put(CheckoutController());
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: ProductCard(
          imageUri: imagePlaceholderUri,
          name: "Cafe Latte",
          id: 1,
          onPressed: () {},
          price: "3.00",
        ),
      ),
    );
  }
}
// GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(context, "/GoogleMapPage");
//           },
//           child: Center(
//             child: Text("Open Map"),
//           ),
//         ),
