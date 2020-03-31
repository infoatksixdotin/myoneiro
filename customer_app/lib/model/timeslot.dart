import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/passenger_details.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class Time {
  const Time({this.hour});
  final String hour;
}
const List<Time> time = const <Time>[
  const Time(hour: '6:00AM'),
  const Time(hour: '6:15AM'),
  const Time(hour: '6:30AM'),
  const Time(hour: '6:45AM'),
  const Time(hour: '7:00AM'),
  const Time(hour: '7:15AM'),
  const Time(hour: '7:30AM'),
  const Time(hour: '7:45AM'),
  const Time(hour: '8:00AM'),
];

class TimeCard extends StatelessWidget {
  const TimeCard({Key key, this.time}) : super(key: key);
  final Time time;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Card(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//                  new IconButton(
//                    icon: new Icon(Icons.done),
//                    highlightColor: Colors.lightBlueAccent,
//                  ),
                     Text(time.hour, style: TextStyle(color: AppTheme.BlackColor,fontWeight: FontWeight.bold)),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PassengerDetails(),
            settings: RouteSettings(
              arguments: time[index],
            ),
          ),
        );
    },
      child: Container(
          margin: EdgeInsets.all(28.0),
          width: _deviceSize.width * 0.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppTheme.lightBlueAccent
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