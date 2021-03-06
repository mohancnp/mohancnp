import 'package:flutter/material.dart';
import 'package:metrocoffee/ui/src/fonts.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Material(
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
              //          horizontal: 12.5,vertical:12.5
              horizontal: screenwidth * 0.03041,
              vertical: screenwidth * 0.03041),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    backgroundColor: Colors.transparent,
                    value: 2,
                    strokeWidth: 1.25,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Loading, Please wait..",
                      style: TextStyle(
                          fontFamily: CustomFont.proximaNovaRegular,
                          color: Colors.black87,
                          fontSize: 16.5),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
