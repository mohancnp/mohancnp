import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/constants/instances.dart';
import 'package:metrocoffee/enums/uistate.dart';
import 'package:metrocoffee/models/order_data.dart';
import 'package:metrocoffee/screens/widgets/product/timeframeorders.dart';
import '../../../theme.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  List<dynamic> myOrderList = [];
  UIState status = UIState.processing;

  @override
  void initState() {
    orderService.getOrders().then((value) {
      List<OrderData> todaysOrder = [];
      List<OrderData> thisMonthOrder = [];
      if (value != null) {
        List<dynamic> data = value.data['data']['data'];
        data.forEach((element) {
          OrderData orderData = OrderData.fromJson(element);
          var dateTime = DateTime.parse(orderData.createdAt.substring(0, 16));
          var todaysDate = DateTime.now();
          var thisMonth = "${DateTime.now().year}/${DateTime.now().month}";
          var orderMonth = "${dateTime.year}/${dateTime.month}";
          if ((todaysDate.difference(dateTime)).inDays <= 1) {
            todaysOrder.add(orderData);
          }

          if (thisMonth == orderMonth) {
            thisMonthOrder.add(orderData);
          }
        });
      }

      myOrderList.add(0);
      myOrderList.addAll(todaysOrder);
      myOrderList.add(1);
      myOrderList.addAll(thisMonthOrder);

      setState(() {
        status = UIState.completed;
      });
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
    return Scaffold(
      backgroundColor: Color(0xffF3F5F5),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          width: screenwidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                title: Text(
                  "MY ORDER",
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
                  padding: EdgeInsets.only(
//                top:14,bottom: 24
                    left: screenwidth * 0.0535,
                    right: screenwidth * 0.0535,
                  ),
                  child: status == UIState.processing
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SpinKitCubeGrid(
                              color: Colors.blue,
                            ),
                          ],
                        )
                      : (status == UIState.error)
                          ? SizedBox(
                              child: Center(
                                child: Text('Error retrieving your order'),
                              ),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: myOrderList.length,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if (myOrderList.elementAt(index) == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8.0),
                                    child: Text("Today"),
                                  );
                                }
                                if (myOrderList.elementAt(index) == 1) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8.0),
                                    child: Text("This Month"),
                                  );
                                }
                                OrderData newData =
                                    myOrderList.elementAt(index);
                                return TimeFrameOrders(
                                    index: index, orderData: newData);
                                // return SingleTimeFrameReorders(
                                //   index: index,
                                //   orderData: newData,
                                // );
                              }))
            ],
          ),
        ),
      ),
    );
  }
}
