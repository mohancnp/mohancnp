import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:metrocoffee/core/constants/company_detail.dart';
import 'package:metrocoffee/core/constants/google.dart';
import 'package:metrocoffee/core/models/older/map_location_model.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:metrocoffee/ui/src/palette.dart';

class CustomGoogleMapController extends GetxController {
  double? initLat, initLong;
  BitmapDescriptor? pinLocationIcon;
  static CustomGoogleMapController get to => Get.find();
  late Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final gController = Completer<GoogleMapController>();
  Rx<int> _selectedAddressIndex = 0.obs;
  late Location location;
  Rx<String> _currentLocation = "Search Your Destination".obs;
  List<MapLocation> selectedLocations = <MapLocation>[];
  bool circleFlag = false;
  RxList<AddressModel> userAddresses = <AddressModel>[
    // AddressModel(
    //     title: "Gants Hill Station",
    //     subtitle: "Crabrook Rd Shop is inside the station",
    //     mapLocation: MapLocation(
    //       51.5767841909041,
    //       0.0671225322487236,
    //     ))
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
    // update();
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

  setMarker() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
            '${Google.customMarkerIcon}')
        .then((onValue) {
      pinLocationIcon = onValue;
      var marker = Marker(
        markerId: MarkerId(Google.markerId),
        icon: pinLocationIcon == null
            ? BitmapDescriptor.defaultMarker
            : pinLocationIcon!,
        position: LatLng(
          initLat ?? CompanyDetail.lat,
          initLong ?? CompanyDetail.long,
        ),
        infoWindow: const InfoWindow(
            title: 'Metro Coffee Office', snippet: "United Kingdom"),
      );
      if (markers.length < 1) {
        markers.addAll({MarkerId(Google.markerId): marker});
        update();
      }
    });
  }

  updateMarker(Marker marker) {
    markers.update(MarkerId(Google.markerId), (value) => marker,
        ifAbsent: () => marker);
    update();
  }

  doOnCameraIdle() async {
    circleFlag = true;
    var marker = markers[MarkerId(Google.markerId)];
    var newMarker = Marker(
      draggable: false,
      icon: pinLocationIcon == null
          ? BitmapDescriptor.defaultMarker
          : pinLocationIcon!,
      markerId: MarkerId(Google.markerId),
      position: LatLng(marker!.position.latitude, marker.position.longitude),
      infoWindow: const InfoWindow(
        title: 'Metro Coffee  ',
      ),
    );
    updateMarker(newMarker);
    var addressList = await getSelectedLocationName(
        MapLocation(newMarker.position.latitude, newMarker.position.longitude));
    currentLocation = "${addressList[0]}  ${addressList[1]}";
  }

  doOnCameraStart() {}
  doOnCameraMove(CameraPosition data) {
    circleFlag = false;
    var marker = Marker(
      draggable: false,
      icon: pinLocationIcon == null
          ? BitmapDescriptor.defaultMarker
          : pinLocationIcon!,
      markerId: MarkerId(Google.markerId),
      position: LatLng(data.target.latitude, data.target.longitude),
      infoWindow: const InfoWindow(
        title: 'Metro Coffee ',
      ),
    );
    updateMarker(marker);
  }

  addOrUpdateLocation() async {
    var marker = markers[MarkerId(Google.markerId)];
    var maplocation = MapLocation(
      marker?.position.latitude ?? CompanyDetail.lat,
      marker?.position.longitude ?? CompanyDetail.long,
    );
    var addressList = await getSelectedLocationName(maplocation);
    currentLocation = "${addressList[0]}  ${addressList[1]}";
    var addressModel = AddressModel(
        title: addressList[0],
        subtitle: addressList[1],
        mapLocation: maplocation);
    if (initLat != null && initLong != null) {
      userAddresses[selectedAddressIndex] = addressModel;
    } else {
      userAddresses.add(addressModel);
    }
    userAddresses.refresh();
    Get.back();
  }

  Set<Circle> getCircles() {
    final circleSet = Set<Circle>.of([]);
    if (circleFlag) {
      circleSet.add(Circle(
        circleId: CircleId("currentLocation"),
        radius: 5,
        // visible: cgmapController.moving ? false : true,
        center: LatLng(
            markers[MarkerId(Google.markerId)]?.position.latitude ?? CompanyDetail.lat,
            markers[MarkerId(Google.markerId)]?.position.longitude ??
                CompanyDetail.long),
        fillColor: Palette.coffeeColor.withOpacity(0.8),
      ));
    } else {
      circleSet.clear();
    }
    return circleSet;
  }
}

class AddressModel {
  late String title;
  late String subtitle;
  late MapLocation mapLocation;
  AddressModel(
      {required this.title, required this.subtitle, required this.mapLocation});
}
