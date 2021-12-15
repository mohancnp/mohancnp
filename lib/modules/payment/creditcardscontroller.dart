import 'package:get/get.dart';
class CreditCardsController extends GetxController{
  String? currentcreditcardoption;

  setcurrentcreditcardoption(String creditcardoption){
    currentcreditcardoption=creditcardoption;
    update();
  }
}