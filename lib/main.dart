import 'package:flutter/material.dart';
import 'package:metrocoffee/screens/authentication/login.dart';
import 'package:metrocoffee/screens/base/base.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/all_menu.dart';
import 'package:metrocoffee/screens/initial/splashscreen.dart';
import 'package:metrocoffee/screens/sharables/checkout.dart';
import 'package:metrocoffee/screens/sharables/drink_detail.dart';
import 'package:metrocoffee/screens/sharables/product_detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Metro Coffee',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/Login': (BuildContext context) => Login(),
        '/Base': (BuildContext context) => Base(),
        '/DrinkDetails': (BuildContext context) => DrinkDetail(),
        '/AllMenu': (BuildContext context) => AllMenu(),
        '/ProductDetails': (BuildContext context) => ProductDetail(),
        '/CheckoutPage': (BuildContext context) => CheckoutPage(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontFamily: 'PoppinsBold'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
