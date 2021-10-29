import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/instances.dart';
import 'package:metrocoffee/core/enums/uistate.dart';
import 'package:metrocoffee/models/order_data.dart';
import 'package:metrocoffee/screens/widgets/product/timeframeorders.dart';
import '../../../core/theme.dart';

class ReorderPage extends StatefulWidget {
  const ReorderPage({Key? key}) : super(key: key);

  @override
  _ReorderPageState createState() => _ReorderPageState();
}

class _ReorderPageState extends State<ReorderPage> {
  List<dynamic> myOrderList = [];
  UIState status = UIState.processing;
  @override
  void initState() {
    orderService.getOrders().then((value) {
      List<OrderData> thisWeekOrder = [];
      List<OrderData> thisMonthOrder = [];

      if (value != null) {
        List<dynamic> data = value.data['data']['data'];
        data.forEach((element) {
          OrderData orderData = OrderData.fromJson(element);

          var dateTime = DateTime.parse(orderData.createdAt.substring(0, 16));
          var todaysDate = DateTime.now();
          var thisMonth = "${DateTime.now().year}/${DateTime.now().month}";
          var orderMonth = "${dateTime.year}/${dateTime.month}";

          if ((todaysDate.difference(dateTime)).inDays <= 7) {
            thisWeekOrder.add(orderData);
          }
          if (thisMonth == orderMonth) {
            thisMonthOrder.add(orderData);
          }
        });
      }
      myOrderList.add(0);
      myOrderList.addAll(thisWeekOrder);
      myOrderList.add(1);
      myOrderList.addAll(thisMonthOrder);

      setState(() {
        status = UIState.completed;
      });
    }).catchError((error) {
      print("Error getting data");
      status = UIState.error;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Material(
      color: Color(0xffF3F5F5),
      child: SizedBox(
        width: screenwidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
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
            status == UIState.processing
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpinKitCubeGrid(
                        color: coffeecolor,
                      ),
                    ],
                  )
                : (status == UIState.error)
                    ? SizedBox(
                        child: Center(
                          child: Text('Error retrieving your order'),
                        ),
                      )
                    : SizedBox(
                        width: screenwidth,
                        child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            itemCount: myOrderList.length,
                            scrollDirection: Axis.vertical,
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              if (myOrderList.elementAt(index) == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: Text("This Week"),
                                );
                              }
                              if (myOrderList.elementAt(index) == 1) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 8.0),
                                  child: Text("This Month"),
                                );
                              }
                              OrderData newData = myOrderList.elementAt(index);
                              return TimeFrameOrders(
                                  index: index,
                                  reorder: true,
                                  orderData: newData);
                            }),
                      )
          ],
        ),
      ),
    );
  }
}
