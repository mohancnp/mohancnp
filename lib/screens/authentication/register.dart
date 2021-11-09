import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/auth/register_controller.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/instances.dart';
import 'package:metrocoffee/core/enums/uistate.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';
// import 'package:metrocoffee/screens/contents/profilecontent/personal_data.dart';
import 'package:metrocoffee/core/theme.dart';

class SocialRegister extends StatefulWidget {
  SocialRegister({Key? key}) : super(key: key);

  @override
  _SocialRegisterState createState() => _SocialRegisterState();
}

class _SocialRegisterState extends State<SocialRegister> {
  final RegisterController controller = Get.put(RegisterController());
  final jobController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> newMap = {};
  BaseController baseController = Get.find<BaseController>();
  HomeTabController homeTabController = Get.find<HomeTabController>();

  @override
  void initState() {
    newMap = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return GetBuilder<RegisterController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'Just a little more',
                style: TextStyle(color: Colors.black),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: controller.state == UIState.processing
              ? SizedBox(
                  child: Center(child: Text("loading...")),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            //         left: 4
                            left: screenwidth * 0.02,
                          ),
                          child: Text(
                            "Your Job",
                            style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w400,
                              //                  fontSize: 12.5,
                              fontSize: screenwidth * 0.0304,
                              color: darkgrey.withOpacity(0.95),
                            )),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          //                top: 7.5,bottom: 20
                          left: 5,
                          right: 5,
                          top: screenwidth * 0.0182,
                          bottom: screenwidth * 0.0486),
                      padding: EdgeInsets.symmetric(
                          //                horizontal: 14
                          horizontal: screenwidth * 0.03406),
                      width: screenwidth,
                      decoration: BoxDecoration(
                          color: Color(0xffF9F9F9),
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          border: Border.all(color: coffeecolor),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: Offset(0, 3))
                          ]),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          style: getpoppins(
                            TextStyle(
                                fontWeight: FontWeight.w400,
                                //    fontSize: 13.5,
                                fontSize: screenwidth * 0.0328,
                                color: Color(0xff1A1C1C)),
                          ),
                          cursorColor: Color(0xff1A1C1C),
                          controller: jobController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              errorText: "",
                              hintStyle: getpoppins(
                                TextStyle(
                                    fontWeight: FontWeight.w400,
                                    //      fontSize: 13.5,
                                    fontSize: screenwidth * 0.0328,
                                    color: Color(0xff1A1C1C).withOpacity(0.78)),
                              ),
                              hintText: "Software Designer"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            } else
                              return null;
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                              //         left: 4
                              left: screenwidth * 0.02),
                          child: Text(
                            "Gender",
                            style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w400,
                              //                  fontSize: 12.5,
                              fontSize: screenwidth * 0.0304,
                              color: darkgrey.withOpacity(0.95),
                            )),
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: screenwidth,
                      margin: EdgeInsets.only(
                          //                top: 7.5,bottom: 20
                          top: screenwidth * 0.0182,
                          bottom: screenwidth * 0.0486),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.setGender('Male');
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  //                      horizontal: 12.5
                                  horizontal: screenwidth * 0.00504),
                              //                  width: 151, height: 38,
                              width: screenwidth * 0.367,
                              height: screenwidth * 0.0924,
                              decoration: BoxDecoration(
                                  color: Color(0xffF9F9F9),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.03),
                                        blurRadius: 10,
                                        offset: Offset(0, 3))
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    controller.selectedGender == 'Male'
                                        ? CupertinoIcons.largecircle_fill_circle
                                        : CupertinoIcons.circle,
                                    color: controller.selectedGender == 'Male'
                                        ? Color(0xff1A1C1C)
                                        : Colors.grey[600],
                                    size: screenwidth * 0.04866,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        //         left: 9
                                        left: screenwidth * 0.0218),
                                    child: Text(
                                      "Male",
                                      style: getpoppins(TextStyle(
                                        fontWeight: FontWeight.w400,
                                        //                  fontSize: 12.5,
                                        fontSize: screenwidth * 0.0304,
                                        color: Color(0xff1A1C1C),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                controller.setGender('Female');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    //                      horizontal: 12.5
                                    horizontal: screenwidth * 0.0304),
                                //                  width: 151, height: 38,
                                width: screenwidth * 0.367,
                                height: screenwidth * 0.0924,
                                decoration: BoxDecoration(
                                    color: Color(0xffF9F9F9),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(9)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.03),
                                          blurRadius: 10,
                                          offset: Offset(0, 3))
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      controller.selectedGender == 'Female'
                                          ? CupertinoIcons
                                              .largecircle_fill_circle
                                          : CupertinoIcons.circle,
                                      color:
                                          controller.selectedGender == 'Female'
                                              ? Color(0xff1A1C1C)
                                              : Colors.grey[600],
                                      size: screenwidth * 0.04866,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          //         left: 9
                                          left: screenwidth * 0.0218),
                                      child: Text(
                                        "Female",
                                        style: getpoppins(TextStyle(
                                          fontWeight: FontWeight.w400,
                                          //                  fontSize: 12.5,
                                          fontSize: screenwidth * 0.0304,
                                          color: Color(0xff1A1C1C),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                    Center(
                      child: MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            controller.setUIState(UIState.processing);
                            print("new Map: $newMap");
                            print(jobController.value.text);
                            print(controller.selectedGender);

                            var dataToSend = {
                              "provider": newMap['provider'],
                              "name": newMap['name'],
                              "email": newMap['email'],
                              "provider_id": newMap['provider_id'],
                              "job": jobController.value.text,
                              "gender": controller.selectedGender
                            };

                            var status =
                                await registerService.addUser(dataToSend);
                            if (status == 1) {
                              addToken(
                                  provider: newMap['provider'],
                                  token: newMap['token']);
                              addUserDetail(
                                  name: newMap['name'],
                                  email: newMap['email'],
                                  id: newMap['provider_id']);

                              homeTabController.initializeAllData();
                              baseController.updateUserVerificationStatus(
                                  UserVerficationStatus.verified);
                              Get.offNamedUntil('/Base', (route) => false);
                            }

                            controller.setUIState(UIState.completed);
                          } else {
                            controller.setUIState(UIState.passive);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please Do not leave the feild empty')),
                            );
                          }
                        },
                        color: coffeecolor.withOpacity(0.2),
                        child: Text("Let's go"),
                      ),
                    )
                  ],
                ));
    });
  }
}
