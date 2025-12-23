import 'package:flutter/material.dart';
abstract class AppTheme {
  static ThemeData light = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(centerTitle: true),
  );
}
