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

// SingleTickerProviderStateMixin is used for animation
class BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();
    // Initialize the Tab Controller
    controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the TabBar view as the body of the Scaffold
      drawer: DrawerMenu.getMenu(context),
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[DashboardPage(), Bookings(), Support(),Profile()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: Material(
        
        // set the color of the bottom navigation bar
        color: AppTheme.lightBlueAccent,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
           isScrollable : false,
          tabs: <Tab>[
            Tab(
              // set icon to the tab
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
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}