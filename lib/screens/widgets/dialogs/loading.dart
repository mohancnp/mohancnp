import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Container(
        width: screenwidth,
        height: screenheight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Container(
          width: screenwidth*0.58,
        padding: EdgeInsets.symmetric(
//          horizontal: 12.5,vertical:12.5
        horizontal: screenwidth*0.03041,vertical:  screenwidth*0.03041
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(9)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 18),
                  height:38,width: 38,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    strokeWidth: 2.5,
                  ),
                ),

              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 24,bottom: 10),
                child: Text("Loading, Please wait..",style: TextStyle(
                    fontFamily: proximanovaregular,
                    color: Colors.black87,
                    fontSize: 16.5
                ),),
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
