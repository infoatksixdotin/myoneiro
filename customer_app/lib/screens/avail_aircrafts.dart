import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        child: new Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: Firestore.instance.collection('aircraft').snapshots(),
              builder: (context, snapshot) {
                if(!snapshot.hasData) Text('Loading data....Please Wait...');
                return new ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot ds = snapshot.data.documents[index];
                    return new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new ListTile(
                            leading: CircleAvatar(radius: 30.0, backgroundImage: AssetImage('assets/aircrafts/mehta.jpg'),), // no matter how big it is, it won't overflow
                            title: new Text(snapshot.data.documents[index]['title'] +
                                '           Rs: ' + snapshot.data.documents[index]['price'].toString(),
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
                            subtitle: new Text("Slots Available: " + snapshot.data.documents[index]['slots'].toString(),
                                style: TextStyle(color: Colors.black, fontSize: 15)),
                            onTap: () {
                              Navigator.pushNamed(context, '/availSeats');
                            },
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                child: new Text(
                                    snapshot.data.documents[index]['group'],
                                    style: TextStyle(
                                        color: Colors.lightBlueAccent,fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  //Navigator.pushNamed(context,'/aircraft_slot');
                                },
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: Text('Book',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context,'/availSeats');
                                  },
                                color: AppTheme.lightBlueAccent,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
