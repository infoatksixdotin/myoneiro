import 'package:flutter/material.dart';
import 'package:flutter_app1/Leftmenu/drawer_menu.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class Support extends StatefulWidget {
  @override
  _SupportState createState() => new _SupportState();
}

class _SupportState extends State<Support>{


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.ScaffoldBackgroundColor,
        appBar: new AppBar(
          title: new Text('Support'),
          backgroundColor: AppTheme.lightBlueAccent,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        drawer:DrawerMenu.getMenu(context),
        body: Container(
          child: Center(
            child: Column(
              // center the children
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("We're here to help You :)", style: TextStyle(color: AppTheme.lightBlueAccent),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}