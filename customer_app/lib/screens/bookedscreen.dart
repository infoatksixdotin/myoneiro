import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_app1/theme/appTheme.dart';

class bookedscreen extends StatefulWidget {
  @override
  _bookedscreenState createState() => _bookedscreenState();
}

class _bookedscreenState extends State<bookedscreen> {
  Size deviceSize;
  
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed ( context, '/TicketScreen' );
                              },
                              child: new ListTile(
                                leading: Column(
                                  children: <Widget>[
                                 Expanded(
                                   child: GestureDetector(
                                     onTap: () {
                                       Navigator.pushNamed ( context, '/aircraft_detail' );
                                     },
                                     child: CircleAvatar(
                                       radius: 30.0,
                                       backgroundImage: AssetImage(mydata[index]['imageurl']),),
                                   ),
                                 ),
//                                    Text( mydata[index]['group'],
//                                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                ]
                                ),
                                // no matter how big it is, it won't overflow
                                title: Row(
                                    children: <Widget>[
                                    Text( mydata[index]['title'],
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                      SizedBox(width: 3,),
                                      Text( 'Rs:'+ mydata[index]['price'],
                                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                                    ],
                                ),
                                subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text( 'Friday, 18-Apr-2020', style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold)),
                                          SizedBox(width: 6,),
                                          Text( 'Slot: 7:30AM', style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold)),
                                        ],
                                      )
                                    ]
                                ),
                              ),
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.end,
                              children: <Widget>[
//                                FlatButton(
//                                 child: new Text('Ticket Number',
//                                     style: TextStyle(color: Colors.lightBlueAccent)),
//                                 onPressed: () {
//                                   //Navigator.pushNamed(context,'/');
//                                 },
//                                  ),
                                RaisedButton(
                                  shape: RoundedRectangleBorder (
                                    borderRadius: BorderRadius.circular (
                                        50.0 ),
                                  ),
                                  child: new Text('Reschedule',
                                      style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    //Navigator.pushNamed(context,'/');
                                  },
                                  color: Colors.lightBlueAccent,
                                ),
                                RaisedButton (
                                  shape: RoundedRectangleBorder (
                                    borderRadius: BorderRadius.circular (
                                        50.0 ),
                                  ),
                                  child: Text ( 'Cancel',
                                      style: TextStyle (
                                          color: Colors.white ) ),
                                  onPressed: () {
                                      return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Theme(
                                              data: Theme.of(context).copyWith(dialogBackgroundColor: AppTheme.whiteColor),
                                              child: AlertDialog(
                                                shape: RoundedRectangleBorder(borderRadius:
                                                BorderRadius.all(Radius.circular(15),),),
                                                title: new Text('Cancel Booking?',textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
                                                //content: new Text('',textAlign: TextAlign.center, style: TextStyle(color: Colors.black)),
                                                actions: <Widget>[
                                                  ButtonBar (
                                                    alignment: MainAxisAlignment.start,
                                                    buttonHeight: 2, buttonMinWidth: 35,
                                                    buttonPadding: EdgeInsets.all(18),
                                                    children: <Widget>[
                                                      RaisedButton (
                                                        child: new Text('No',
                                                            style: TextStyle (
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.bold ) ),
                                                        onPressed: () {
                                                          Navigator.of(context).pop();
                                                        },
                                                        color: Colors.lightBlueAccent,
                                                      ),
                                                      RaisedButton (
                                                        child: Text ( 'Yes',
                                                            style: TextStyle (
                                                                color: Colors.white ) ),
                                                        onPressed: () {
                                                          //Navigator.pushNamed ( context, '/availSeats' );
                                                        },
                                                        color: Colors.redAccent,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ));
                                        },
                                      );
                                  },
                                  color: Colors.redAccent,
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
      ),
    );
  }
}
