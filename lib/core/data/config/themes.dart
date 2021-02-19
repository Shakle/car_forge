import 'package:flutter/material.dart';

/// List of available [ThemeData], [Color], etc ui design
class Themes {

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurpleAccent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: _lightElevatedButtonStyle(),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _lightOutlinedButtonStyle(),
    ),
  );

  static ButtonStyle _lightElevatedButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
      backgroundColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(Colors.deepPurpleAccent.withOpacity(0.1)),
      elevation: MaterialStateProperty.all(7),
      foregroundColor: MaterialStateProperty.all(Colors.black),
      // textStyle: MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  static ButtonStyle _lightOutlinedButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          )),
      // backgroundColor: MaterialStateProperty.all(Colors.white),
      overlayColor: MaterialStateProperty.all(Colors.deepPurpleAccent.withOpacity(0.1)),
      foregroundColor: MaterialStateProperty.all(Colors.black),
      side: MaterialStateProperty.all(BorderSide(
        color: Colors.red,
      )),
      // textStyle: MaterialStateProperty.all(TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  static final Color warmWhite = Color(0xfffffff4);
}