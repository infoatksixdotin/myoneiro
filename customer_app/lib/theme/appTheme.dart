import 'package:flutter/material.dart';

class AppTheme {
  static Color BlackColor = Color(0xFF000000);
  static Color lightBlueAccent = Color(0xFF00BFFF);
  static Color whiteColor = Color(0xFFFFFFFF);
  static Color PrimaryColor = Colors.lightBlueAccent; // title bar
  static Color AccentColor = Colors.lightBlueAccent; // button color
  static Color HintColor = Colors.lightBlueAccent;
  static Color DividerColor = Colors.lightBlueAccent;
  static Color ButtonColor = Colors.lightBlueAccent;
  static Color ScaffoldBackgroundColor = Colors.white;
  static Color CanvasColor = Colors.lightBlueAccent;
  static Color TextHeadlineColor = AppTheme.lightBlueAccent;
  static Color TextTitleColor = AppTheme.whiteColor;
  static Color TextBody1Color = AppTheme.whiteColor;
  static Color TextColor = AppTheme.whiteColor;
  static Color colorBrightness = AppTheme.lightBlueAccent;
  static Brightness BrightnessDark = Brightness.dark;
  static String FontFamily = 'Georgia';

  static ThemeData getThemeData() {
    return new ThemeData(
      primaryColor: PrimaryColor,
      accentColor: AccentColor,
      hintColor: HintColor,
      dividerColor: DividerColor,
      buttonColor: ButtonColor,
      scaffoldBackgroundColor: ScaffoldBackgroundColor,
      canvasColor: CanvasColor,
    );
  }

  static getThemeData2() {
    return new ThemeData(
      // Define the default brightness and colors.
      scaffoldBackgroundColor: ScaffoldBackgroundColor,
      brightness: BrightnessDark,
      primaryColor: PrimaryColor, // title bar
      accentColor: AccentColor,  // button color
      // Define the default font family.
      fontFamily: FontFamily,
      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: TextHeadlineColor),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic, color: TextTitleColor),
        body1: TextStyle(fontSize: 14.0, color: TextBody1Color),
      ),
    );
  }
}