import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemes {
  // light theme configurations
  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white70,
        bottomAppBarColor: Colors.amber,
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.green
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey[900],
          elevation: 10,
          selectedLabelStyle: TextStyle(
              color: Color(0xFFFF0000), fontFamily: 'Montserrat', fontSize: 14.0
          ),
          unselectedLabelStyle: TextStyle(
              color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0
          ),
          selectedItemColor: Color(0xFFFF0000),
          unselectedItemColor: Color(0xFFFF0000),
          showUnselectedLabels: true,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue,
          disabledColor: Colors.grey,
        ));

  }

  // dark theme configurations
  static ThemeData get darkTheme {
    return ThemeData(
        appBarTheme: AppBarTheme(
            color: Colors.yellow
        ),
      scaffoldBackgroundColor: Colors.white30,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.green,
          elevation: 10,
          selectedLabelStyle: TextStyle(
              color: Color(0xFFA67926), fontFamily: 'Montserrat', fontSize: 14.0
          ),
          unselectedLabelStyle: TextStyle(
              color: Colors.grey[600], fontFamily: 'Montserrat', fontSize: 12.0
          ),
          selectedItemColor: Color(0xFFA67926),
          unselectedItemColor: Colors.grey[600],
          showUnselectedLabels: true,
        ),
        brightness: Brightness.dark,
        primaryColor: Colors.amber,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.amber,
          disabledColor: Colors.grey,
        ));
  }
}

