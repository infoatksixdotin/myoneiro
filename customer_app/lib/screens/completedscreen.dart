import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_app1/theme/appTheme.dart';

class completedscreen extends StatefulWidget {
  @override
  _completedscreenState createState() => _completedscreenState();
}

class _completedscreenState extends State<completedscreen> {
  Size deviceSize;
  
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: 5000,
        padding: EdgeInsets.all(0.0),
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('json/completeddata.json'),
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //decode json
              var mydata = json.decode(snapshot.data.toString());
              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    color: AppTheme.whiteColor,
                    elevation: 5,
                    //borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                           bottom: Radius.circular(15),
                     ),
                    ),
                    
                    margin: EdgeInsets.symmetric(
                            vertical: deviceSize.height * 0.02,
                            horizontal: deviceSize.width * 0.05),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("title:" + mydata[index]['title'],
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        new Text("slots:" + mydata[index]['slots'],
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        new Text("price:" + mydata[index]['price'],
                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        new Text("group:" + mydata[index]['group'],
                        style: TextStyle(fontSize: 15),),
                      
                      ],
                    ),

                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
