import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
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
                  backgroundColor: Colors.transparent,
                  value: 2,
                  strokeWidth: 1.25,
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 7,bottom: 10),
                  child: Text("Loading, Please wait..",style: TextStyle(
                    fontFamily: proximanovaregular,
                    color: Colors.black87,
                    fontSize: 16.5
                  ),),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
