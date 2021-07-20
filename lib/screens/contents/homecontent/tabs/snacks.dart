import 'package:flutter/material.dart';
import 'package:metrocoffee/screens/widgets/product/first_home_product_row.dart';
import 'package:metrocoffee/screens/widgets/product/home_most_popular.dart';
import 'package:metrocoffee/screens/widgets/product/home_recommendations.dart';
import 'package:metrocoffee/screens/widgets/product/home_smallrow.dart';
class Snacks extends StatelessWidget {
  const Snacks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          FirstHomeProductRow(),
          HomeRecommendationRow(),
          HomeMostPopularRow()

        ],
      ),
    );
  }
}
