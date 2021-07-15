import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metrocoffee/screens/contents/homecontent/searchbar.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/drinks.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabview.dart';
import 'package:metrocoffee/screens/contents/homecontent/tophomegreeting.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth=MediaQuery.of(context).size.width;
    double screenheight=MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
              //  height: 363,
                width: screenheight,
                child:Image.asset("assets/images/Path 56@3x.png",
                  width: screenheight,
                color: Color(0xff550E1C),
                fit: BoxFit.cover,),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                  child:SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                     child: Container(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopHomeGreeting(),
                    SearchBar(),
                    HomeTabView(),
                    DrinksTab()
                  ],
                ),
              )))
            )
          ],
        ));
  }
}
