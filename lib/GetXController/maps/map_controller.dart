import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:metrocoffee/models/location.dart';

class MapController extends GetxController {
  Rx<CustomLocation> home =
      CustomLocation("2 Saint Street.st", "Park in United Kingdom", "N/A").obs;
  Rx<CustomLocation> work =
      CustomLocation("2 Saint Street.st", "Park in United Kingdom", "N/A").obs;
  Rx<CustomLocation> current =
      CustomLocation("Current location", "Current sublocation", "N/A").obs;
  Rx<CustomLocation> delivery =
      CustomLocation("choose delivery", "location", "N/A").obs;

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
    location.onLocationChanged.listen((LocationData currentLocation) {
      // setState(() {
      _locationData = currentLocation;
      // });
    });
    location.enableBackgroundMode(enable: true);
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
    return pm.last;
  }

  calculateDistanceBtn(LatLng lg1, LatLng lg2) {}

  void onMapCreated() {}
}
