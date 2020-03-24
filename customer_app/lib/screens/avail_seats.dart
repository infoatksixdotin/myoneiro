import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';


class availSeats extends StatefulWidget {
  @override
  _availSeatsState createState() => new _availSeatsState();
}

class _availSeatsState extends State<availSeats>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
       appBar: new AppBar(
        title: new Text('Select slots'),
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
              //Text("My Slot", style: TextStyle(color: AppTheme.lightBlueAccent, fontSize: 50),)
            ],
          ),
        ),
      ),
    );
  }
}