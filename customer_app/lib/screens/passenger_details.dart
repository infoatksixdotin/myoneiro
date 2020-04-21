import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/model/userdata.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class PassengerDetails extends StatefulWidget {
  PassengerDetails({Key key}) : super(key: key);

  @override
  _PassengerDetailsState createState() => _PassengerDetailsState();
}
class _PassengerDetailsState extends State<PassengerDetails> {
  final databaseReference = Firestore.instance;
  TextEditingController taskNameInputController;
  TextEditingController taskPhoneInputController;
  TextEditingController taskEmailInputController;
  TextEditingController taskAgeInputController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;
  bool checkboxValue = true;

  @override
  initState() {
    taskNameInputController = new TextEditingController();
    taskPhoneInputController = new TextEditingController();
    taskEmailInputController = new TextEditingController();
    taskAgeInputController = new TextEditingController();
    super.initState();
    UserData user = UserData.getUser();
    taskNameInputController.text = user.name;
    taskPhoneInputController.text = user.phone.toString();
    taskEmailInputController.text = user.email;
    taskAgeInputController.text = user.age.toString();
  }
  bool _submittable() {
    return _agreedToTOS;
  }

  void _submit() {
    if (_formKey.currentState.validate()) {
      Navigator.pushNamed(context, '/PaymentOptions');
    }
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }


  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Passenger Details...", style: TextStyle(color: AppTheme.whiteColor,),),
          backgroundColor: AppTheme.lightBlueAccent,
          iconTheme: new IconThemeData(color: AppTheme.whiteColor),
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        backgroundColor: AppTheme.whiteColor,
        body: SingleChildScrollView(
          child: Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 0,margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  //SizedBox(height: 20,),
//                Align(alignment: Alignment.topLeft,
//                  child: Container(
//                    child: Text("  Passenger Details",
//                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),
//                  ),
//                ),
                  //SizedBox(height: 20),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                              children: <Widget>[
                                Expanded(
                                    child: Divider(
                                      color: Colors.black87,
                                    )
                                ),
                                Text("Primary Passenger Details",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),),
                                Expanded(
                                    child: Divider(
                                      color: Colors.black87,
                                    )
                                ),
                              ]
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              icon: Icon(Icons.person, color: Colors.lightBlueAccent),
                            ),
//                            validator: (String value) {
//                              if (value.trim().isEmpty) {
//                                return 'Name is required';
//                              }
//                            },
                            controller: taskNameInputController,
                          ),
                          //SizedBox(height: 20),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                              icon: Icon(Icons.call, color: Colors.lightBlueAccent),
                            ),
//                            validator: (String value) {
//                              if (value.trim().isEmpty) {
//                                return 'Phone is required';
//                              }
//                            },
                              controller: taskPhoneInputController
                          ),
                          //SizedBox(height: 20),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Age',
                              icon: Icon(Icons.add, color: Colors.lightBlueAccent),
                            ),
//                            validator: (String value) {
//                              if (value.trim().isEmpty) {
//                                return 'Age is required';
//                              }
//                            },
                            controller: taskAgeInputController,
                          ),
                          //SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('Gender',style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 15)),
                              addRadioButton(0, 'Male'),
                              addRadioButton(1, 'Female'),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                              children: <Widget>[
                                Expanded(
                                    child: Divider(
                                      color: Colors.black87,
                                    )
                                ),
                                Text("Secondary Passenger Details",style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold,)),
                                Expanded(
                                    child: Divider(
                                      color: Colors.black87,
                                    )
                                ),
                              ]
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 200, 0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Apply Coupon',
                                icon: Icon(Icons.local_offer, color: Colors.lightBlueAccent),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: _agreedToTOS,
                                onChanged: _setAgreedToTOS,
                                activeColor: Colors.lightBlueAccent,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => _setAgreedToTOS(!_agreedToTOS),
                                  child: Text(
                                    'I agree to the Terms of Services and Privacy Policy',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: 20,),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                                new Container(
                                  height:50.0, width: 170.0,
                                  child: new RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                          color: AppTheme.lightBlueAccent,
                                          child: new Text('Pay', style: new TextStyle(color: Colors.white),),
                                          onPressed: _submittable() ? _submit : Navigator.pushNamed(context, '/PaymentOptions'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
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
    UserData data = UserData.getUser();
    data.name = taskNameInputController.text.trim();
    data.email = taskEmailInputController.text.trim();
    data.age = int.parse(taskAgeInputController.text);
    data.phone = int.parse(taskPhoneInputController.text);
    return data;
  }
}