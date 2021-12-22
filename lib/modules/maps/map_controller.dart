import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:metrocoffee/core/enums/ui_state.dart';
import 'package:metrocoffee/core/models/older/location.dart';

class MapController extends GetxController {
  Rx<CustomLocation> home = CustomLocation(
          "2 Saint Street.st", "Park in United Kingdom", 00.00, 00.9, "N/A")
      .obs;
  Rx<CustomLocation> work = CustomLocation(
          "2 Saint Street.st", "Park in United Kingdom", 00.00, 00.00, "N/A")
      .obs;
  Rx<CustomLocation> current = CustomLocation(
          "Current location", "Current sublocation", 00.00, 00.00, "N/A")
      .obs;
  Rx<CustomLocation> delivery =
      CustomLocation("choose delivery", "location", 00.00, 00.00, "N/A").obs;

  RxList<CustomLocation> deliveryLocationList = <CustomLocation>[].obs;
  Rx<int> selectedAddressIndex = 0.obs;
  Rx<UIState> uiState = UIState.passive.obs;
  double latitude = 51.5767841909041;
  double longitued = 0.0671225322487236;

  addNewLocationFromMap() {}

  addNewDeliveryLocation(CustomLocation customLocation) {
    deliveryLocationList.add(customLocation);
    deliveryLocationList.refresh();
  }

  removeLocationWIthIndex(int index) {
    deliveryLocationList.removeAt(index);
    deliveryLocationList.refresh();
  }

  Future getAllAddresses() async {}

  Future addNewAddressToserver(CustomLocation location) async {}

  CustomLocation getHomeLocation() {
    return home.value;
  }

  CustomLocation getWorkLocation() {
    return work.value;
  }

  CustomLocation getCurrentLocation() {
    return current.value;
  }

  CustomLocation getDeliveryLocation() {
    return delivery.value;
  }

  Future<LocationData> getCurrentUserLocation(location) async {
    late LocationData _locationData;
    late bool _serviceEnabled;
    late PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  Future<List<dynamic>> getCurrentLocationName(LocationData data) async {
    List<geo.Placemark> pm = await geo.placemarkFromCoordinates(
      data.latitude ?? latitude,
      data.longitude ?? longitued,
    );
    return pm;
  }

  Future<geo.Placemark> getSelectedLocationNameWith(LatLng latLng) async {
    List<geo.Placemark> pm =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    geo.Placemark pm1 = pm.elementAt(0);

    return pm1;
  }

  calculateDistanceBtn(LatLng lg1, LatLng lg2) {}

  void onMapCreated() {}
}
