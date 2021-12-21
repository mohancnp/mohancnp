import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/profile/personal_data_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class UserDataFeildWidget extends StatelessWidget {
  UserDataFeildWidget({Key? key}) : super(key: key);

  final controller = Get.find<PersonalDataPageController>();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenwidth,
      padding: EdgeInsets.only(
        left: screenwidth * 0.0535,
        right: screenwidth * 0.0535,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: screenwidth * 0.0097),
                child: Text(
                  "Your Name",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                     
                    fontSize: screenwidth * 0.0304,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: screenwidth * 0.0182, bottom: screenwidth * 0.0486),
            padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ]),
            child: TextField(
              keyboardType: TextInputType.name,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                 
                fontSize: screenwidth * 0.0328,
                color: const Color(
                  0xff1A1C1C,
                ),
              ),
              cursorColor: const Color(0xff1A1C1C),
              controller: controller.namecontroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                     
                    fontSize: screenwidth * 0.0328,
                    color: const Color(0xff1A1C1C).withOpacity(0.78),
                  ),
                  hintText: "Robert Fox"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: screenwidth * 0.0097),
                child: Text(
                  "Current password",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                     
                    fontSize: screenwidth * 0.0304,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/ChangePassword", (_) => true);
                },
                child: Container(
                  margin: EdgeInsets.only(left: screenwidth * 0.0097),
                  child: Text(
                    "Change Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                       
                      fontSize: screenwidth * 0.0304,
                      color: Palette.coffeeColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: screenwidth * 0.0182, bottom: screenwidth * 0.0486),
            padding: EdgeInsets.only(left: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ]),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                 
                fontSize: screenwidth * 0.0328,
                color: const Color(0xff1A1C1C),
              ),
              cursorColor: const Color(0xff1A1C1C),
              obscureText: controller.obscurecurrentpassword,
              controller: controller.currentpasswordcontroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.setcurrentpasswordview();
                    },
                    child: Icon(
                      controller.obscurecurrentpassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: const Color(0xff1A1C1C).withOpacity(0.85),
                      size: screenwidth * 0.0450,
                    ),
                  ),
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                     
                    fontSize: screenwidth * 0.0328,
                    color: const Color(0xff1A1C1C).withOpacity(0.78),
                  ),
                  hintText: "Type a strong password"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: screenwidth * 0.0097),
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenwidth * 0.0304,
                    color: Palette.darkGery.withOpacity(0.95),
                     
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: screenwidth * 0.0182, bottom: screenwidth * 0.0486),
            padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ]),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: screenwidth * 0.0328,
                color: const Color(0xff1A1C1C),
              ),
              cursorColor: const Color(0xff1A1C1C),
              controller: controller.emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                   
                  fontSize: screenwidth * 0.0328,
                  color: const Color(0xff1A1C1C).withOpacity(0.78),
                ),
                hintText: "robertfox@gmail.com",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: screenwidth * 0.0097),
                child: Text(
                  "Your Job",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                     
                    fontSize: screenwidth * 0.0304,
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: screenwidth * 0.0182, bottom: screenwidth * 0.0486),
            padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ]),
            child: TextField(
              style: TextStyle(
                fontWeight: FontWeight.w400,
                 
                fontSize: screenwidth * 0.0328,
                color: const Color(0xff1A1C1C),
              ),
              cursorColor: const Color(0xff1A1C1C),
              controller: controller.jobcontroller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                     
                    fontSize: screenwidth * 0.0328,
                    color: const Color(0xff1A1C1C).withOpacity(0.78),
                  ),
                  hintText: "Graphic Designer"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: screenwidth * 0.0097),
                child: Text(
                  "Membership",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenwidth * 0.0304,
                     
                    color: Palette.darkGery.withOpacity(0.95),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenwidth * 0.0182,
              bottom: screenwidth * 0.0486,
            ),
            padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: const Color(0xffF9F9F9),
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 3))
                ]),
            child: TextField(
              enabled: false,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: screenwidth * 0.0328,
                color: const Color(0xff1A1C1C),
              ),
              cursorColor: const Color(0xff1A1C1C),
              controller: controller.membershipcontroller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: screenwidth * 0.0328,
                  color: const Color(0xff1A1C1C).withOpacity(0.78),
                ),
                hintText: "Gold Member",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: screenwidth * 0.0097),
                child: Text(
                  "Gender",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: screenwidth * 0.0304,
                    color: Palette.darkGery.withOpacity(0.95),
                     
                  ),
                ),
              )
            ],
          ),
          Container(
            width: screenwidth,
            margin: EdgeInsets.only(
                top: screenwidth * 0.0182, bottom: screenwidth * 0.0486),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.setgender('male');
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenwidth * 0.0304),
                    width: screenwidth * 0.367,
                    height: screenwidth * 0.0924,
                    decoration: BoxDecoration(
                        color: const Color(0xffF9F9F9),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          controller.gender == 'male'
                              ? CupertinoIcons.largecircle_fill_circle
                              : CupertinoIcons.circle,
                          color: controller.gender == 'male'
                              ? const Color(0xff1A1C1C)
                              : Colors.grey[600],
                          size: screenwidth * 0.04866,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: screenwidth * 0.0218),
                          child: Text(
                            "Male",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenwidth * 0.0304,
                              color: const Color(0xff1A1C1C),
                               
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.setgender('female');
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenwidth * 0.0304),
                    width: screenwidth * 0.367,
                    height: screenwidth * 0.0924,
                    decoration: BoxDecoration(
                        color: const Color(0xffF9F9F9),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(9)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 10,
                              offset: const Offset(0, 3))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          controller.gender == 'female'
                              ? CupertinoIcons.largecircle_fill_circle
                              : CupertinoIcons.circle,
                          color: controller.gender == 'female'
                              ? const Color(0xff1A1C1C)
                              : Colors.grey[600],
                          size: screenwidth * 0.04866,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: screenwidth * 0.0218),
                          child: Text(
                            "Female",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: screenwidth * 0.0304,
                              color: const Color(0xff1A1C1C),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
