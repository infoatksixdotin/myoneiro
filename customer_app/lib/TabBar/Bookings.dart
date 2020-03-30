import 'package:flutter/material.dart';
import 'package:flutter_app1/Leftmenu/drawer_menu.dart';
import 'package:flutter_app1/screens/bookedscreen.dart';
import 'package:flutter_app1/screens/cancelledscreen.dart';
import 'package:flutter_app1/screens/completedscreen.dart';
import 'package:flutter_app1/theme/appTheme.dart';


class Bookings extends StatefulWidget {
  @override
  _BookingsState createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      drawer:DrawerMenu.getMenu(context),
      body: TabBarView(
      
        children: [
          bookedscreen(),
          cancelledscreen(),
          completedscreen(),
        ],
        
        controller: _tabController,
        ),
    );
  }
}