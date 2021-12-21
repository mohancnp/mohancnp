import 'package:get/get.dart';

class CreditCardsController extends GetxController {
  String? currentcreditcardoption;

  setCurrentCreditCardOption(String creditcardoption) {
    currentcreditcardoption = creditcardoption;
    update();
  }
}
