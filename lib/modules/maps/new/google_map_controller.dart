import 'dart:async';
import 'package:flutter_animarker/core/ripple_marker.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:metrocoffee/core/models/map_location_model.dart';
import 'package:geocoding/geocoding.dart' as geo;

class CustomGoogleMapController extends GetxController {
  double companyLatitude = 51.5767841909041;
  double companyLongitued = 0.0671225322487236;
  late Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final gController = Completer<GoogleMapController>();
  Rx<int> _selectedAddressIndex = 0.obs;
  late Location location;
  Rx<String> _currentLocation = "Search Your Destination".obs;
  List<MapLocation> selectedLocations = <MapLocation>[];

  RxList<AddressModel> userAddresses = <AddressModel>[
    AddressModel(
        title: "Gants Hill Station",
        subtitle: "Crabrook Rd Shop is inside the station",
        mapLocation: MapLocation(
          51.5767841909041,
          0.0671225322487236,
        ))
  ].obs;

  Future<List<String>> getSelectedLocationName(MapLocation mapLocation) async {
    List<geo.Placemark> pm =
        await geo.placemarkFromCoordinates(mapLocation.lat, mapLocation.long);
    geo.Placemark pm1 = pm.elementAt(0);
    geo.Placemark pm2 = pm.elementAt(1);

    var firstAdress = pm1.street ?? "Not Available ";
    var secondAddress = pm2.thoroughfare ??
        pm2.subThoroughfare ??
        pm2.subAdministrativeArea ??
        pm2.locality ??
        pm2.subLocality ??
        "Not Available ";
    return [firstAdress, secondAddress];
  }

  set currentLocation(String c) {
    _currentLocation.value = c;
  }

  String get currentLocation {
    return _currentLocation.value;
  }

  set selectedAddressIndex(int c) {
    _selectedAddressIndex.value = c;
  }

  int get selectedAddressIndex {
    return _selectedAddressIndex.value;
  }

  Future<LocationData> getCurrentUserLocation() async {
    late LocationData _locationData;
    late bool _serviceEnabled;
    late PermissionStatus _permissionGranted;
    var location = new Location();

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
    _locationData = await location.getLocation();
    return _locationData;
  }

  setMarker(double? lat, double? long) {
    var marker = RippleMarker(
      markerId: MarkerId("MetroMarker"),
      position: LatLng(lat ?? companyLatitude, long ?? companyLongitued),
      infoWindow: const InfoWindow(
        title: 'Metro Coffee ',
      ),
    );
    if (markers.length < 1) {
      markers.update(MarkerId("MetroMarker"), (value) => marker,
          ifAbsent: () => marker);
      update();
    }
  }

  updateMarker(Marker marker) {
    markers.update(MarkerId("MetroMarker"), (value) => marker,
        ifAbsent: () => marker);
    // print("RIPPLE:${marker}");
    update();
  }
}

class AddressModel {
  late String title;
  late String subtitle;
  late MapLocation mapLocation;
  AddressModel(
      {required this.title, required this.subtitle, required this.mapLocation});
}
