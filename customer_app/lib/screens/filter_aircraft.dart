import 'package:flutter/material.dart';

class filter_aircraft extends StatefulWidget {
  @override
  filter_aircraftState createState() {
    return new filter_aircraftState();
  }
}

class filter_aircraftState extends State<filter_aircraft> {

  bool _isChecked = true;

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('CheckBox'),
            content: CheckboxListTile(
              title: Text("CheckBox Text"),
              value: _isChecked,
              onChanged: (val) {
                setState(() {
                  _isChecked = val;
                });
              },
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Show Alert Dialog'),
          color: Colors.lightBlueAccent,
          onPressed: () => _displayDialog(context),
        ),
      ),
    );
  }
}