import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/appmanager.dart';
import 'package:flutter_app1/model/SMSResponse.dart';
import 'package:flutter_app1/model/userdata.dart';
import 'package:flutter_app1/screens/alertdialog.dart';
import 'package:flutter_app1/screens/register_user.dart';
import 'package:flutter_app1/theme/appTheme.dart';
import 'package:flutter_app1/utils/miscutil.dart';
import 'package:flutter_app1/utils/otputil.dart';

class  LoginAuth extends StatefulWidget {
  @override
  _LoginAuthState createState() => new _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  String smsCode;
  String phoneNo = "9999999999";
  SMSResponse  smsResponse;
  
  final databaseReference = Firestore.instance;
  TextEditingController taskPhoneInputController;
  

  @override
  initState() {
    taskPhoneInputController = new TextEditingController();
    taskPhoneInputController.text = phoneNo;
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              "Login", style: TextStyle(color: AppTheme.whiteColor,),),
            backgroundColor: AppTheme.lightBlueAccent,
            iconTheme: new IconThemeData(color: AppTheme.lightBlueAccent),
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            leading: new Container(),
          ),
        resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 40,),
                  Text('Welcome to MyOneiro!',style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold, fontSize: 30)),
                  SizedBox(height: 30,),
                  CircleAvatar(
                    radius: 80.0,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('assets/logo/images.jpg'),
                    //test-image.png
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Column(
                      children: <Widget>[
                         Container(
                          child: Column(
                            children: <Widget>[
                              new Container(
                               padding: const EdgeInsets.only(top: 10.0),
                      //child: Expanded(
                             child: new TextFormField(
						               onChanged: (value) {
                                this.phoneNo = value;
                              },
                              keyboardType: TextInputType.phone,
                          decoration: new InputDecoration(
                            hintText: ' Phone Number',
                            labelText: 'Phone Number',
                            icon: new Icon(
                              Icons.call, color: AppTheme.lightBlueAccent,),
                          ),
                          controller: taskPhoneInputController,
                        ),
                    // )
                            ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                         Container(
                           height:50.0, width: 170.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                              child: Text('Login'),
                              onPressed: (){
                                //postTest(this.phoneNo);
                                onLogin();
                              },
                              textColor: Colors.white,
                              elevation: 7.0,
                            color: AppTheme.lightBlueAccent,
                          ),
                           ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
  void onLogin() async {
    int phone = int.parse(phoneNo);
    if (MiscUtil.validatePhone(phone)) {
      bool rt = await UserData.getUserByPhoneReq(phone);
      if (rt) {
        bool rt = await OTPUtil.verifyYourDevice(context, phone);
        if (rt) {
          print("otp match = " + rt.toString());
          AppManager.saveLocal(UserData.getUser());
          gotoHomePage();
        }
         else {
           print("otp match = " + rt.toString());
        }
      }
      else {
        gotoRegistrationPage();
      }
    }
    else {
      showAlert(this.context, "ERROR","Phone number should be 10 digits");
    }
  }
  void gotoHomePage() {
    Navigator.pushNamed(context,'/home');
  }

  void gotoRegistrationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RegistrationScreen(),
        // Pass the arguments as part of the RouteSettings. The
        // DetailScreen reads the arguments from these settings.
        settings: RouteSettings(
        arguments: phoneNo,
        ),
      ),
    );
   }
}