import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_place/google_place.dart';
import 'package:metrocoffee/core/constants/google.dart';

class PlacesApiController extends GetxController {
  List<AutocompletePrediction>? predictions = [];
  final TextEditingController textEditingController = TextEditingController();
  void autoCompleteSearch() async {
    var result = await GooglePlace(Google.placesApiKey)
        .autocomplete
        .get(textEditingController.text);
    if (result != null && result.predictions != null) {
      predictions = result.predictions;
      update();
    }
  }
}
