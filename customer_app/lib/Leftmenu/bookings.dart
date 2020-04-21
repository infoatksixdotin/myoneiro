import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/bookedscreen.dart';
import 'package:flutter_app1/screens/cancelledscreen.dart';
import 'package:flutter_app1/screens/completedscreen.dart';
import 'package:flutter_app1/theme/appTheme.dart';


class leftmenubookings extends StatefulWidget {
  @override
  _leftmenubookingsState createState() => _leftmenubookingsState();
}

class _leftmenubookingsState extends State<leftmenubookings> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
         title: new Text('Bookings'),
          backgroundColor: AppTheme.lightBlueAccent,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          bottom: TabBar(
            //unselectedLabelColor: Colors.black26,
            labelColor: Colors.white,
            tabs: [
              new Tab(text: "Booked"),
              new Tab(text: "Completed"),
              new Tab(text: "Cancelled"),
            ],
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,),
          bottomOpacity: 1,
        ),

        body: TabBarView(
        
          children: [
            bookedscreen(),
            completedscreen(),
            cancelledscreen(),
          ],
          
          controller: _tabController,
          ),
      ),
    );
  }
}