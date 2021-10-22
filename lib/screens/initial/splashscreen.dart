import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/basecontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/sharables/no_internet.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/util/internet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _imagescaleanimationcontroller;
  late AnimationController _textscaleanimationcontroller;
  late AnimationController _fadeanimationcontroller;
  late AnimationController _downscaleanimationcontroller;
  late Animation<double> _imagescaleanimation;
  late Animation<double> _textscaleanimation;
  late Animation<double> _fadeanimation;
  late Animation<double> _downscaleanimation;
  int initialfadeduration = 2000;
  int loginstat = -1;

  @override
  initState() {
    super.initState();

    deployanimation();
    startTime();
    // _getloginstatus();

    isConnectionReady().then((ready) {
      if (ready) {
        verifyToken().then((status) {
          // print('verification status: $status');
          if (status == false) {
            loginstat = 0;
            // setUserVerified();
            // Future.delayed(Duration.zero).then((value) => Get.offNamed('/Login'));
          } else {
            loginstat = 1;
          }
        });
      } else {
        Get.to(() => NoInternet());
      }
    });
  }

  @override
  void dispose() {
    _imagescaleanimationcontroller.dispose();
    _textscaleanimationcontroller.dispose();
    _fadeanimationcontroller.dispose();
    _downscaleanimationcontroller.dispose();
    super.dispose();
  }

  // Future<int> _getloginstatus() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final loginstatus = prefs.getInt('loginstatus');
  //   if (loginstatus == null) {
  //     setState(() {
  //       loginstat = 0;
  //     });
  //     return 0;
  //   }
  //   setState(() {
  //     loginstat = loginstatus;
  //   });
  //   return loginstatus;
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: screenheight,
        width: screenwidth,
        child: ScaleTransition(
            scale: _downscaleanimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      FadeTransition(
                          opacity: _fadeanimation,
                          child: Container(
                            margin: EdgeInsets.only(
                                //     bottom:11,left: 5
                                bottom: screenwidth * 0.02676,
                                left: screenwidth * 0.01216),
                            child: Image.asset(
                              "assets/images/steam.png",
                              width: screenwidth * 0.105,
                            ),
                          )),
                      ScaleTransition(
                          scale: _imagescaleanimation,
                          child: Container(
                            child:
                                Image.asset("assets/images/coffee-cup@3x.png",
                                    //     width: 116,
                                    width: screenwidth * 0.1605
                                    //  width: screenwidth*0.282,
                                    ),
                          ))
                    ])),
                ScaleTransition(
                    scale: _textscaleanimation,
                    child: Container(
                      margin: EdgeInsets.only(
                          //        top: 24
                          top: screenwidth * 0.09839),
                      child: Text(
                        "Metro Coffee",
                        style: TextStyle(
                            fontFamily: montserratmedium,
                            color: Color(0xff404d4d),
                            //     fontSize: 25
                            fontSize: screenwidth * 0.059),
                      ),
                    ))
              ],
            )),
      ),
    );
  }

  deployanimation() {
    _imagescaleanimationcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
    _textscaleanimationcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
    _fadeanimationcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: initialfadeduration),
    );
    _downscaleanimationcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 750),
    );
    _downscaleanimation = Tween<double>(begin: 1.0, end: 0).animate(
        CurvedAnimation(
            parent: _downscaleanimationcontroller, curve: Curves.easeIn));
    _imagescaleanimation = Tween<double>(begin: 1.0, end: 1.75).animate(
        CurvedAnimation(
            parent: _textscaleanimationcontroller, curve: Curves.easeOut));

    _textscaleanimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _imagescaleanimationcontroller, curve: Curves.easeOut));
    _fadeanimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _fadeanimationcontroller, curve: Curves.easeInOut));
    Future.delayed(Duration(seconds: 2), () {
      _imagescaleanimationcontroller.forward();
      _textscaleanimationcontroller.forward();
    });
    _imagescaleanimationcontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeanimationcontroller.forward();
//_scaleanimationcontroller.reverse();
      }
    });
    _fadeanimationcontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          initialfadeduration = 800;
        });
        _downscaleanimationcontroller.forward();
//_imagescaleanimationcontroller.reverse();
//_textscaleanimationcontroller.reverse();
//_fadeanimationcontroller.reverse();
        //_scaleanimationcontroller.reverse();
      }
    });
  }

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (loginstat < 0) {
      print('still no internet');
    } else {
      Navigator.of(context)
          .pushReplacementNamed(loginstat == 0 ? '/Login' : '/Base');
    }
  }
}
