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
        title: new Text('Select Aircrafts'),
        backgroundColor: AppTheme.lightBlueAccent,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        width: 500,
       // height: 500,    
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    elevation: 10,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new  ListTile(
                          leading: CircleAvatar(backgroundImage: AssetImage(mydata[index]['imageurl']),),// no matter how big it is, it won't overflow
                          title: new Text(mydata[index]['title']+'Rs:'+ mydata[index]['price'],
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          subtitle: new Text("slots available: "+mydata[index]['slots'],
                              style: TextStyle(color: Colors.black)),
                              dense: true,
                              onTap: (){
                                 Navigator.pushNamed(context,'/availSeats');
                              },
                                    ),
                        ButtonBar(
                          children: <Widget>[
                              FlatButton(
                              child: new Text(mydata[index]['group'],
                                  style: TextStyle(color: Colors.lightBlueAccent)),
                              onPressed: () {
                                //Navigator.pushNamed(context,'/aircraft_slot');
                              },
                            ),
                            FlatButton(
                              child: Text('Book',
                                  style: TextStyle(color: Colors.lightBlueAccent)),
                              onPressed: () {
                                Navigator.pushNamed(context,'/availSeats');
                                },
                          ),
                          ],
                          ),
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
