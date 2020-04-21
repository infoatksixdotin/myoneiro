import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';
import 'dart:ui';

class FirebaseApiConsolePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirebaseApiConsolePage();
  }
}

class _FirebaseApiConsolePage extends State<FirebaseApiConsolePage> {
  Size _deviceSize;
  String m_collectionName;
  String m_rowValue;
  bool m_rw = true; // read or write
  TextEditingController m_txtResponse = TextEditingController();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     _deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("Rest API Console", style: TextStyle(color: AppTheme.lightBlueAccent,),),
          iconTheme: new IconThemeData(color: AppTheme.lightBlueAccent),
          centerTitle: true,
          leading: new Container(),
        ),
        backgroundColor: AppTheme.ScaffoldBackgroundColor,
        body: new SingleChildScrollView(
                  child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    initialValue: m_collectionName,
                    cursorColor: AppTheme.lightBlueAccent,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(hintText: 'collection name', focusColor: AppTheme.lightBlueAccent, enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.lightBlueAccent, width: 1.0),
                    ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.lightBlueAccent,width: 1.0),
                      ),),
                    onChanged: (value) {
                      m_collectionName = value;
                    },
                    style: TextStyle(color: AppTheme.lightBlueAccent),
                    
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    initialValue: m_rowValue,
                    cursorColor: AppTheme.lightBlueAccent,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(hintText: 'row value', focusColor: AppTheme.lightBlueAccent, enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.lightBlueAccent, width: 1.0),
                    ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.lightBlueAccent,width: 1.0),
                      ),),
                    onChanged: (value) {
                      m_rowValue = value;
                    },
                    style: TextStyle(color: AppTheme.lightBlueAccent),
                    
                  ),

                  SizedBox(height: 10.0),
                  CheckboxListTile(
                  value: m_rw,
                  onChanged: (value) {
                      setState(() {
                      m_rw = value;
                    });
                  },
                  title: new Text('',style: TextStyle(color: AppTheme.lightBlueAccent),),
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor:AppTheme.lightBlueAccent,
                ),
                    RaisedButton(
                     color: AppTheme.lightBlueAccent,
                     child: Text(m_rw ? 'Read' : 'Write', style: TextStyle(color: Colors.black)),
                     onPressed: () => callFirebaseApi(m_collectionName, m_rowValue),
                     elevation: 7.0,
                   ),
                  TextField(
                    readOnly: true,
                    controller: m_txtResponse,
                    cursorColor: AppTheme.lightBlueAccent,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(hintText: '', focusColor: AppTheme.lightBlueAccent, enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppTheme.lightBlueAccent, width: 1.0),
                    ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppTheme.lightBlueAccent,width: 1.0),
                      ),),
                    onChanged: (value) {
                    },
                    style: TextStyle(color: AppTheme.lightBlueAccent),
                  ),
                ],
              )),
        ),
      ),
    ); // Scaffold
  }
 
  void callFirebaseApi(String collectionName, String rowValue) {
    (m_rw == true) ? read(collectionName, rowValue) : write(collectionName, rowValue) ;
  }

  void read(String collectionName, String rowValue) {
 
  }

  void write(String collectionName, String rowValue) {
    DocumentReference ref =  Firestore.instance.collection(collectionName).document('TESTID1');
  }
}
/*Firestore.instance
                .collection('users')
                .add({
                  "name": taskNameInputController.text,
                  "phone": taskPhoneInputController.text,
				          "email": taskEmailInputController.text,
				          "age": taskAgeInputController.text
              })
              .then((result) => {
                Navigator.pushNamed(context,'/BottomNavBar'),
                taskNameInputController.clear(),
                taskPhoneInputController.clear(),
				taskEmailInputController.clear(),
				taskAgeInputController.clear()
              })
              .catchError((err) => print(err));
              */