import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/util/internet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  int _initialfadeduration = 2000;
  int _loginstat = 0;

  @override
  initState() {
    deployanimation();
    startTime();

    InternetConnectionHelper.isConnectionReady().then(
      (ready) {
        if (ready) {
          final tempStorage = TempStorage();
          var authToken, firsTimeUser;
          tempStorage.initialise().then(
            (value) {
              firsTimeUser =
                  tempStorage.readBool(TempStorageKeys.firstTimeUser);
              authToken = tempStorage.readString(TempStorageKeys.authToken);

              if (firsTimeUser != null) {
                if (authToken != null) {
                  Get.find<RedirectionController>().userExists = true;

                  _loginstat = 1;
                }
              } else {
                _loginstat = 2;
              }
            },
          );
        } else {
          _loginstat = -1;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _imagescaleanimationcontroller.dispose();
    _textscaleanimationcontroller.dispose();
    _fadeanimationcontroller.dispose();
    _downscaleanimationcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: 812.h,
        width: 375.w,
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
                          bottom: 12.h,
                          left: 4.w,
                        ),
                        child: Image.asset(
                          "assets/images/steam.png",
                          width: 40.w,
                        ),
                      ),
                    ),
                    ScaleTransition(
                      scale: _imagescaleanimation,
                      child: Container(
                        child: Image.asset(
                          "assets/images/coffee-cup@3x.png",
                          width: 56.w,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ScaleTransition(
                scale: _textscaleanimation,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 36.h,
                  ),
                  child: Text(
                    "Metro Coffee",
                    style: TextStyle(
                      fontFamily: montserratmedium,
                      color: Palette.darkGery,
                      fontSize: 24.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
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
      duration: Duration(milliseconds: _initialfadeduration),
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
      }
    });
    _fadeanimationcontroller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _initialfadeduration = 800;
        });
        _downscaleanimationcontroller.forward();
      }
    });
  }

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if (_loginstat < 0) {
      Get.offNamed(PageName.nointernetpage);
    } else {
      Get.offAllNamed(
        _loginstat == 1
            ? PageName.homepage
            : _loginstat == 2
                ? PageName.onboardingpage
                : PageName.homepage,
      );
    }
  }
}
