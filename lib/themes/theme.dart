import 'package:flutter/material.dart';

final MaterialColor skyBlueSwatch = MaterialColor(0xFF87CEEB, {
  50: Color(0xFFE3F7FD),
  100: Color(0xFFB9EBFB),
  200: Color(0xFF8DDDF8),
  300: Color(0xFF61CFF4),
  400: Color(0xFF3BC4F2),
  500: Color(0xFF17B9F0),
  600: Color(0xFF14A7DA),
  700: Color(0xFF1295C4),
  800: Color(0xFF1083AE),
  900: Color(0xFF0C6390),
});

final ThemeData jobDoorwayTheme = ThemeData(
  primarySwatch: skyBlueSwatch,
  scaffoldBackgroundColor: Colors.white,
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    labelStyle: TextStyle(color: Colors.black87),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: skyBlueSwatch),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: skyBlueSwatch),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: skyBlueSwatch, width: 2),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: skyBlueSwatch,
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 16),
      padding: EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
