// import 'package:dr_paani/src/services/geolocatorService.dart';

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';

// class UserLocation extends StatelessWidget {
//   UserLocation({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final currentPosition = Provider.of<Position>(context, listen: false);
//     GeoLocatorService userLocation =
//         Provider.of<GeoLocatorService>(context, listen: false);
//     userLocation.updateUserLocation(
//         currentPosition?.latitude, currentPosition?.longitude);
//     print("wht the hell !!");
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Change Location'),
//         ),
//         body: Consumer<GeoLocatorService>(builder: (context, value, _) {
//           return Column(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height / 1.2,
//                 width: MediaQuery.of(context).size.width,
//                 child: Stack(
//                   children: [
//                     UserMap(
//                       userLocation: value,
//                     ),
//                     Positioned(
//                       bottom: 10.0,
//                       left: 30.0,
//                       child: Container(
//                         margin: EdgeInsets.symmetric(vertical: 10),
//                         width: MediaQuery.of(context).size.width / 1.5,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(29),
//                           child: FlatButton(
//                             padding: EdgeInsets.symmetric(
//                                 vertical: 20, horizontal: 40),
//                             color: Colors.blue,
//                             onPressed: () async {
//                               await value.userAddress();
//                               Navigator.pop(context);
//                             },
//                             child: Text(
//                               "Confirm Location",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           );
//         }),
//       ),
//     );
//   }
// }

// class UserMap extends StatefulWidget {
//   UserMap({Key key, this.userLocation}) : super(key: key);
//   final GeoLocatorService userLocation;
//   @override
//   _UserMapState createState() => _UserMapState();
// }

// class _UserMapState extends State<UserMap> {
//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       mapToolbarEnabled: true,
//       mapType: MapType.normal,
//       initialCameraPosition: CameraPosition(
//           target: LatLng(widget.userLocation.userLatitude,
//               widget.userLocation.userLongitude),
//           zoom: 20.0),
//       zoomGesturesEnabled: true,
//       compassEnabled: true,
//       myLocationButtonEnabled: true,
//       myLocationEnabled: true,
//       circles: Set<Circle>.of([
//         Circle(
//             circleId: CircleId("currentLocation"),
//             radius: 20.0,
//             center: LatLng(widget.userLocation?.userLatitude,
//                 widget.userLocation?.userLongitude),
//             fillColor: Colors.grey.withOpacity(0.5),
//             strokeWidth: 2,
//             strokeColor: Colors.red)
//       ]),
//       markers: Set<Marker>.of(
//         <Marker>[
//           Marker(
//             onTap: () {
//               print('Tapped');
//             },
//             draggable: true,
//             markerId: MarkerId('Marker'),
//             position: LatLng(widget.userLocation.userLatitude,
//                 widget.userLocation.userLongitude),
//             onDragEnd: (newPosition) {
//               print("XXXXXXXXXXXXXXXXXXXxxxx");
//               widget.userLocation.updateUserLocation(
//                   newPosition.latitude, newPosition.longitude);
//               print("user new Lat :${widget.userLocation.userLatitude}");
//               print("user new Lng :${widget.userLocation.userLatitude}");
//               print(
//                   "${widget.userLocation.getDistance().toStringAsFixed(2)} km far away");
//             },
//           )
//         ],
//       ),
//     );
//   }
// }

// // GoogleMap(
// //           mapToolbarEnabled: true,
// //           onMapCreated: _onMapCreated,
// //           compassEnabled: true,
// //           mapType: MapType.normal,
// //           myLocationEnabled: true,
// //           myLocationButtonEnabled: true,
// //           markers: markers.toSet(),
// //           initialCameraPosition: CameraPosition(
// //             target: _center,
// //             zoom: 11.0,
// //           ),
// //         ),
