import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:metrocoffee/modules/maps/map_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

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
  final Set<Marker> _markers = {};

  //variables for ui control
  double min = 0.4, initial = 0.7, max = 0.7;
  var _expanding = true;
  double containerH = 585.h, containerW = 338.w;
  // double currentLat = 27.7172;
  // double currentLong = 85.3240;
  double latitude = 51.5767841909041;
  double longitued = 0.0671225322487236;

  //controller
  final MapController mapController = Get.find<MapController>();

  // final CheckoutController checkoutController = Get.find<CheckoutController>();
  @override
  void initState() {
    // location = new Location();
    // mapController.getCurrentUserLocation(location).then((locationData) {
    //   currentLat = locationData.latitude ?? latitude;
    //   currentLong = locationData.longitude ?? longitued;

    //   mapController.getCurrentLocationName(locationData).then((placeMarkList) {
    //     geo.Placemark pm = placeMarkList.elementAt(0);
    //     mapController.current.value.mainLocation =
    //         "${pm.locality}${pm.subLocality}";
    //     mapController.current.value.subLocation = "${pm.name}${pm.street}";
    //     mapController.deliveryLocationList.add(mapController.current.value);

    //     setState(() {
    //       source = Marker(
    //           markerId: MarkerId("${locationData.latitude}"),
    //           draggable: true,
    //           onDragEnd: (endPosition) {
    //             print(endPosition);
    //           },
    //           infoWindow: InfoWindow(
    //               title: "${pm.administrativeArea}", snippet: "${pm.locality}"),
    //           position: LatLng(locationData.latitude ?? currentLat,
    //               locationData.longitude ?? currentLong));
    //     });
    //   });
    //   // print(locationData);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: const Text('SET LOCATION'),
            elevation: 0,
            foregroundColor: Colors.black.withOpacity(0.7),
            backgroundColor: Palette.pagebackgroundcolor,
            leading: GestureDetector(
                onTap: () async {
                  // CustomLocation newLocation = mapController
                  //     .deliveryLocationList
                  //     .elementAt(mapController.selectedAddressIndex.value);
                  // await mapController.addNewAddressToserver(newLocation);
                  // await checkoutController.getLocations();
                  Get.back();
                },
                child: const Icon(CupertinoIcons.back))),
        backgroundColor: Palette.pagebackgroundcolor,

        // extendBody: false,
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              markers: _markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onLongPress: (latLong) async {
                // geo.Placemark pm =
                //     await mapController.getSelectedLocationNameWith(latLong);
                // CustomLocation newLocation = CustomLocation(
                //   "${pm.locality}${pm.subLocality}",
                //   "${pm.name}${pm.street}",
                //   latLong.latitude,
                //   latLong.longitude,
                // );
                // mapController.addNewDeliveryLocation(newLocation);

                // setState(() {
                //   mapController.delivery.value.mainLocation = pm.locality!;
                //   mapController.delivery.value.subLocation = pm.street!;
                //   // print(pm.subThoroughfare);
                //   _markers.clear();
                //   _markers.add(Marker(
                //       markerId: MarkerId(latLong.toString()),
                //       infoWindow: InfoWindow(
                //           title: "${pm.administrativeArea}",
                //           snippet: "${pm.locality}"),
                //       position: latLong));
                // });
                // print("object");
              },
              onMapCreated: (GoogleMapController mapController) {
                _markers.add(
                  Marker(
                      markerId: const MarkerId('companyLocationMarker'),
                      onDragEnd: (selectedPosition) {
                        latitude = selectedPosition.latitude;
                        longitued = selectedPosition.longitude;
                      },
                      draggable: true,
                      position: LatLng(
                        latitude,
                        longitued,
                      )),
                );
                googleMapController = mapController;
                // _markers.add(source);
                // _markers.add(destination);
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longitued),
                zoom: 15,
              ),
            ),
            SizedBox.expand(
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: (c) {
                  if (c.extent > max * 0.8) {
                    setState(() {
                      _expanding = true;
                      initial = max;
                    });
                  } else if (c.extent <= max * 0.8) {
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
                          margin: const EdgeInsets.only(
                              left: 18, right: 18, bottom: 18),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Colors.white,
                              boxShadow: const [
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
                                  margin: const EdgeInsets.only(
                                      top: 11, bottom: 20),
                                  width: size.width * (86 / 375),
                                  height: 2,
                                  color: const Color(0xFF9B9B9B),
                                ),
                                const Text(
                                  'Long press on the map to select an address of your choice',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 10),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 11, bottom: 10),
                                ),
                                getDeliveryAddressFeild(size),
                                _expanding
                                    ? getSearchYourAddressFeild(size)
                                    : const SizedBox(),
                                _expanding == false
                                    ? Container(
                                        margin: const EdgeInsets.only(
                                          top: 11,
                                        ),
                                      )
                                    : Container(
                                        margin: const EdgeInsets.only(
                                            top: 11, bottom: 18),
                                        width: size.width * (290 / 375),
                                        height: 1,
                                        color: const Color(0xFF9B9B9B),
                                        // decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(3),
                                        //     border:
                                        //         Border.all(color: Color(0xFF9B9B9B))),
                                      ),
                                const Text(
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
                                        margin: const EdgeInsets.only(
                                          top: 18,
                                        ),
                                      )
                                    : Container(
                                        margin: const EdgeInsets.only(top: 11),
                                        width: size.width * (290 / 375),
                                        height: 1,
                                        color: const Color(0xFF9B9B9B),
                                      ),
                                _expanding
                                    ? GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            initial = _expanding ? min : max;
                                            _expanding = !_expanding;
                                            // print(initial);
                                          });
                                        },
                                        child: getSetOnMapFeild(size))
                                    : const SizedBox()
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
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(5),
            // border: Border.all(color: coffeecolor),
            boxShadow: const [
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
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color(0xFFFEFEFE),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 3),
                        color: const Color(0x08000000),
                        blurRadius: 10.r)
                  ]),
              child: Center(
                child: Icon(
                  Icons.work,
                  color: const Color(0x006d6262),
                  //    size: 22,
                  size: size.width * 0.0535,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
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
