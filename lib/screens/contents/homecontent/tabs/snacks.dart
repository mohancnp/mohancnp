import 'package:flutter/material.dart';
import 'package:metrocoffee/core/enums/section.dart';
import 'package:metrocoffee/screens/widgets/product/first_home_product_row.dart';
import 'package:metrocoffee/screens/widgets/product/home_recommendations_most_pop.dart';
import 'package:metrocoffee/screens/widgets/product/home_smallrow.dart';

class Snacks extends StatelessWidget {
  const Snacks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          FirstHomeProductRow(page: 2),
          HomeRecPopRow(
            page: 2,
            section: Section.recommendation,
          ),
          HomeRecPopRow(
            page: 2,
            section: Section.mostPopular,
          ),
        ],
      ),
    );
  }
}
