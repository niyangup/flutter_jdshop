import 'package:flutter/material.dart';

import 'routers/router.dart';

// 引入provider
import 'package:provider/provider.dart';
import 'provider/Cart.dart';

import 'provider/CheckOut.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(builder: (_) => Counter()),
        ChangeNotifierProvider(builder: (_) => Cart()),
        ChangeNotifierProvider(builder: (_) => CheckOut())             
      ],
      child: MaterialApp(
        // home: Tabs(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: onGenerateRoute,
        theme: ThemeData(
            // primaryColor: Colors.yellow
            primaryColor: Colors.white),
      ),
    );
  }
}
