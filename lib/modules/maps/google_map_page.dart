import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:metrocoffee/core/constants/company_detail.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';
import 'google_map_controller.dart';
import 'places_selection_page.dart';
import 'widgets/map_widgets.dart';

class GoogleMapPage extends StatelessWidget {
  final double? initialLat, initialLong;
  final int? idToUpdate;
  final int? indexToUpdate;
  GoogleMapPage(
      {Key? key,
      this.initialLat,
      this.initialLong,
      this.idToUpdate,
      this.indexToUpdate})
      : super(key: key);

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
            return Stack(
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  markers: cgmapController.markers.values.toSet(),
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
                      CompanyDetail.lat,
                      CompanyDetail.long,
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
                            Get.to(() => const PlaceSelection());
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
                                  Get.to(() => const PlaceSelection());
                                },
                                hintText: cgmapController.currentLocation,
                              );
                            }),
                          ),
                        ),
                        CustomReusableBtn(
                          height: 48.h,
                          width: 320.w,
                          onPressed: () => controller.addOrUpdateLocation(
                              idToUpdate: idToUpdate, index: indexToUpdate),
                          buttonText: 'SET LOCATION',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
