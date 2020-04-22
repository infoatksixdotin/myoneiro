import 'package:flutter/material.dart';
import 'package:flutter_app1/appmanager.dart';
import 'package:flutter_app1/model/userdata.dart';
import 'package:flutter_app1/screens/alertdialog.dart';
import 'package:flutter_app1/theme/appTheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app1/utils/otputil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  File imageURI;
  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageURI = image;

    });
  }
  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageURI = image;
    });
  }

  final databaseReference = Firestore.instance;
  TextEditingController taskNameInputController;
  TextEditingController taskPhoneInputController;
  TextEditingController taskEmailInputController;
  TextEditingController taskAgeInputController;
  TextEditingController taskLocationInputController;
  TextEditingController taskPincodeInputController;

@override
initState() {
  taskNameInputController = new TextEditingController();
  taskNameInputController.text = "Full Name";
  taskPhoneInputController = new TextEditingController();
  taskPhoneInputController.text = "1234567890";
  taskEmailInputController = new TextEditingController();
  taskEmailInputController.text =  "firstname@gmail.com";
  taskAgeInputController = new TextEditingController();
  taskAgeInputController.text = "21";
  taskLocationInputController = new TextEditingController();
  taskLocationInputController.text = "Bangalore";
  taskPincodeInputController = new TextEditingController();
  taskPincodeInputController.text = "560037";

  super.initState();
}

  @override
  Widget build(BuildContext context) {

  final String tmpPhone = ModalRoute.of(context).settings.arguments;
  taskPhoneInputController.text = tmpPhone;

  return SafeArea(
    child: new Scaffold(
      appBar: new AppBar(
          title: new Text(
            "Register", style: TextStyle(color: AppTheme.whiteColor,),),
          backgroundColor: AppTheme.lightBlueAccent,
          iconTheme: new IconThemeData(color: AppTheme.lightBlueAccent),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.close,color: Colors.white,),
              onPressed: () => Navigator.of(context).pop(null),
            ),
          ],
          leading: new Container(),
        ),
        backgroundColor: AppTheme.whiteColor,
      body: SingleChildScrollView(
        child: Container (
          padding: new EdgeInsets.all( 20.0 ) ,
          child: Column (
            children: <Widget>[
              imageURI == null
                  ? CircleAvatar(radius: 50.0,
                backgroundColor: Colors.black,)
                  : CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.black,
                  child: Image.file( imageURI, width: 300, height: 200, fit: BoxFit.cover)),
              GestureDetector(
                child: new Icon( Icons.edit, color: AppTheme.lightBlueAccent,),
                onTap: (){
                  setState(() {
                    imageURI;
                  });
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Theme(
                          data: Theme.of(context).copyWith(dialogBackgroundColor: AppTheme.whiteColor),
                          child: AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius:
                            BorderRadius.all(Radius.circular(15),),),
                            title: new Text('Choose Image',textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.black)),
                            actions: <Widget>[
                              ButtonBar(
                                alignment: MainAxisAlignment.start,
                                buttonHeight: 5, buttonMinWidth: 35,
                                buttonPadding: EdgeInsets.all(18),
                                children:<Widget>[
                                  new RaisedButton(
                                    shape: RoundedRectangleBorder(borderRadius:
                                    BorderRadius.all(Radius.circular(15),),),
                                    child: new Text('Camera',style: TextStyle(color: AppTheme.whiteColor)),
                                    onPressed: () {
                                      getImageFromCamera();
                                      Navigator.pop(context);
                                    },
                                    color: Colors.blue,
                                  ),
                                  new RaisedButton(
                                    shape: RoundedRectangleBorder(borderRadius:
                                    BorderRadius.all(Radius.circular(15),),),
                                    child: new Text('Gallery',style: TextStyle(color: AppTheme.whiteColor)),
                                    onPressed: () {
                                      getImageFromGallery();
                                      Navigator.pop(context);
                                    },
                                    color: Colors.pink,
                                  ),
                                ],
                              )
                            ],
                          )
                      );
                    },
                  );
                },
              ),
              new Container(
                padding: const EdgeInsets.only( top: 5.0 ),
                child: new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    hintText: ' Name',
                    labelText: 'Name',
                    icon: new Icon(
                      Icons.person, color: AppTheme.lightBlueAccent, ),
                  ),
                  controller: taskNameInputController,
                ),
              ),
              new Container(
                padding: const EdgeInsets.only( top: 5.0 ),
                child: new TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(
                    hintText: ' Phone Number',
                    labelText: 'Phone Number',
                    icon: new Icon(
                      Icons.call, color: AppTheme.lightBlueAccent, ),
                  ),
                  controller: taskPhoneInputController,
                ),
              ),
              new Container(
                padding: const EdgeInsets.only( top: 5.0 ),
                child: new TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: new InputDecoration(
                      hintText: 'you@example.com',
                      labelText: 'E-mail Address',
                      icon: new Icon(
                        Icons.email, color: AppTheme.lightBlueAccent, )
                  ),
                  controller: taskEmailInputController,
                ),
              ),
              new Container(
                padding: const EdgeInsets.only( top: 5.0 ),
                // child: Expanded(
                child: new TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(
                    hintText: 'Age',
                    labelText: 'Age',
                    icon: new Icon(
                      Icons.add, color: AppTheme.lightBlueAccent, ),
                  ),
                  controller: taskAgeInputController,
                ),
                // )
              ),
              new Container(
                padding: const EdgeInsets.only( top: 5.0 ),
                child: new TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                    hintText: 'Location',
                    labelText: 'Location',
                    icon: new Icon(
                      Icons.location_city, color: AppTheme.lightBlueAccent, ),
                  ),
                  controller: taskLocationInputController,
                ),
              ),
              new Container(
                padding: const EdgeInsets.only( top: 5.0 ),
                child: new TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: new InputDecoration(
                    hintText: 'Pincode',
                    labelText: 'Pincode',
                    icon: new Icon(
                      Icons.edit_location, color: AppTheme.lightBlueAccent, ),
                  ),
                  controller: taskPincodeInputController,
                ),
              ),
              Row (
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text ( 'Gender', style: TextStyle ( color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 15 ) ),
                  addRadioButton ( 0, 'Male' ),
                  addRadioButton ( 1, 'Female' ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    height: 50.0,
                    width: 210.0,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 40.0 ),
                    child: new RaisedButton(
                      shape: RoundedRectangleBorder (
                        borderRadius: BorderRadius.circular ( 50.0 ),
                      ),
                      child: new Text(
                        'Register',
                        style: new TextStyle(
                            color: Colors.white
                        ),
                      ),
                      onPressed: () {
                        validateUserProfile ();
                      },
                      color: AppTheme.lightBlueAccent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
  }

  List gender = ["Male", "Female"];
  String select;
  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor:Colors.lightBlueAccent,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value) {
            setState(() {
              print(value);
              select = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }

UserData uiToUserData() {
    UserData data = new UserData();
    data.name = taskNameInputController.text.trim();
    data.email = taskEmailInputController.text.trim();
    data.age = int.parse(taskAgeInputController.text.trim());
    data.phone = int.parse(taskPhoneInputController.text.trim());
    data.location = taskLocationInputController.text.trim();
    data.pincode = int.parse(taskPincodeInputController.text.trim());
    return data;
  }
 
  Future<void> validateUserProfile() async  {
    bool rt = false;
    UserData data =  uiToUserData();
    String errMsg = data.validateUser();
    if (errMsg.isEmpty) {
      rt = await OTPUtil.verifyYourDevice(this.context, data.phone);
      if (rt) {
        rt = await UserData.createReq(uiToUserData());
        if (!rt) {
          showAlert(this.context, "Error,","Registration Failed, Please try again..!");
        }
        else {
          gotoHomePage();
        }
      }
      else {
          showAlert(context, "Error", "OTP verification failed.");
      }
    }
    else {
      showAlert(context, "Error", errMsg);
    }
  }
 
  void registerUser() async {
    bool rt = await UserData.createReq(uiToUserData());
     if (!rt) {
      showAlert(this.context, "Error,","Registration Failed, Please try again..!");
    }
    else {
      gotoHomePage();
    }
   }

  void gotoHomePage() {
    AppManager.setNewUser(true);
    Navigator.of(context).pop();// KU need recheck this part of code
    UserData data = UserData.getUser();
    AppManager.saveLocal(data);
    Navigator.pushNamed(context,'/home');
    showAlert(context, "Congratulation", "Your profile created ..!   50% discount for next 5 rides, Offer Valid till 31st April, Use coupn code: K6APR05");
  }
}