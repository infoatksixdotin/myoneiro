import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class PaymentOptions extends StatefulWidget {
  PaymentOptions({Key key}) : super(key: key);

  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}
enum SingingCharacter { Paytm, GooglePay }

class _PaymentOptionsState extends State<PaymentOptions> {
  SingingCharacter _character = SingingCharacter.Paytm;

  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
        title: new Text(
          "Select Payment Mode", style: TextStyle(color: AppTheme.whiteColor,),),
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
            child: Padding(
              padding: const EdgeInsets.all(90.0),
              child: Column(              
        children: <Widget>[
              ListTile(
                title: const Text('Paytm'),
                leading: Radio(
                  value: SingingCharacter.Paytm,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('GooglePay'),
                leading: Radio(
                  value: SingingCharacter.GooglePay,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 150),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      height: 50.0,
                      width: 210.0,
                      child: new RaisedButton(
                        color: AppTheme.lightBlueAccent,
                        child: new Text(
                          'Pay',
                          style: new TextStyle(
                              color: Colors.white
                          ),
                        ),

                onPressed: () {

                         }
                        
                      ),
                    ),
                  ],
              )
        ],
      ),
            ),
          ),
      ),
    );
  }
}