import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/GetXController/checkout/checkoutcontroller.dart';
import 'package:metrocoffee/GetXController/maps/map_controller.dart';
import 'package:metrocoffee/core/enums/uistate.dart';
import 'package:metrocoffee/models/location.dart';
import 'package:metrocoffee/models/profile.dart';
import 'package:metrocoffee/theme.dart';
import 'widgets/widget_map.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  //for draggable sheet control

  late BuildContext draggableContext;

  //map related

  Marker? source, destination;
  late GoogleMapController googleMapController;
  late Location location;
  Set<Marker> _markers = {};

  //variables for ui control

  double min = 0.4, initial = 0.7, max = 0.7;
  var _expanding = true;
  double containerH = 585.h, containerW = 338.w;
  double currentLat = 27.7172;
  double currentLong = 85.3240;
  //controller
  final MapController mapController = Get.find<MapController>();
  final CheckoutController checkoutController = Get.find<CheckoutController>();
  @override
  void initState() {
    location = new Location();
    mapController.getCurrentUserLocation(location).then((locationData) {
      currentLat = locationData.latitude ?? 27.7172;
      currentLong = locationData.longitude ?? 85.3240;

      mapController.getCurrentLocationName(locationData).then((placeMarkList) {
        geo.Placemark pm = placeMarkList.elementAt(0);

        mapController.current.value.mainLocation =
            "${pm.locality}${pm.subLocality}";
        mapController.current.value.subLocation = "${pm.name}${pm.street}";
        mapController.deliveryLocationList.add(mapController.current.value);

        setState(() {
          source = Marker(
              markerId: MarkerId("${locationData.latitude}"),
              infoWindow: InfoWindow(
                  title: "${pm.administrativeArea}", snippet: "${pm.locality}"),
              position: LatLng(locationData.latitude ?? currentLat,
                  locationData.longitude ?? currentLong));
        });
      });
      // print(locationData);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
            title: Text('SET LOCATION'),
            elevation: 0,
            foregroundColor: Colors.black.withOpacity(0.7),
            backgroundColor: Color(0xffF3F5F5),
            leading: GestureDetector(
                onTap: () async {
                  CustomLocation newLocation = mapController
                      .deliveryLocationList
                      .elementAt(mapController.selectedAddressIndex.value);
                  await mapController.addNewAddressToserver(newLocation);
                  await checkoutController.getLocations();
                  Get.back();
                },
                child: Icon(CupertinoIcons.back))),
        backgroundColor: Color(0xffF3F5F5),

        // extendBody: false,
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              markers: _markers,
              myLocationEnabled: true,
              // myLocationButtonEnabled: true,
              onLongPress: (latLong) async {
                geo.Placemark pm =
                    await mapController.getSelectedLocationNameWith(latLong);
                CustomLocation newLocation = CustomLocation(
                  "${pm.locality}${pm.subLocality}",
                  "${pm.name}${pm.street}",
                  latLong.latitude,
                  latLong.longitude,
                );
                mapController.addNewDeliveryLocation(newLocation);

                setState(() {
                  mapController.delivery.value.mainLocation = pm.locality!;
                  mapController.delivery.value.subLocation = pm.street!;
                  // print(pm.subThoroughfare);
                  _markers.clear();
                  _markers.add(Marker(
                      markerId: MarkerId(latLong.toString()),
                      infoWindow: InfoWindow(
                          title: "${pm.administrativeArea}",
                          snippet: "${pm.locality}"),
                      position: latLong));
                });
                // print("object");
              },
              onMapCreated: (GoogleMapController mapController) {
                _markers.add(source ??
                    Marker(
                        markerId: MarkerId('currentLocationMarker'),
                        position: LatLng(currentLat, currentLong)));
                googleMapController = mapController;
                // _markers.add(source);
                // _markers.add(destination);
              },
              initialCameraPosition: CameraPosition(
                  target: LatLng(currentLat, currentLong), zoom: 15),
            ),
            SizedBox.expand(
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: (c) {
                  if (c.extent > max * 0.8) {
                    // print('in betwwen');
                    setState(() {
                      _expanding = true;
                      initial = max;
                    });
                  } else if (c.extent <= max * 0.8) {
                    // print('down');
                    setState(() {
                      //expanding on drag
                      _expanding = false;
                    });
                  }
                  return false;
                },
                child: DraggableScrollableActuator(
                  child: DraggableScrollableSheet(
                      key: Key("$initial"),
                      minChildSize: min,
                      initialChildSize: initial,
                      // expand: false,
                      maxChildSize: max,
                      builder: (buildContext, controller) {
                        draggableContext = buildContext;
                        return Container(
                          width: containerW,
                          height: containerH,
                          margin:
                              EdgeInsets.only(left: 18, right: 18, bottom: 18),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(blurRadius: 30, offset: Offset(0, 6))
                              ]),
                          child: SingleChildScrollView(
                            controller: controller,
                            // physics: AlwaysScrollableScrollPhysics(),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 11, bottom: 20),
                                  width: size.width * (86 / 375),
                                  height: 2,
                                  color: Color(0xFF9B9B9B),
                                ),
                                Text(
                                  'Long press on the map to select an address of your choice',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 10),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 11, bottom: 10),
                                ),
                                getDeliveryAddressFeild(size),
                                _expanding
                                    ? getSearchYourAddressFeild(size)
                                    : SizedBox(),
                                _expanding == false
                                    ? Container(
                                        margin: EdgeInsets.only(
                                          top: 11,
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                            top: 11, bottom: 18),
                                        width: size.width * (290 / 375),
                                        height: 1,
                                        color: Color(0xFF9B9B9B),
                                        // decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(3),
                                        //     border:
                                        //         Border.all(color: Color(0xFF9B9B9B))),
                                      ),
                                Text(
                                  'double tap to select the address from below',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 8),
                                ),
                                SizedBox(
                                    width: size.width,
                                    height: 70.h,
                                    child: SelectedLocatioin(
                                      size: size,
                                    )
                                    //     GetX<MapController>(builder: (location) {
                                    //   // print(location.selectedAddressIndex);
                                    //   return ListView.builder(
                                    //       itemCount: location
                                    //           .deliveryLocationList.length,
                                    //       scrollDirection: Axis.vertical,
                                    //       physics:
                                    //           AlwaysScrollableScrollPhysics(),
                                    //       shrinkWrap: true,
                                    //       itemBuilder: (context, index) {
                                    //         CustomLocation cl = location
                                    //             .deliveryLocationList
                                    //             .elementAt(index);
                                    //         return SelectedLocatioin(size: size, cl: cl, mapController: mapController);
                                    //       });
                                    // }),
                                    ),
                                (_expanding == false)
                                    ? Container(
                                        margin: EdgeInsets.only(
                                          top: 18,
                                        ),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(top: 11),
                                        width: size.width * (290 / 375),
                                        height: 1,
                                        color: Color(0xFF9B9B9B),
                                      ),
                                _expanding
                                    ? GestureDetector(
                                        onTap: () {
                                          print(_expanding);
                                          setState(() {
                                            initial = _expanding ? min : max;
                                            _expanding = !_expanding;
                                            // print(initial);
                                          });
                                        },
                                        child: getSetOnMapFeild(size))
                                    : SizedBox()
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ));
  }
}

class SelectedLocatioin extends StatelessWidget {
  const SelectedLocatioin({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        // location.selectedAddressIndex
        //     .value = index;
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.w, left: 5.w, right: 5.w),
        decoration: BoxDecoration(
            color: Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(5),
            // border: Border.all(color: coffeecolor),
            boxShadow: [
              BoxShadow(
                  blurRadius: 10,
                  color: Color(0x08000000),
                  offset: Offset(0, 3))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Color(0xFFFEFEFE),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 3),
                        color: Color(0x08000000),
                        blurRadius: 10.r)
                  ]),
              child: Center(
                child: Icon(
                  Icons.work,
                  color: Color(0x6D6262),
                  //    size: 22,
                  size: size.width * 0.0535,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2 Saint Street. st",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                ),
                Text(
                  "Park In, United Kingdom",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
                )
              ],
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: 50.w,
              ),
            ),
            GestureDetector(
              onTap: () {
                // mapController.removeLocationWIthIndex(
                //   index,
                // );
              },
              child: Icon(
                CupertinoIcons.delete,
                color: Colors.redAccent,
                //       size: 19,
                size: size.width * 0.0462,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
