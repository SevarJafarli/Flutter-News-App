import 'package:flutter/material.dart';

const double kDefaultPadding = 20.0;
const whiteColor = Colors.white;
const blackColor = Colors.black;
const blueColor = Colors.blue;

class Themes {
  static final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    // brightness: Brightness.dark,
    primaryColor: whiteColor,

    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: blackColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(
        color: blackColor,
      ),
    ),

    iconTheme: const IconThemeData(
      color: blackColor,
    ),
  );
  static final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,

    // brightness: Brightness.light,
    primaryColor: blackColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: blackColor,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: whiteColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      actionsIconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    iconTheme: const IconThemeData(
      color: whiteColor,
    ),
  );
}
