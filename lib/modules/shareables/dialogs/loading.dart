import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      body: Container(
        width: screenwidth,
        height: screenheight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenwidth * 0.58,
              padding: EdgeInsets.symmetric(
//          horizontal: 12.5,vertical:12.5
                  horizontal: screenwidth * 0.03041,
                  vertical: screenwidth * 0.03041),
              decoration: BoxDecoration(
                color: Palette.pagebackgroundcolor,
                borderRadius: BorderRadius.all(Radius.circular(9)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 18),
                      height: 38,
                      width: 38,
                      color: Colors.transparent,
                      child: SpinKitFadingCircle(
                        color: Palette.coffeeColor,
                      )),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 24, bottom: 10),
                      child: Text(
                        "Loading, Please wait..",
                        style: TextStyle(
                            fontFamily: CustomFont.proximaNovaRegular,
                            color: Colors.black87,
                            fontSize: 16.5),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
