import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:metrocoffee/core/constants/company_detail.dart';
import 'package:metrocoffee/core/constants/google.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/map_location.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';
import 'package:metrocoffee/core/services/checkout_service/checkout_service.dart';
import 'package:metrocoffee/modules/checkout/checkout_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/debug_printer.dart';

class CustomGoogleMapController extends GetxController {
  double? initLat, initLong;
  BitmapDescriptor? pinLocationIcon;
  static CustomGoogleMapController get to => Get.find();
  late Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final gController = Completer<GoogleMapController>();
  final Rx<int> _selectedAddressIndex = 0.obs;
  late Location location;
  final Rx<String> _currentLocation = "Search Your Destination".obs;
  List<MapLocation> selectedLocations = <MapLocation>[];
  bool circleFlag = false;
  final _checkoutService = locator<CheckoutService>();
  final _checkoutPageController = Get.find<CheckoutPageController>();

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
    var location = Location();

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

  setMarker() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(devicePixelRatio: 2.5),
            Google.customMarkerIcon)
        .then((onValue) {
      pinLocationIcon = onValue;
      var marker = Marker(
        markerId: const MarkerId(Google.markerId),
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
      if (markers.isEmpty) {
        markers.addAll({const MarkerId(Google.markerId): marker});
        update();
      }
    });
  }

  updateMarker(Marker marker) {
    markers.update(const MarkerId(Google.markerId), (value) => marker,
        ifAbsent: () => marker);
    update();
  }

  doOnCameraIdle() async {
    circleFlag = true;
    var marker = markers[const MarkerId(Google.markerId)];
    var newMarker = Marker(
      draggable: false,
      icon: pinLocationIcon == null
          ? BitmapDescriptor.defaultMarker
          : pinLocationIcon!,
      markerId: const MarkerId(Google.markerId),
      position: LatLng(marker!.position.latitude, marker.position.longitude),
      infoWindow: const InfoWindow(
        title: 'Metro Coffee ',
      ),
    );
    updateMarker(newMarker);
    var addressList = await getSelectedLocationName(MapLocation(
        lat: newMarker.position.latitude, long: newMarker.position.longitude));
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
      markerId: const MarkerId(Google.markerId),
      position: LatLng(data.target.latitude, data.target.longitude),
      infoWindow: const InfoWindow(
        title: 'Metro Coffee ',
      ),
    );
    updateMarker(marker);
  }

  Future<void> addOrUpdateLocation({int? idToUpdate, int? index}) async {
    showCustomDialog(message: "updating address detail");
    final marker = markers[const MarkerId(Google.markerId)];
    final maplocation = MapLocation(
      lat: marker?.position.latitude ?? CompanyDetail.lat,
      long: marker?.position.longitude ?? CompanyDetail.long,
    );
    final addressList = await getSelectedLocationName(maplocation);
    currentLocation = "${addressList[0]}  ${addressList[1]}";
    final addressModel = AddressModel(
      title: addressList[0],
      subtitle: addressList[1],
      mapLocation: maplocation,
    );

    final shippingAddress = ShippingAddress(
      id: idToUpdate,
      title: addressModel.title,
      subtitle: addressModel.subtitle,
      lattitude: maplocation.lat,
      longitude: maplocation.long,
    );
    if (initLat != null && initLong != null) {
      /*IN CASE OF UPDATE*/
      // userAddresses[selectedAddressIndex] = addressModel;
      if (idToUpdate != null) {
        final response = await _checkoutService.updateUserAddress(
            id: idToUpdate, data: shippingAddress.toJson());
        response.fold((sucess) {
          dPrint("sucessfully updated");
          if (index != null) {
            shippingAddress.id = idToUpdate;
            _checkoutPageController.shippingAddresses[index] = shippingAddress;
          }
        }, (failure) => dPrint("error updating address"));
      }
    } else {
      /*IN CASE OF New address*/
      final response =
          await _checkoutService.addShippingAddress(shippingAddress.toJson());
      response.fold((sucess) {
        dPrint(sucess);
      }, (failure) {
        dPrint(failure.message);
      });
      _checkoutPageController.shippingAddresses.clear();
      final newResponse = await _checkoutService.getShippingAddresses();
      newResponse.fold((newShippingAddressList) {
        _checkoutPageController.shippingAddresses.value =
            newShippingAddressList;
      }, (failure) => dPrint("failure retreiving data"));
    }
    _checkoutPageController.shippingAddresses.refresh();
    removeDialog();
    Get.back();
  }

  void removeDialog() => Get.back();

  Set<Circle> getCircles() {
    final circleSet = <Circle>{};
    if (circleFlag) {
      circleSet.add(Circle(
        circleId: const CircleId("currentLocation"),
        radius: 5,
        // visible: cgmapController.moving ? false : true,
        center: LatLng(
            markers[const MarkerId(Google.markerId)]?.position.latitude ??
                CompanyDetail.lat,
            markers[const MarkerId(Google.markerId)]?.position.longitude ??
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
