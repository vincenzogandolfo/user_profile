import 'package:flutter/material.dart';

class MyThemes {
  static const primary = Colors.blue;
  static final primaryColor = Colors.blue.shade300;

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    colorScheme: const ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
  );
}
