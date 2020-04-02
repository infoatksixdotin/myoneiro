import 'package:flutter/material.dart';
import 'package:flutter_app1/appmanager.dart';
import 'package:flutter_app1/model/userdata.dart';
import 'package:flutter_app1/screens/alertdialog.dart';
import 'package:flutter_app1/theme/appTheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => new _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final databaseReference = Firestore.instance;
  TextEditingController taskNameInputController;
  TextEditingController taskPhoneInputController;
  TextEditingController taskEmailInputController;
  TextEditingController taskAgeInputController;
@override
initState() {
  taskNameInputController = new TextEditingController();
  taskNameInputController.text = "First Name Last Name";
  taskPhoneInputController = new TextEditingController();
  taskPhoneInputController.text = "1234567890";
  taskEmailInputController = new TextEditingController();
  taskEmailInputController.text =  "firsname@gmail.com";
  taskAgeInputController = new TextEditingController();
  taskAgeInputController.text = "21";
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Register", style: TextStyle(color: AppTheme.lightBlueAccent,),),
        backgroundColor: AppTheme.whiteColor,
        iconTheme: new IconThemeData(color: AppTheme.lightBlueAccent),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),
        ],
        leading: new Container(),
      ),
      backgroundColor: AppTheme.ScaffoldBackgroundColor,
      body: SingleChildScrollView(
    child:  Container(
          padding: new EdgeInsets.all(20.0),
          child: Column(
      children: <Widget>[
              new Container(
                   padding: new EdgeInsets.all(20.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[ CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/logo/images.jpg'),
                  //test-image.png
                ),

                      ],
                    )
                ),
       new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                   // child: Expanded(
                         child: new TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: new InputDecoration(
                            hintText: ' Name',
                            labelText: 'Name',                
                            icon: new Icon(
                              Icons.person, color: AppTheme.lightBlueAccent,),
                          ),
                          controller: taskNameInputController,
                      ),
                  // )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    //child: Expanded(
                        child: new TextFormField(
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
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    //child: Expanded(
                          child: new TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          // Use email input type for emails.
                          decoration: new InputDecoration(
                              hintText: 'you@example.com',
                              labelText: 'E-mail Address',
                              icon: new Icon(
                                Icons.email, color: AppTheme.lightBlueAccent,)
                                ),
                                controller: taskEmailInputController,
                      ),     
                   // )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                   // child: Expanded(
                                          child: new TextFormField(
                          keyboardType: TextInputType.phone,
                          decoration: new InputDecoration(
                            hintText: 'Age',
                            labelText: 'Age',
                            icon: new Icon(
                              Icons.add, color: AppTheme.lightBlueAccent,),
                          ),
                          controller: taskAgeInputController,
                      ),
                   // )
                ),
           new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      height: 50.0,
                      width: 210.0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 40.0),
                      child: new RaisedButton(
                        child: new Text(
                          'Register',
                          style: new TextStyle(
                              color: Colors.white
                          ),
                        ),

        onPressed: () {
            /* if (taskNameInputController.text.isNotEmpty &&
                taskPhoneInputController.text.isNotEmpty &&
				        taskEmailInputController.text.isNotEmpty &&
				        taskAgeInputController.text.isNotEmpty) {
          }*/
            if (validateUserProfile()) {
                registerUser();
            }
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
    );
  }


UserData uiToUserData() {
    UserData data = UserData.getUser();
    data.name = taskNameInputController.text.trim();
    data.email = taskEmailInputController.text.trim();
    data.age = int.parse(taskAgeInputController.text.trim());
    data.phone = int.parse(taskPhoneInputController.text.trim());
    return data;
  }
 
  bool validateUserProfile() {
    String errMsg = uiToUserData().validateUser();
    if (errMsg.isEmpty) {
      return true;
    }
    else {
      showAlert(context, "Error", errMsg);
    }
    return false;
  }
 
  void registerUser() async {
     if (await UserData.createReq(uiToUserData()) == true) {
        UserData data = UserData.getUser();
        AppManager.saveLocal(data);
        Navigator.pushNamed(context,'/home');
    }
    else {
      showAlert(this.context, "Error,","Registration Failed, Please try again..!");
    }
  }
}