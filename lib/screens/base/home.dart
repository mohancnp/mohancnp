import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/screens/contents/homecontent/searchbar.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/drinks.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/snacks.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabview.dart';
import 'package:metrocoffee/screens/contents/homecontent/tophomegreeting.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth=MediaQuery.of(context).size.width;
    double screenheight=MediaQuery.of(context).size.height;
    return GetBuilder<HomeTabController>(
        initState: (v){
    },
    init: HomeTabController(),
    builder: (hometabcontroller){
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
//              body:
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                  child:SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                     child: Container(

                child:
                Stack(
                  children:[
                    Container(
                      //  height: 363,
                      width: screenheight,
                      child:Image.asset("assets/images/homebg.png",
                        width: screenheight,
                        color: Color(0xff550E1C),
                        fit: BoxFit.cover,),
                    ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TopHomeGreeting(),
                    SearchBar(),
                    HomeTabView(),
                    AnimatedSwitcher(duration: Duration(milliseconds: 250),
                    child:
                    hometabcontroller.currentpageindex==0?
                    DrinksTab():Snacks())
                  ],
                ),])
              )))
            )
          ],
        ));});
  }
}
