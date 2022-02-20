import 'package:flutter/material.dart';

class AppThemeData {
  final BorderRadius borderRadius = BorderRadius.circular(8);

  final Color colorYellow = Color(0xffffff00);
  final Color colorPrimary = Color(0xffabcdef);

  ThemeData get materialTheme {
    return ThemeData(
        primaryColor: colorPrimary,
        primaryColorLight: colorPrimary,
        primaryColorDark: colorPrimary,
        primarySwatch: Colors.grey,
        primaryTextTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.grey
            )
        )
    );
  }
}