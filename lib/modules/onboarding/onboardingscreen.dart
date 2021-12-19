import 'package:flutter/material.dart';
// import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/icons/onboardingimages.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/core/theme.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  late PageController pageController;
  int intoPage = 0;
  bool triggerOpacity = false;
  String title = "Takeaways Menu";
  String body =
      "Great range of lunch & Dinner menus for you to grab & go to save your precious time cooking delicious food. You can also pre oder any of our premium products for collection.";
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  double beginValue = 0, endValue = 1.0;
  late final Animation<double> _animation =
      Tween(begin: beginValue, end: endValue).animate(_controller);

  // bool dataInitialized = false;
  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: intoPage,
    );
    var tmpStorage = TempStorage();
    tmpStorage.initialise().whenComplete(() {
      tmpStorage.writeBool(TempStorageKeys.firstTimeUser, true);
    });
    // initializeData();
  }

  // Future initializeData() async {
  //   dataInitialized = await Get.find<BaseController>().initializeData();
  // }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    // Size size = MediaQuery.of(context).size;
    _controller.forward();

    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 487.h,
            width: 375.w,
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                intoPage = index;
                setTextForPage(index);
              },
              children: [
                SlidableWidget(
                  backgroundImage: "${OnBoardingImages.on3}",
                  index: 0,
                ),
                SlidableWidget(
                  backgroundImage: "${OnBoardingImages.on1}",
                  index: 1,
                ),
                SlidableWidget(
                  backgroundImage: "${OnBoardingImages.on2}",
                  index: 2,
                )
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            margin: EdgeInsets.only(top: 20.h, left: 16.w),
            clipBehavior: Clip.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    "$title",
                    style: getpoppins(TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: coffeecolor)),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                FadeTransition(
                  opacity: _animation,
                  child: SizedBox(
                    width: 343.w,
                    child: Text(
                      '''$body''',
                      style: getpoppins(TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.normal,
                          color: coffeecolor.withOpacity(0.77))),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                intoPage == 2
                    ? Center(
                        child: Container(
                          width: 248.w,
                          height: 47.h,
                          decoration: BoxDecoration(
                              color: coffeecolor,
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                              onPressed: _onPressed,
                              // style: ButtonStyle(),
                              child: Text(
                                "Get Started",
                                style: getpoppins(TextStyle(
                                    fontSize: 15.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400)),
                              )),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: _onPressed,
                            child: Text(
                              "Skip",
                              style: getpoppins(TextStyle(
                                  color: coffeecolor.withOpacity(0.77),
                                  decoration: TextDecoration.underline)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pageController.animateToPage(
                                  intoPage == 0
                                      ? 1
                                      : intoPage == 1
                                          ? 2
                                          : 0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                                width: 49.w,
                                height: 49.w,
                                margin: EdgeInsets.only(right: 16.w),
                                child: Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: Colors.white,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0x38722030),
                                          offset: Offset(0, 3.r),
                                          blurRadius: 6.r)
                                    ],
                                    color: coffeecolor)),
                          )
                        ],
                      )
              ],
            ),
          )
        ],
      ),
    );
  }

  _onPressed() {
    Get.offAllNamed(PageName.homepage);
  }

  setTextForPage(int pageIndex) {
    switch (pageIndex) {
      case 1:
        title = "Benefit Card Club";
        body =
            "Grab our free Benefit Club Card to collect points and range of discounts we will offer to our new and loyal customer to give them value for money on every penny they spend.";
        break;
      case 0:
        title = "Takeaways Menu";
        body =
            "Great range of lunch & Dinner menus for you to grab & go to save your precious time cooking delicious food. You can also pre oder any of our premium products for collection.";
        break;
      case 2:
        title = "Freshly Made Breakfast/Sandwich";
        body =
            "We believe in freshness and high quality products so we will offer you freshly made breakfast and sandwiches for you on the go.";
        break;
      default:
        break;
    }
    _controller.reset();
    setState(() {});
  }
}

class SlidableWidget extends StatelessWidget {
  final String backgroundImage;
  final int index;

  const SlidableWidget(
      {Key? key, required this.backgroundImage, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 490.h,
      width: 375.w,
      color: coffeecolor,
      child: Image.asset(
        "$backgroundImage",
        fit: BoxFit.cover,
      ),
    );
  }
}
