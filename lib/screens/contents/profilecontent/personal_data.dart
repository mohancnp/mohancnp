import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/profile/personaldatapagecontroller.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/profile/profile_controller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/enums/uistate.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/screens/widgets/dialogs/loading_single.dart';
import 'package:metrocoffee/services/rest/config.dart';
import 'package:metrocoffee/theme.dart';

class PersonalData extends StatelessWidget {
  PersonalData({Key? key}) : super(key: key);
  final PersonalDataPageController personalDataPageController =
      Get.put(PersonalDataPageController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return GetBuilder<PersonalDataPageController>(
        initState: (v) {
          personalDataPageController.getUserDataFromServer();
        },
        init: PersonalDataPageController(),
        builder: (personaldatacontroller) {
          return Scaffold(
            backgroundColor: Color(0xffF3F5F5),
            body: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: EdgeInsets.only(
                    //          horizontal: 22

                    bottom: screenwidth * 0.0535,
                  ),
                  width: screenwidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppBar(
                        title: Text(
                          "PERSONAL DATA",
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w400,
                              color: darkgrey,
                              //    fontSize: 16.5
                              fontSize: screenwidth * 0.0401)),
                        ),
                        centerTitle: true,
                        leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            CupertinoIcons.back,
                            color: darkgrey,
//                size: 28,
                            size: screenwidth * 0.0681,
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: screenwidth * 0.0535,
                              right: screenwidth * 0.0535,
                            ),
                            padding: EdgeInsets.all(
                                //            14
                                screenwidth * 0.0340),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      blurRadius: 10,
                                      offset: Offset(0, 3))
                                ]),
                            child: personalDataPageController.imageUri != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        screenwidth * 0.2007 * 0.5),
                                    child: Image.network(
                                      "$baseUrl${personaldatacontroller.imageUri!}",
                                      width: screenwidth * 0.2007,
                                      loadingBuilder:
                                          (context, widget, imageChunkEvent) {
                                        return widget;
                                      },
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Image.asset(
                                    "assets/images/profilep.png",
                                    //     width: 82.5,
                                    width: screenwidth * 0.2007,
                                    fit: BoxFit.cover,
                                  ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
//                top:14,bottom: 24
                          left: screenwidth * 0.0535,
                          right: screenwidth * 0.0535,
                          top: screenwidth * 0.0340,
                          bottom: screenwidth * 0.0340,
                        ),
                        width: screenwidth,
                        height: 1,
                        decoration: BoxDecoration(
                          color: Color(0xffA5A5A5).withOpacity(0.4),
                        ),
                      ),
                      personaldatacontroller.getuserdatatextfields(context),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: coffeecolor),
                        width: screenwidth * 0.35,
                        height: screenheight * 0.06,
                        child: MaterialButton(
                          child: Text(
                            "update",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            personaldatacontroller.updateUserInfo(context);
                          },
                        ),
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
