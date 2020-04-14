import 'package:flutter/material.dart';
import 'dart:convert';

class bookedscreen extends StatefulWidget {
  @override
  _bookedscreenState createState() => _bookedscreenState();
}

class _bookedscreenState extends State<bookedscreen> {
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
                .loadString('json/bookeddata.json'),
            initialData: null,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //decode json
              var mydata = json.decode(snapshot.data.toString());
              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new  ListTile(
                            //leading: Icon(Icons.local_airport, size: 70,color: Colors.black,),
                            leading: CircleAvatar(radius: 35.0,backgroundImage: AssetImage(mydata[index]['imageurl']),),// no matter how big it is, it won't overflow
                            title: new Text(mydata[index]['title']+'     Rs:'+ mydata[index]['price'],
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                            subtitle: new Text("slots available: "+mydata[index]['slots'],
                                style: TextStyle(color: Colors.black)),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: Text('Cancel',
                                    style: TextStyle(color: Colors.lightBlueAccent)),
                                onPressed: () {
                                 // Navigator.pushNamed(context,'/aircraft_slot');
                                },
                              ),
                              FlatButton(
                                child: new Text(mydata[index]['group'],
                                    style: TextStyle(color: Colors.lightBlueAccent)),
                                onPressed: () {
                                  //Navigator.pushNamed(context,'/aircraft_slot');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context,'/TicketScreen');
                    },
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
