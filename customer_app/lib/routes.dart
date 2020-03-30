import 'package:flutter/widgets.dart';
import 'package:flutter_app1/Leftmenu/bookings.dart';
import 'package:flutter_app1/Leftmenu/logout.dart';
import 'package:flutter_app1/Leftmenu/wallet.dart';
import 'package:flutter_app1/TabBar/bottom_navigation_bar.dart';
import 'package:flutter_app1/TabBar/dashboard.dart';
import 'package:flutter_app1/Leftmenu/my_profile.dart';
import 'package:flutter_app1/screens/avail_aircrafts.dart';
import 'package:flutter_app1/screens/avail_seats.dart';
import 'package:flutter_app1/screens/calender.dart';
import 'package:flutter_app1/screens/login_user.dart';
import 'package:flutter_app1/screens/passenger_details.dart';
import 'package:flutter_app1/screens/payment_options.dart';
import 'package:flutter_app1/screens/register_user.dart';


final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/home': (BuildContext context) => LoginAuth(),
  '/register': (BuildContext context) => RegistrationScreen(),
  '/DashboardPage': (BuildContext context) => DashboardPage(),
  '/Myprofile': (BuildContext context) => Myprofile(),
  '/BottomNavBar': (BuildContext context) => BottomNavBar(),
  '/DateTimeField': (BuildContext context) => DateTimeField(),
  '/AvailAircrafts': (BuildContext context) => AvailAircrafts(),
  '/wallet': (BuildContext context) => wallet(),
  '/leftmenubookings': (BuildContext context) => leftmenubookings(),
  '/LogoutScreen': (BuildContext context) => LogoutScreen(),
  '/availSeats': (BuildContext context) => availSeats(),
  '/PaymentOptions': (BuildContext context) => PaymentOptions(),
  '/PassengerDetails': (BuildContext context) => PassengerDetails(),

  

};