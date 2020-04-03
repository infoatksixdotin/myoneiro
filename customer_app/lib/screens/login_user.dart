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
  String phoneNo = "1234567890";
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
    return new Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
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
                            Container(
                              padding: EdgeInsets.all(8.0),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                       Container(
                        child: RaisedButton(
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