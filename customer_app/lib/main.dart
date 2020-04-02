import 'package:flutter/material.dart';
import 'package:flutter_app1/routes.dart';
import 'package:flutter_app1/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(),
        routes: routes,
        debugShowCheckedModeBanner: false
    );
  }
}