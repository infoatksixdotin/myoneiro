import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_app1/theme/appTheme.dart';

class AvailAircrafts extends StatefulWidget {
  @override
  _AvailAircraftsState createState() => _AvailAircraftsState();
}

class _AvailAircraftsState extends State<AvailAircrafts> {
  Size deviceSize;
  
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Aircraft List'),
        backgroundColor: AppTheme.lightBlueAccent,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        height: 5000,
        padding: EdgeInsets.all(0.0),
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('json/aircraftdata.json'),
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
                    child: new GestureDetector(
                      onTap: ()
                      {
                       Navigator.pushNamed(context,'/availSeats');
                       //Navigator.pushNamed(context,'/PaymentOptions'); //for testing
                      },
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
