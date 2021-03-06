import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';

showAlert(BuildContext context, String caption, String value) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme(
        data: Theme.of(context).copyWith(dialogBackgroundColor: AppTheme.whiteColor),
        child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: 
        BorderRadius.all(Radius.circular(15),),),
          title: new Text(caption,textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
          content: new Text(value,textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            new FlatButton(
              child: new Text('OK',style: TextStyle(color: AppTheme.lightBlueAccent)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
      ));
    },
  );
}