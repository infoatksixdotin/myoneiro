import 'package:flutter/material.dart';
import 'package:flutter_app1/Leftmenu/drawer_menu.dart';
import 'package:flutter_app1/TabBar/Bookings.dart';
import 'package:flutter_app1/TabBar/Profile.dart';
import 'package:flutter_app1/TabBar/Support.dart';
import 'package:flutter_app1/TabBar/dashboard.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class BottomNavBar extends StatefulWidget {
  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerMenu.getMenu(context),
        body: TabBarView(
          children: <Widget>[DashboardPage(), Bookings(), Support(),Profile()],
          controller: controller,
        ),
        bottomNavigationBar: Material(
          color: AppTheme.lightBlueAccent,
          child: TabBar(
             isScrollable : false,
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.list),
                 text: 'Bookings',
              ),
              Tab(
                icon: Icon(Icons.headset_mic),
                 text: 'Help',
              ),
               Tab(
                icon: Icon(Icons.account_circle),
                 text: 'Account',
              ),
            ],
            controller: controller,
          ),
        ),
      ),
    );
  }
}