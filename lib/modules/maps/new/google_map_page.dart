// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:metrocoffee/core/constants/company_detail.dart';
import 'package:metrocoffee/core/constants/google.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';
import 'google_map_controller.dart';
import 'places_selection_page.dart';
import 'widgets/map_widgets.dart';
import 'package:get/get.dart';

class GoogleMapPage extends StatelessWidget {
  GoogleMapPage({Key? key, this.initialLat, this.initialLong})
      : super(key: key);
  final double? initialLat, initialLong;

  // ignore: non_constant_identifier_names
  var TAG = "COMMENTS";
  final controller = Get.find<CustomGoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      body: GetBuilder<CustomGoogleMapController>(
          init: CustomGoogleMapController(),
          initState: (v) {
            controller.initLat = initialLat;
            controller.initLong = initialLong;
            controller.setMarker();
          },
          builder: (cgmapController) {
            // print("$TAG ${cgmapController.markers[MarkerId("MetroMarker")]}");
            // print("$TAG ${cgmapController.markers.values}");

            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  markers: cgmapController.markers.values.toSet(),
                  // circles: cgmapController.getCircles(),
                  onCameraMove: (data) => controller.doOnCameraMove(data),
                  onCameraMoveStarted: () {
                    cgmapController.currentLocation = "Searching";
                    cgmapController.circleFlag = true;
                  },
                  onCameraIdle: controller.doOnCameraIdle,
                  onMapCreated: (GoogleMapController mapController) {
                    if (!cgmapController.gController.isCompleted) {
                      cgmapController.gController.complete(mapController);
                    }
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      CompanyDetail.companyLat,
                      CompanyDetail.companyLong,
                    ),
                    zoom: 15,
                  ),
                ),
                Positioned(
                  top: 10.h,
                  child: SizedBox(
                    height: 80.h,
                    width: 375.w,
                    child: AppBar(
                      leading: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 24.w,
                          width: 24.w,
                          color: Colors.transparent,
                          child: Icon(
                            CupertinoIcons.back,
                            color: Palette.coffeeColor,
                          ),
                        ),
                      ),
                      title: Text(
                        "SET LOCATION",
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Palette.darkGery),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 375.w,
                    height: 178.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PlaceSelection());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20.h,
                              bottom: 20.h,
                            ),
                            child: Obx(() {
                              return SearchDestinationBox(
                                textFeildEnabled: false,
                                onPressed: () {
                                  Get.to(() => PlaceSelection());
                                },
                                hintText: cgmapController.currentLocation,
                              );
                            }),
                          ),
                        ),
                        CustomReusableBtn(
                          height: 48.h,
                          width: 320.w,
                          onPressed: controller.addOrUpdateLocation,
                          buttonText: 'SET LOCATION',
                        ),
                      ],
                    ),
                  ),
                )

                // GetBuilder<CustomGoogleMapController>(
                //     init: CustomGoogleMapController(),
                //     builder: (controller) {
                //       // print('built 1');
                //       return
                //     }),
                // GetBuilder<CustomGoogleMapController>(
                //     init: CustomGoogleMapController(),
                //     initState: (v) {
                //       controller.getCurrentUserLocation().then((locationData) {
                //         controller
                //             .getSelectedLocationNameWith(LatLng(
                //                 locationData.latitude ?? controller.companyLatitude,
                //                 locationData.longitude ??
                //                     controller.companyLongitued))
                //             .then((placemark) {
                //           controller.currentLocation = placemark.thoroughfare ??
                //               " " + " " + "${placemark.street ?? ' '}";
                //         });
                //       });
                //       // controller.addNewLocationFromMap(lat, long)
                //     },
                //     builder: (controller) {
                //       // print('built 1');

                //       return NotificationListener<DraggableScrollableNotification>(
                //         onNotification: (c) {
                //           if (c.extent > controller.maxSize * 0.8) {
                //             controller.initial = controller.minSize;
                //             controller.expanded = true;
                //           } else if (c.extent <= controller.maxSize * 0.8) {
                //             controller.initial = controller.maxSize;
                //             controller.expanded = false;
                //           }
                //           return false;
                //         },
                //         child: DraggableScrollableActuator(
                //           child: DraggableScrollableSheet(
                //               // key: Key("${controller.initial}"),
                //               minChildSize: controller.minSize,
                //               maxChildSize: controller.maxSize,
                //               initialChildSize: controller.initial,
                //               builder: (context, scrollController) {
                //                 return SingleChildScrollView(
                //                   controller: scrollController,
                //                   scrollDirection: Axis.vertical,
                //                   clipBehavior: Clip.none,
                //                   child: Container(
                //                     // height: 585.h,
                //                     margin: EdgeInsets.symmetric(
                //                         horizontal: 27.w, vertical: 27.h),
                //                     decoration: BoxDecoration(
                //                       color: Colors.white,
                //                       borderRadius: BorderRadius.circular(16.r),
                //                     ),
                //                     child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.start,
                //                       mainAxisSize: MainAxisSize.min,
                //                       children: [
                //                         Container(
                //                           width: 100.w,
                //                           height: 4.h,
                //                           margin: EdgeInsets.only(top: 16.h),
                //                           decoration: BoxDecoration(
                //                             borderRadius: BorderRadius.circular(2.r),
                //                             color: Palette.darkGrey1,
                //                           ),
                //                         ),
                //                         Padding(
                //                           padding: EdgeInsets.only(
                //                             top: 20.h,
                //                           ),
                //                           child: CurrentAddressBox(),
                //                         ),
                //                         Padding(
                //                           padding: EdgeInsets.only(
                //                             top: 20.h,
                //                           ),
                //                           child: SearchDestinationBox(),
                //                         ),
                //                         SizedBox(height: 20.h),
                //                         Padding(
                //                           padding:
                //                               EdgeInsets.symmetric(horizontal: 10.w),
                //                           child: Divider(
                //                             height: 4.h,
                //                             color: Colors.black45,
                //                           ),
                //                         ),
                //                         Padding(
                //                           padding:
                //                               EdgeInsets.symmetric(horizontal: 10.w),
                //                           child: Obx(() {
                //                             return ListView.builder(
                //                                 itemCount: controller
                //                                     .locationDetailList.length,
                //                                 shrinkWrap: true,
                //                                 padding: EdgeInsets.all(0),
                //                                 itemBuilder: (context, index) {
                //                                   var newList = List.from(controller
                //                                       .locationDetailList.reversed);
                //                                   var mapLocation = newList[index];
                //                                   // var stringAddress =
                //                                   //     mapLocation[index];
                //                                   // print(stringAddress.runtimeType);

                //                                   return Padding(
                //                                     padding:
                //                                         EdgeInsets.only(top: 10.w),
                //                                     child: AddressDetailWidget(
                //                                       mainLocation: mapLocation[0],
                //                                       subLocation: mapLocation[1],
                //                                       atIndex: index,
                //                                     ),
                //                                   );
                //                                 });
                //                           }),
                //                         ),
                //                         SizedBox(
                //                           height: 20.h,
                //                         ),
                //                         Padding(
                //                           padding:
                //                               EdgeInsets.symmetric(horizontal: 10.w),
                //                           child: Divider(
                //                             height: 2.h,
                //                             color: Colors.black45,
                //                           ),
                //                         ),
                //                         GestureDetector(
                //                           onTap: () {
                //                             controller.initial = controller.expanded
                //                                 ? controller.minSize
                //                                 : controller.maxSize;
                //                             controller.expanded =
                //                                 !controller.expanded;
                //                             // controller.update();
                //                             // print(controller.expanded);
                //                           },
                //                           child: Padding(
                //                             padding: EdgeInsets.only(
                //                                 top: 20.h, bottom: 20.h),
                //                             child: SetOnMapButton(),
                //                           ),
                //                         ),
                //                         CustomReusableBtn(
                //                           height: 50.h,
                //                           width: 150.w,
                //                           onPressed: () {},
                //                           buttonText: 'Add Location',
                //                         ),
                //                         SizedBox(height: 20.h)
                //                       ],
                //                     ),
                //                   ),
                //                 );
                //               }),
                //         ),
                //       );
                //     }),
              ],
            );
          }),
    );
  }
}
