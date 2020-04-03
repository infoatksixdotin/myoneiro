import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/alertdialog.dart';
import 'package:flutter_app1/theme/appTheme.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class OTPUtil {
    static bool otpMatch = false;
    static Future<bool> verifyYourDevice(BuildContext context, int phone) async {
      try {
            otpMatch = false;
            String strPhone = phone.toString();
            int min = 100000; //min and max values act as your 6 digit range kannan sir code
            int max = 999999;
            var randomizer = new Random();
            var rNum = min + randomizer.nextInt(max - min);
            final uri = 'https://api.textlocal.in/send/';
            var requestBody = {
              'apikey':'vyX9h4mukPI-PMb9KOZRTBetHiC4NSzbgpTAz8VmVC',
              'numbers':strPhone,
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
              await smsCodeDialog(context,smsValue);
            }
      }
      catch(e) {
        otpMatch = false;
        print(e);
      }
      return otpMatch;
  }

  static smsCodeDialog(BuildContext context, String smsCode) async {
    String userEnteredSMS = "";
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            backgroundColor: AppTheme.lightBlueAccent,
            title: Text('Enter the OTP'),
            content: TextField(
              onChanged: (value) {
                userEnteredSMS = value;
              },
              keyboardType: TextInputType.phone,
            ),
            contentPadding: EdgeInsets.all(10.0),

            actions: <Widget>[
                new RaisedButton(
                  child: Text('Cancel'),
                  color: AppTheme.lightBlueAccent,
                  textColor: Colors.white,
                  onPressed: (){
                    Navigator.of(context).pop();
                    otpMatch = false;
                  }
                ),
                new RaisedButton(
                  child: Text('OK'),
                  color: AppTheme.lightBlueAccent,
                  textColor: Colors.white,
                  onPressed: () {
                    if (userEnteredSMS == smsCode) {
                      otpMatch = true; // KU need to write this code properly.
                      Navigator.of(context).pop();
                    }
                    else {
                      showAlert(context,"Error","Entered invalid OTP");
                    }
                  },
                ),
            ],
          );
        });
  }


  static Future<bool> verifyYourDeviceTest(BuildContext context, int phone) async {
      try {
            String smsValue = "123456";
            bool rt = await smsCodeDialog(context,smsValue);
      }
      catch(e) {
        print(e);
      }
     return false;
  }

}