import 'package:flutter/material.dart';
import 'package:flutter_app1/model/leftmenudata.dart';
import 'package:flutter_app1/theme/appTheme.dart';

class DrawerMenu {
  static Drawer getMenu(BuildContext context) {
    String bookingsTitle = LeftMenuData.getMenuTitle_Bookings();
    String walletTitle = LeftMenuData.getMenuTitle_Wallet();
    String profileTitle = LeftMenuData.getMenuTitle_Profile();
    String logoutTitle = LeftMenuData.getMenuTitle_Logout();

    return Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                //child: Text('MyOneiro'),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo/images.jpg'),
                      fit: BoxFit.cover
                  ),
                  color: AppTheme.lightBlueAccent,
                ),
              ),
              SizedBox(height: 10,),
          ListTile(
            title: Text(bookingsTitle, style: TextStyle(color: AppTheme.lightBlueAccent,),),
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
            title: Text(walletTitle, style: TextStyle(color: AppTheme.lightBlueAccent,),),
            onTap: () {
              Navigator.pushNamed(context,'/wallet');

            },
            leading: Icon(
              Icons.account_balance_wallet,
              size: 25,
              color: AppTheme.lightBlueAccent,
            ),
          ),
          /* KU As of now not needed.
          ListTile(
            title: Text(profileTitle, style: TextStyle(color: AppTheme.lightBlueAccent,),),
            onTap: () {
              Navigator.pushNamed(context,'/Myprofile');
            },
            leading: Icon(
              Icons.person_pin,
              size: 25,
              color: AppTheme.lightBlueAccent,
            ),
          ),
          */
          ListTile(
            title: Text(logoutTitle, style: TextStyle(color: AppTheme.lightBlueAccent,),),
            onTap: () {
              //Navigator.pushNamed(context,'/LogoutScreen');

            },
            leading: Icon(
              Icons.call_missed_outgoing,
              size: 25,
              color: AppTheme.lightBlueAccent,
            ),
          ),
            ],
          ),
        );
  }
}
