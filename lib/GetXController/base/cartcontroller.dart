import 'package:get/get.dart';

class CartController extends GetxController{
  int tabindex=0;

  settabindex(int index){
    tabindex=index;
    update();
  }

}