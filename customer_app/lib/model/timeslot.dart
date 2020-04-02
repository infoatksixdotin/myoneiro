import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/passenger_details.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class Time {
  const Time({this.hour, this.booked});
  final String hour;
  final bool booked;
}
const List<Time> time = const <Time>[
  const Time(hour: '6:00AM',booked:true),
  const Time(hour: '6:15AM',booked:true),
  const Time(hour: '6:30AM',booked:true),
  const Time(hour: '6:45AM',booked:false),
  const Time(hour: '7:00AM',booked:true),
  const Time(hour: '7:15AM',booked:false),
  const Time(hour: '7:30AM',booked:false),
  const Time(hour: '7:45AM',booked:true),
  const Time(hour: '8:00AM',booked:true),
  const Time(hour: '8:15AM',booked:false),
  const Time(hour: '8:30AM',booked:false),
  const Time(hour: '8:45AM',booked:true),
  const Time(hour: '9:00AM',booked:true),
  const Time(hour: '9:15AM',booked:true),
  const Time(hour: '9:30AM',booked:true),
  const Time(hour: '9:45AM',booked:false),
  const Time(hour: '9:00AM',booked:true),
  
];

class TimeCard extends StatelessWidget {
  const TimeCard({Key key, this.time}) : super(key: key);
  final Time time;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Card(
            //color: Colors.re,
            color: !time.booked ? Colors.greenAccent : AppTheme.lightBlueAccent,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                     Text(time.hour, style: TextStyle(color: AppTheme.BlackColor)),
                     Text(time.booked ? "Booked" : "", style: TextStyle(color: AppTheme.BlackColor)),
                ]
            ),
            )
        ));
  }
}

Widget TimeBox(int index, BuildContext context, Size _deviceSize,
    List<Time> time) {
  if (index > time.length - 1) {
    return GestureDetector(
      onTap: () {
      },
    );
  }
  return new GestureDetector(
   onTap: () {
        if (!time[index].booked) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PassengerDetails(),
              settings: RouteSettings(
                arguments: time[index],
              ),
            ),
          );
        }
    },
      child: Container(
          margin: EdgeInsets.all(28.0),
          width: _deviceSize.width * 0.4,
          //color: Colors.redAccent,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: !time[index].booked ? Colors.greenAccent : AppTheme.lightBlueAccent,
          ),
          child: Stack(children: [
            Container(
                alignment: Alignment.bottomRight,
                child: TimeCard(time: time[index]),
            ),
          ]
          )
      )
  );
}