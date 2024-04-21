import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData( 
    primaryColor: Colors.deepPurpleAccent, 
    colorScheme: ColorScheme.light( 
      primary: Colors.deepPurpleAccent, 
      secondary: Colors.amber, 
      ), 
  );

  static ThemeData dark = ThemeData(
    primaryColor: Colors.deepPurpleAccent, 
    colorScheme: ColorScheme.dark( 
      primary: Colors.cyan, 
      secondary: Colors.amber,
    ),
  );

}