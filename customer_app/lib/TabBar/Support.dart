import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => new _SupportState();
}

class _SupportState extends State<Support>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ScaffoldBackgroundColor,
      appBar: new AppBar(
        automaticallyImplyLeading: false, //to remove back button
        title: new Text('Support'),
        backgroundColor: AppTheme.lightBlueAccent,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: Column(
            // center the children
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Support", style: TextStyle(color: AppTheme.TextColor, fontSize: 50),)
            ],
          ),
        ),
      ),
    );
  }
}