import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:flutter_share_me/flutter_share_me.dart';

class TicketScreen extends StatefulWidget {
  @override
  _TicketScreenState createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: new AppBar(
        title: new Text(
          "Download Ticket", style: TextStyle(color: AppTheme.whiteColor,),),
        backgroundColor: AppTheme.lightBlueAccent,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Center(
        child: FlutterTicketWidget(
          width: 350.0,
          height: 500.0,
          color: Colors.white,
          isCornerRounded: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 25.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: Colors.lightBlueAccent),
                      ),
                      child: Center(
                        child: Text('Agni Aero', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text('7:00AM', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.flight_takeoff,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text('7:30AM', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text('My Oneiro Passenger Ticket', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: <Widget>[
                      ticketDetailsWidget(
                          'Passengers', 'Vaishnavi', 'Date', '02-05-2020',),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 40.0),
                        child: ticketDetailsWidget(
                            'Aircraft', 'Micro Light Aircraft (M1)', 'Gate', '02'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 40.0),
                        child: ticketDetailsWidget(
                            'Age', '22', 'Seat', '2B'),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
                  child: Container(
                    width: 250.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/aircrafts/mehta.jpg'), fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, right: 75.0),
                    child: ListTile(
                      onTap: (){
                        FlutterShareMe().shareToWhatsApp(
                          // base64Image: base64Image,
                            msg: 'My Oneiro Ticket Details: To be added'
                        );
                      },
                      leading: Icon(Icons.share, color: Colors.black,),
                      title: Text('WhatsApp', style: TextStyle(color: Color(0xFF006400))),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(firstTitle, style: TextStyle(color: Colors.grey,),),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(firstDesc, style: TextStyle(color: Colors.black,),),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(secondTitle, style: TextStyle(color: Colors.grey,),),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(secondDesc, style: TextStyle(color: Colors.black,),),
              ),
            ],
          ),
        )
      ],
    );
  }
}