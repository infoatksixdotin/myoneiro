import 'package:flutter/material.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
        return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              /*
              DrawerHeader(
                //child: Text('Farmer Application'),
                decoration: BoxDecoration(
                  color: AppTheme.lightBlueAccent,
                ),
              ),
              */
              SizedBox(height: 50,), 
              ListTile(
                title: Text('My Bookings', style: TextStyle(color: AppTheme.lightBlueAccent,),),
                onTap: () {
                  Navigator.pushNamed(context,'/leftmenubookings');

                },
                leading: Icon(
                  Icons.list,
                  size: 25,
                  color: AppTheme.lightBlueAccent,
                ),
              ),
              ListTile(
                title: Text('My Wallet', style: TextStyle(color: AppTheme.lightBlueAccent,),),
                onTap: () {
                  Navigator.pushNamed(context,'/wallet');

                },
                leading: Icon(
                  Icons.account_balance_wallet,
                  size: 25,
                  color: AppTheme.lightBlueAccent,
                ),
              ),
              ListTile(
                title: Text('My profile', style: TextStyle(color: AppTheme.lightBlueAccent,),),
                onTap: () {
                  Navigator.pushNamed(context,'/Myprofile');
                },
                leading: Icon(
                  Icons.person_pin,
                  size: 25,
                  color: AppTheme.lightBlueAccent,
                ),
              ),
              ListTile(
                title: Text('Logout', style: TextStyle(color: AppTheme.lightBlueAccent,),),
                onTap: () {
                  //Navigator.pushNamed(context,'/LogoutScreen');
  
                },
                leading: Icon(
                  Icons.call_missed_outgoing,
                  size: 25,
                  color: AppTheme.lightBlueAccent,
                ),
              ),
			  // This is added for debug purpose
              ListTile(
              title: Text("Debug - FireBase", style: TextStyle(color:AppTheme.lightBlueAccent)),
              leading: Icon(Icons.contacts, color: AppTheme.lightBlueAccent),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                Navigator.pushNamed(context,'/FirebaseApiConsolePage');
              },
            ),
            ],
          ),
        );
  }
}
 