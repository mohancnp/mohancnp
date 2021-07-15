import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController{
  int currentpageindex=0;

  setpageindex(int index){
    currentpageindex=index;
    update();
  }
  Widget getcurrenttab(){
    return AnimatedSwitcher(duration: Duration(
      milliseconds: 250
    ),
    );
  }
}