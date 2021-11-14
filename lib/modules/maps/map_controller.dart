import 'dart:convert';

import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:metrocoffee/core/enums/uistate.dart';
import 'package:metrocoffee/models/location.dart';
import 'package:metrocoffee/models/profile.dart';

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
  RxList<Address> addresses = <Address>[].obs;
  addNewLocationFromMap() {}

  addNewDeliveryLocation(CustomLocation customLocation) {
    deliveryLocationList.add(customLocation);
    deliveryLocationList.refresh();
  }

  removeLocationWIthIndex(int index) {
    deliveryLocationList.removeAt(index);
    deliveryLocationList.refresh();
  }

  Future getAllAddresses() async {
    // var response = await addressService.getAddresses();
    // if (response != null) {
    //   List<dynamic> addresses = response['data']['data'];
    //   addresses.forEach((element) {
    //     this.addresses.add(Address.fromJson(element));
    //   });
    //   this.addresses.refresh();
    // }
  }

  Future addNewAddressToserver(CustomLocation location) async {
    // uiState.value = UIState.processing;

    // var dataToAdd = {
    //   "addr_1": "${location.mainLocation}",
    //   "addr_2": "${location.subLocation}",
    //   "map": "not available yet",
    //   "lat": location.lat,
    //   "lang": location.long,
    //   "phone": "9878678908",
    //   "instruction": "no instrcutions"
    // };
    // bool status = await addressService.addAddress(dataToAdd);
    // if (status) {
    //   print("address added");
    //   uiState.value = UIState.completed;
    // } else {
    //   uiState.value = UIState.error;
    // }
  }

  CustomLocation getHomeLocation() {
    return this.home.value;
  }

  CustomLocation getWorkLocation() {
    return this.work.value;
  }

  CustomLocation getCurrentLocation() {
    return this.current.value;
  }

  CustomLocation getDeliveryLocation() {
    return this.delivery.value;
  }

  Future<LocationData> getCurrentUserLocation(location) async {
    late LocationData _locationData;
    late bool _serviceEnabled;
    late PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print('permission is denied');
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print('permission is denied');
      }
    }
    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   // setState(() {
    //   _locationData = currentLocation;
    //   // });
    // });
    // location.enableBackgroundMode(enable: true);
    _locationData = await location.getLocation();
    return _locationData;
  }

  Future<List<dynamic>> getCurrentLocationName(LocationData data) async {
    List<geo.Placemark> pm = await geo.placemarkFromCoordinates(
        data.latitude ?? 27.7172, data.longitude ?? 85.3240);
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
