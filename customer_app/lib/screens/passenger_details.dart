import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class PassengerDetails extends StatefulWidget {
  PassengerDetails({Key key}) : super(key: key);

  @override
  _PassengerDetailsState createState() => _PassengerDetailsState();
}
class _PassengerDetailsState extends State<PassengerDetails> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _agreedToTOS = true;
  bool checkboxValue = true;


  bool _submittable() {
    return _agreedToTOS;
  }

  void _submit() {
    Navigator.pushNamed(context,'/PaymentOptions');
    _formKey.currentState.validate();
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _agreedToTOS = newValue;
    });
  }


  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Passenger Details", style: TextStyle(color: AppTheme.whiteColor,),),
        backgroundColor: AppTheme.lightBlueAccent,
        iconTheme: new IconThemeData(color: AppTheme.whiteColor),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20,),
              Align(alignment: Alignment.topLeft,
                child: Container(
                  child: Text("Passenger Details",
                    style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                        icon: Icon(Icons.person, color: Colors.lightBlueAccent),
                      ),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Name is required';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Phone',
                        icon: Icon(Icons.call, color: Colors.lightBlueAccent),
                      ),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Phone is required';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Age',
                        icon: Icon(Icons.add, color: Colors.lightBlueAccent),
                      ),
                      validator: (String value) {
                        if (value.trim().isEmpty) {
                          return 'Age is required';
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Gender'),
                        addRadioButton(0, 'Male'),
                        addRadioButton(1, 'Female'),
                      ],
                    ),
                    const SizedBox(height: 120.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: _agreedToTOS,
                            onChanged: _setAgreedToTOS,
                          ),
                          GestureDetector(
                            onTap: () => _setAgreedToTOS(!_agreedToTOS),
                            child: const Text(
                              'I agree to the Terms of Services and Privacy Policy',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //const Spacer(),
                        RaisedButton(
                          color: AppTheme.lightBlueAccent,
                          onPressed: _submittable() ? _submit : null,
                          child: const Text('Next',style: TextStyle(color: Colors.white),),
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
}