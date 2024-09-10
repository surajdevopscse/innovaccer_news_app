import 'package:flutter/material.dart';

abstract class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
            color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(color: Colors.black54, fontSize: 16),
      ),
      iconTheme: const IconThemeData(
        color: Colors.blue,
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blueGrey,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blueGrey[900],
        elevation: 0,
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        color: Colors.grey[800],
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
            color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
        headlineSmall: TextStyle(color: Colors.white70, fontSize: 16),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    );
  }
}
