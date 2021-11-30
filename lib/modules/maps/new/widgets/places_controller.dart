import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_place/google_place.dart';
import 'package:metrocoffee/core/constants/google_api_key.dart';

class PlacesApiController extends GetxController {
  List<AutocompletePrediction>? predictions = [];
  final TextEditingController textEditingController = TextEditingController();
  void autoCompleteSearch() async {
    print(textEditingController.text); 
    var result = await GooglePlace(placesApiKey)
        .autocomplete
        .get(textEditingController.text);
    // print(result?.status);
    if (result != null && result.predictions != null) {
      predictions = result.predictions;
      // print(predictions);
      update();
    }
  }
}
