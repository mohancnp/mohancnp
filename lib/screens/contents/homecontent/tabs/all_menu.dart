import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
class AllMenu extends StatelessWidget {
  const AllMenu({Key? key}) : super(key: key);

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
      child:Container(
        child:
        Stack(
      children:[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/Path 56@3x.png",
                width: screenheight,)
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(CupertinoIcons.back,
                color: Colors.white,
          //      size: 28,
            size: screenwidth*0.0681,    ),
              ),
              title: Text("ALL MENU",style: getpoppins(
                TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
        //          fontSize: 16.5
          fontSize: screenwidth*0.0401      )
              ),),
              actions: [
                IconButton(onPressed: (){

                }, icon: Icon(FeatherIcons.search,
                color: Colors.white,
          //      size: 28,
                  size: screenwidth*0.0681,    ))
              ],
            ),
            Container(
              width: screenwidth,
              margin: EdgeInsets.symmetric(
              ),
                padding: EdgeInsets.only(
              //      top: 80,
//                left: 22,right: 22,bottom: 22
               top: screenwidth*0.1946,
                    left: screenwidth*0.0535,right:  screenwidth*0.0535,bottom:  screenwidth*0.0535
                ),
                child:
            staggeredgridview(context)),
          ],
        ),])
      ),)
    );
  }
  Widget staggeredgridview(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    double screenarea = screenwidth * screenheight;

    return StaggeredGridView.countBuilder(
      shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          crossAxisCount: 4,
          itemCount: 10,

          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.pushNamedAndRemoveUntil(context, '/DrinkDetails', (route) => true);
              },
                child:
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.black12,
                        offset: Offset(0,3),blurRadius: 10)],
                  ),
                child:
                    ClipRRect(
                        borderRadius:
                        BorderRadius.all(Radius.circular(26)),
                child:
                Container(

                              //  height: 135,

                              width: screenwidth * 0.38,
                              decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius:
                                BorderRadius.all(Radius.circular(26)),
                              ),
                              child:
                              Stack(
                                children:[
                                  Positioned(
                       //       right:-24,top:-20,
                         right: -screenwidth*0.0583,  top: -screenwidth*0.0486,
                                      child:Image.asset(getimageforrow1(index),
                                width: screenwidth * 0.38,
                                fit: BoxFit.cover,)),
                                Container(
                                  padding: EdgeInsets.only(
                                    //         left:  12,right:10,bottom: 10
                                      left: screenwidth*0.02919,right: screenwidth*0.0243,bottom: screenwidth*0.0243
                                  ),
                                  //          height: 192, width: 170,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          child: Text(
                                            gettitleforrow1(index),
                                            style: getpoppins(
                                                TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xff404D4D),
                                                    //        fontSize: 14
                                                    fontSize: screenwidth*0.034063
                                                )
                                            ),
                                          )
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                              child: Text(
                                                "\$ "+getpriceforrow1(index),
                                                style: getpoppins(
                                                    TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        color: Color(0xff550E1C),
                                                        //         fontSize: 15
                                                        fontSize: screenwidth*0.0364
                                                    )
                                                ),
                                              )
                                          ),
                                          Container(
                                            //      height: 29,width: 29,
                                            height: screenwidth*0.07055,width: screenwidth*0.07055,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2),
                                                    blurRadius: 15,
                                                    offset: Offset(0,3)),
                                                ],
                                                shape: BoxShape.circle
                                            ),
                                            child: Center(
                                              child: GestureDetector(
                                                onTap: (){

                                                },
                                                child: Icon(Icons.favorite,
                                                  color: Colors.redAccent,
                                                  //    size: 17,
                                                  size: screenwidth*0.04136,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                                    ],
                                  ),
                                )

                      ])))))
                    ;
          },
          staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2.2 : 2.6),
//          mainAxisSpacing: 18.0, crossAxisSpacing: 18.0,
      mainAxisSpacing: screenwidth*0.0437, crossAxisSpacing: screenwidth*0.0437,
    );
  }
  getimageforrow1(int index){
    if(index.isEven){
      return "assets/images/coffee1.png";
    }
    else{
      return "assets/images/coffe2.png";
    }
  }
  gettitleforrow1(int index){
    if(index.isEven){
      return "Café Latte";
    }
    else{
      return "Latte Machiato";
    }


  }
  getpriceforrow1(int index){
    if(index.isEven){
      return "3.00";
    }
    else{
      return "2.00";
    }
  }
}
