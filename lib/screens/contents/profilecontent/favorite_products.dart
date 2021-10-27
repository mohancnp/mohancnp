import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/constants/instances.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/screens/widgets/product/favorite_product_card.dart';
import '../../../theme.dart';

class FavoriteProductsPage extends StatefulWidget {
  const FavoriteProductsPage({Key? key}) : super(key: key);

  @override
  _FavoriteProductsPageState createState() => _FavoriteProductsPageState();
}

class _FavoriteProductsPageState extends State<FavoriteProductsPage> {
  List<Product> productList = [];
  @override
  void initState() {
    super.initState();
    productService.getFavouriteProducts().then((response) {
      List<dynamic> responseData = response.data['data']['data'];
      responseData.forEach((element) {
        productList.add(Product.fromJson(element));
      });
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF3F5F5),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          width: screenwidth,
          height: screenheight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                title: Text(
                  "MY FAVORITES",
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
              Container(
                margin: EdgeInsets.only(
//                top:14,bottom: 24
                  left: screenwidth * 0.0535,
                  right: screenwidth * 0.0535,
                  bottom: 0,
                ),
                width: screenwidth,
                height: 1,
                decoration: BoxDecoration(
                  color: Color(0xffA5A5A5).withOpacity(0.4),
                ),
              ),
              Container(
                width: screenwidth,
                padding: EdgeInsets.symmetric(
                  horizontal: screenwidth * 0.0535,
                ),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: productList.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return FavoriteProductCard(
                        index: index,
                        product: productList.elementAt(index),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
