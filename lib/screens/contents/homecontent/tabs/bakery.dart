import 'package:flutter/material.dart';
import 'package:metrocoffee/core/enums/section.dart';
import 'package:metrocoffee/screens/widgets/product/first_home_product_row.dart';
import 'package:metrocoffee/screens/widgets/product/home_recommendations_most_pop.dart';
import 'package:metrocoffee/screens/widgets/product/home_smallrow.dart';

class Bakery extends StatelessWidget {
  const Bakery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          FirstHomeProductRow(page: 1),
          HomeRecPopRow(
            page: 1,
            section: Section.recommendation,
          ),
          HomeRecPopRow(
            page: 1,
            section: Section.mostPopular,
          ),
        ],
      ),
    );
  }
}
