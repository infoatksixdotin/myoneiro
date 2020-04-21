import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app1/appmanager.dart';
import 'package:flutter_app1/model/userdata.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => gotoLandingPage());
  }

  void gotoLandingPage() async {
    UserData userData = null;
    String userId = await AppManager.getLocalUserId();
    if (userId != null && userId.isEmpty == false) {
        if (await UserData.getUserReq(userId) == true) {
          userData = UserData.getUser();
        }
    }
    Navigator.of(context).pop();// KU need recheck this part of code
    if (userData != null) {
        goToHomePage();
    }
    else {
        gotoLoginPage();
    }
  }
 
  void gotoLoginPage() {
    Navigator.pushNamed(context,'/login');
  }

  /*
  void goToRegistrationPage() {
    Navigator.pushNamed(context,'/register');
  }
  */
  void goToHomePage() {
    Navigator.pushNamed(context, "/home");
  }
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 100.0,
                          backgroundColor: Colors.black,
                          backgroundImage: AssetImage('assets/logo/images.jpg'),
                          //test-image.png
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                        ),
                        Text(
                          "Joy ride ",
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
