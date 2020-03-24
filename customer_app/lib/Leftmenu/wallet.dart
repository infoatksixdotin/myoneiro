import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';


class wallet extends StatefulWidget {
  @override
  _walletState createState() => new _walletState();
}

class _walletState extends State<wallet>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
       appBar: new AppBar(
        title: new Text('My Bookings'),
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
              Text("My Wallet", style: TextStyle(color: AppTheme.lightBlueAccent, fontSize: 50),)
            ],
          ),
        ),
      ),
    );
  }
}