import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme.dart';

class FavoriteProductsPage extends StatefulWidget {
  const FavoriteProductsPage({Key? key}) : super(key: key);

  @override
  _FavoriteProductsPageState createState() => _FavoriteProductsPageState();
}

class _FavoriteProductsPageState extends State<FavoriteProductsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F5),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          width: screenwidth,
          height: screenheight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                title: Text(
                  "MY FAVORITES",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: darkgrey,
                     
                    fontSize: screenwidth * 0.0401,
                  ),
                ),
                centerTitle: true,
                leading: IconButton(
                  onPressed: Get.back,
                  icon: Icon(
                    CupertinoIcons.back,
                    color: darkgrey,
                    size: screenwidth * 0.0681,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: screenwidth * 0.0535,
                  right: screenwidth * 0.0535,
                  bottom: 0,
                ),
                width: screenwidth,
                height: 1,
                decoration: BoxDecoration(
                  color: const Color(0xffA5A5A5).withOpacity(0.4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
