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

class availSeats extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _availSeats();
  }
}
class _availSeats extends State<availSeats> {
  bool _isTimeLoading =  true;
  Size _deviceSize;
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
    _isTimeLoading = false;

    return Scaffold(
      backgroundColor: AppTheme.lightBlueAccent,
      appBar: new AppBar(
        title: new Text(
          "Select Aircraft Slot...", style: TextStyle(color: AppTheme.whiteColor,),),
        backgroundColor: AppTheme.lightBlueAccent,
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: CustomScrollView(slivers: [
            Container(
              child: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                   children: <Widget>[
                     Card(
                       semanticContainer: true,
                       clipBehavior: Clip.antiAliasWithSaveLayer,
                       elevation: 0,margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: ListTile(
                          leading: CircleAvatar(radius: 55.0,
                            backgroundImage: AssetImage('assets/aircrafts/mehta.jpg'),), // no matter how big it is, it won't overflow
                          title: new Text('      10-April-2020',
                              style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold, fontSize: 17)),
                          subtitle: new Text("     Bangalore-Jakkur",
                              style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold, fontSize: 17)),
                        ),
                      ),
                     ),
                     Align(alignment: Alignment.topLeft,child: Text('       Micro Light Aircraft (M1)',
                         style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.bold, fontSize: 20)))
                 ]
               ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                    color: Colors.grey.withOpacity(0.1))
              ]),
            ),
            _isTimeLoading
                ? SliverList(
                delegate: SliverChildListDelegate([
                  Container(
                    height: _deviceSize.height * 0.5,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      backgroundColor: AppTheme.lightBlueAccent,
                    ),
                  )
                ]))
                : time.length > 0
                ? SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return TimeBox(
                        index, context, _deviceSize, time);
                  }, childCount: time.length + 1),
            )
        : SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  width: _deviceSize.width,
                  color: Colors.white,
                  child: Center(
                    child: Text('No items present'),
                  ),
                ),
              ]),
            ),
          ]),
        ),
      ),
    );

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
            margin: EdgeInsets.all(20.0),
            width: _deviceSize.width * 0.4,
            //color: Colors.redAccent,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: !time[index].booked ? Colors.greenAccent : AppTheme.lightBlueAccent,
            ),
            child: Stack(children: [
              Container(
                alignment: Alignment.bottomRight,
                child: TimeCard(time: time[index]),
              ),
//               InkWell(
//                onTap: () {
//                if (!time[index].booked) {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => PassengerDetails(),
//                      settings: RouteSettings(
//                        arguments: time[index],
//                      ),
//                    ),
//                  );
//                }
//                },
//                child: Icon(Icons.done, color: Colors.white),
//              ),
            ]
            )
        )
    );
  }

}