import 'package:flutter/material.dart';
import 'package:metrocoffee/screens/widgets/product/cartproductcard.dart';

class UITest extends StatelessWidget {
  const UITest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: CartProductCard(),
      ),
    );
  }
}
