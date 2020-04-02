import 'package:shared_preferences/shared_preferences.dart';
class LocalStorage {
  static Future<String> getValue(String name) async { 
  String value ="";
  try {
    final prefs = await SharedPreferences.getInstance();
    value = prefs.getString(name) ?? "";
  }
  catch(e) {
    print(e);
  }
  return value;
  }

  static Future<bool> setValue(String name, String value) async { 
  bool rt = false;
  try {
    final prefs = await SharedPreferences.getInstance();
    rt = await prefs.setString(name, value);
  }
  catch(e) {
    print(e);
  }
  return rt;
  }
 }
/*

  // obtain shared preferences
final prefs = await SharedPreferences.getInstance();

// set value
prefs.setInt('counter', counter);


final prefs = await SharedPreferences.getInstance();

// Try reading data from the counter key. If it doesn't exist, return 0.
final counter = prefs.getInt('counter') ?? 0;

final prefs = await SharedPreferences.getInstance();

prefs.remove('counter');
*/