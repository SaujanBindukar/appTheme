import 'package:flutter/material.dart';

class AppTheme {
  ///colors for light mode
  static final lightTheme = ThemeData(
    backgroundColor: const Color(0xFF023047),
    primaryColor: const Color(0xFFF86541),
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white),
    ),
  );

  /// colors for dark mode
  static final darkTheme = ThemeData(
    backgroundColor: const Color(0xFF57859D),
    primaryColor: const Color(0xFFFF6E48),
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white),
    ),
  );
}
