import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/maps/new/widgets/map_widgets.dart';
import 'package:metrocoffee/modules/maps/new/widgets/places_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceSelection extends StatelessWidget {
  const PlaceSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlacesApiController>(
        init: PlacesApiController(),
        initState: (data) {},
        builder: (controller) {
          return Scaffold(
            backgroundColor: Palette.pagebackgroundcolor,
            appBar: AppBar(
              title: Text(
                "SET LOCATION",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Palette.darkGery),
              ),

              // The search area here
              // title: Container(
              //   width: double.infinity,
              //   height: 40,
              //   decoration: BoxDecoration(
              //     color: Palette.pagebackgroundcolor.withOpacity(0.7),
              //     borderRadius: BorderRadius.circular(5),
              //   ),

              //   child: TextField(
              //     controller: controller.textEditingController,
              //     onChanged: (data) {
              //       if (data.isNotEmpty) {
              //         controller.autoCompleteSearch();
              //       } else {
              //         var predictions = controller.predictions;
              //         if (predictions != null) {
              //           if (predictions.length > 0) {
              //             predictions = [];
              //             controller.update();
              //           }
              //         }
              //       }
              //     },
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(Icons.search),
              //       suffixIcon: IconButton(
              //         icon: Icon(Icons.clear),
              //         onPressed: () {
              //           /* Clear the search field */
              //         },
              //       ),
              //       hintText: 'Search with name or code',
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
              backgroundColor: Palette.pagebackgroundcolor,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  CupertinoIcons.back,
                  color: Palette.darkGery,
                ),
              ),
              elevation: 0,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 28.w),
              child: Column(
                children: [
                  SearchDestinationBox(
                    hintText: "enter place name, zip code etc",
                    textFeildEnabled: true,
                    onPressed: (){
                      
                    },
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 5.w),
                    child: Divider(
                      height: 4.h,
                      color: Colors.black45,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SetOnMapButton())
                ],
              ),
            ),
          );
        });
  }
}
