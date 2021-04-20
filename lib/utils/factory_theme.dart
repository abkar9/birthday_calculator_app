import 'package:flutter/material.dart';

class FactoryTheme {
  static ThemeData lightTheme() {
    return ThemeData(primarySwatch: Colors.blueGrey
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.grey,
        primaryColor: Colors.grey);
  }
}
