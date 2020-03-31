import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class PassengerDetails extends StatefulWidget {
  PassengerDetails({Key key}) : super(key: key);

  @override
  _PassengerDetailsState createState() => _PassengerDetailsState();
}
class _PassengerDetailsState extends State<PassengerDetails> {
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
                Align(alignment: Alignment.center,
                  child: Container(
                    child: Text("Passenger Details",style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  // child: Expanded(
                  child: new TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                      hintText: ' Name',
                      icon: new Icon(
                        Icons.person, color: AppTheme.lightBlueAccent,),
                    ),
                  ),
                  // )
                ),
                new Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  // child: Expanded(
                  child: new TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: new InputDecoration(
                      hintText: ' Phone',
                      icon: new Icon(
                        Icons.call, color: AppTheme.lightBlueAccent,),
                    ),
                  ),
                  // )
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('Gender'),
                    addRadioButton(0, 'Male'),
                    addRadioButton(1, 'Female'),
                  ],
                ),
                SizedBox(height: 120),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      //height: 50.0,
                      //width: 210.0,
                      child: new RaisedButton(
                          color: AppTheme.lightBlueAccent,
                          child: new Text(
                            'Pay',
                            style: new TextStyle(
                                color: Colors.white
                            ),
                          ),
                          onPressed: () {
                           Navigator.pushNamed(context,'/PaymentOptions');
                          }
                      ),
                    ),
                  ],
                )
              ],
            ),
        ),
      ),
    );
  }

  List gender=["Male","Female"];

  String select;

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: select,
          onChanged: (value){
            setState(() {
              print(value);
              select=value;
            });
          },
        ),
        Text(title)
      ],
    );
  }
}
