import 'package:flutter/material.dart';
import 'package:flutter_app1/Leftmenu/drawer_menu.dart';
import 'package:flutter_app1/model/userdata.dart';
import 'package:flutter_app1/screens/alertdialog.dart';
import 'package:flutter_app1/theme/appTheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {

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
  taskPhoneInputController = new TextEditingController();
  taskEmailInputController = new TextEditingController();
  taskAgeInputController = new TextEditingController();
  taskLocationInputController = new TextEditingController();
  taskPincodeInputController = new TextEditingController();

  super.initState();

  UserData user = UserData.getUser();
  taskNameInputController.text = user.name;
  taskPhoneInputController.text = user.phone.toString();
  taskEmailInputController.text = user.email;
  taskAgeInputController.text = user.age.toString();
  taskLocationInputController.text = user.location;
  taskPincodeInputController.text = user.pincode.toString();
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Profile", style: TextStyle(color: AppTheme.whiteColor,),),
        backgroundColor: AppTheme.lightBlueAccent,
        iconTheme: new IconThemeData(color: AppTheme.whiteColor),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      backgroundColor: AppTheme.ScaffoldBackgroundColor,
      drawer:DrawerMenu.getMenu(context),
      body: SingleChildScrollView(
    child:  Container(
          padding: new EdgeInsets.all(8.0),
          child: Column(
      children: <Widget>[
              new Container(
                   padding: new EdgeInsets.all(0.0),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[ CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/logo/images.jpg'),
                  //test-image.png
                ),

                      ],
                    )
                ),
       new Container(
                    padding: const EdgeInsets.only(top: 0.0),
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
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 0.0),
                        child: new TextFormField(
                        keyboardType: TextInputType.phone,
                        readOnly: true,
                        decoration: new InputDecoration(
                          hintText: ' Phone Number',
                          labelText: 'Phone Number',
                          icon: new Icon(
                            Icons.call, color: AppTheme.lightBlueAccent,),
                        ),
                        controller: taskPhoneInputController,
                      ),
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 0.0),
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
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 0.0),
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
                      width: 130.0,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 40.0),
                      child: new RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: new Text(
                          'Save',
                          style: new TextStyle(
                              color: Colors.white
                          ),
                        ),
                        onPressed: () {
                            if (validateUserProfile()) {
                                saveUserChanges();
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
    UserData data = UserData.getUser();
    data.name = taskNameInputController.text.trim();
    data.email = taskEmailInputController.text.trim();
    data.age = int.parse(taskAgeInputController.text);
    data.phone = int.parse(taskPhoneInputController.text);
    data.location = taskLocationInputController.text.trim();
    data.pincode = int.parse(taskPincodeInputController.text.trim());
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
  void saveUserChanges() async {
      bool rt = await UserData.updateReq(uiToUserData());
      if (!rt) {
        showAlert(context, "Error", "Profile update failed, Please try again..!");
      }
      else {
        showAlert(context, "Success", "Your profile updated..!");
      }

  }
}