import 'package:flutter/material.dart';
import 'package:flutter_app1/model/timeslot.dart';
import 'package:flutter_app1/theme/appTheme.dart';

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
            SliverToBoxAdapter(
              child: new CircleAvatar(
                  radius: 75,
                  child: ClipOval(
                      child: Image.asset(
                        'assets/aircrafts/mehta.jpg',
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
}