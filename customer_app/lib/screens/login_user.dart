import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/model/SMSResponse.dart';
import 'package:flutter_app1/theme/appTheme.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:ui';

class  LoginAuth extends StatefulWidget {
  @override
  _LoginAuthState createState() => new _LoginAuthState();
}

class _LoginAuthState extends State<LoginAuth> {
  String smsCode;
  String phoneNo;
  SMSResponse  smsResponse;
  
  final databaseReference = Firestore.instance;
  TextEditingController taskPhoneInputController;


  @override
  initState() {
    taskPhoneInputController = new TextEditingController();
    super.initState();
  }

  Future<bool> validateSMS(String smsCode, String userEnteredSMS) async {
    if (smsCode == userEnteredSMS) {
      print("sms matched");
     // writeCredentials();
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/BottomNavBar');
      return true;
    }
    else {
      print("sms not matched.");
    }
    return false;
  }

  postTest(String phoneNo) async {

    int min = 100000; //min and max values act as your 6 digit range kannan sir code
    int max = 999999;
    var randomizer = new Random();
    var rNum = min + randomizer.nextInt(max - min);


    final uri = 'https://api.textlocal.in/send/';
    var requestBody = {
      'apikey':'vyX9h4mukPI-PMb9KOZRTBetHiC4NSzbgpTAz8VmVC',
      'numbers':phoneNo,
      'sender':'KSDEMO',
      'message':rNum.toString() +' is your FLASH verification code. Code valid for 10 minutes only, one time use. Do not share with anyone. Happy Shopping!',
    };
    http.Response response = await http.post(
      uri,
      body: requestBody,
    );


    var parsedJson = json.decode(response.body);
    var statusValue = parsedJson['status'];
    if (statusValue == "success") {
      var messageValue = parsedJson['message'];
      String contentValue = messageValue['content'];
      String smsValue = contentValue.substring(0,6);
      smsCodeDialog(this.context,smsValue);

    }

    print(response.body);
  }

  Future<bool> smsCodeDialog(BuildContext context, String smsCode) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter the Code'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
              keyboardType: TextInputType.phone,
            ),
            contentPadding: EdgeInsets.all(10.0),

            actions: <Widget>[
              new RaisedButton(
                child: Text('Done'),
                onPressed: (){
                 // Future<bool>rt = validateSMS(smsCode,  this.smsCode);
                  if (taskPhoneInputController.text.isNotEmpty) {
              Firestore.instance
                .collection('LoginUsers')
                .add({
                  "phone": taskPhoneInputController.text,
              })
              .then((result) => {
              validateSMS(smsCode,  this.smsCode),
                taskPhoneInputController.clear(),
              })
              
              .catchError((err) => print(err));
          }
                },
              )
            ],
          );
        });
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
                SizedBox(height: 60,),
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/logo/images.jpg'),
                  //test-image.png
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: EdgeInsets.all(30.0),
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
                      SizedBox(height: 40,),
                       Container(
                        child: RaisedButton(
                            child: Text('Login with OTP'),
                            onPressed: (){
                              postTest(this.phoneNo);
                            },
                            textColor: Colors.white,
                            elevation: 7.0,
                          color: AppTheme.lightBlueAccent,
                        ),
                         ),
                      SizedBox(height: 20,),
                      new FlatButton(
                        child: Text('Register Here'),
                        textColor: AppTheme.lightBlueAccent,
                        onPressed: (){
                          Navigator.pushNamed(context,'/register');
                        },
                      ),
                      SizedBox(height: 45,),
                      new FlatButton(
                        child: Text('skip',textAlign: TextAlign.end,),
                        textColor: AppTheme.lightBlueAccent,
                        onPressed: (){
                          Navigator.pushNamed(context,'/BottomNavBar');
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}


