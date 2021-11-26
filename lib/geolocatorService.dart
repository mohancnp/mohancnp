// import 'package:dr_paani/src/utils/utilities.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';

// class GeoLocatorService extends ChangeNotifier {
//   double _userLongitude = 27.700769;
//   double _userLatitude = 85.300140;
//   String _address;
//   double _warehouseLatitude = 27.7360;
//   double _warehouseLongitude = 85.3601;

//   double get userLongitude => _userLongitude;
//   double get userLatitude => _userLatitude;

//   String get getUserAddress => _address;

//   Future<void> userAddress() async {
//     Coordinates coordinates;
//     String prefUserLat = await Utilities.getPreferences("userLatitude");
//     String prefUserLng = await Utilities.getPreferences("userLongitude");
//     print(prefUserLng);
//     print(prefUserLat);
//     print('XXXWWWW');

//     if ((prefUserLat.isNotEmpty || prefUserLat == "") ||
//         (prefUserLng.isNotEmpty || prefUserLat == "")) {
//       coordinates =
//           new Coordinates(double.parse(prefUserLat), double.parse(prefUserLng));
//     } else {
//       coordinates = new Coordinates(_userLatitude, _userLongitude);
//     }

//     var addresses =
//         await Geocoder.local.findAddressesFromCoordinates(coordinates);
//     _address = addresses.first.featureName;
//     notifyListeners();
//   }

//   void updateUserLocation(double lat, double lng) async {
//     if (lat != null || lng != null) {
//       _userLatitude = lat;
//       _userLongitude = lng;
//       print(_userLatitude.toString() + _userLongitude.toString());
//       print("_____________________00");
//       await Utilities.setPreferences("userLatitude", _userLatitude.toString());
//       await Utilities.setPreferences(
//           "userLongitude", _userLongitude.toString());

//       notifyListeners();
//     }
//   }

//   Future<Position> getLocation() async {
//     return await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//   }

//   double getDistance() {
//     return (GeolocatorPlatform.instance.distanceBetween(
//           _userLatitude,
//           _userLongitude,
//           _warehouseLatitude,
//           _warehouseLongitude,
//         )) /
//         1000;
//   }
// }
