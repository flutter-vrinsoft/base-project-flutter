import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
    scaffoldBackgroundColor: _lightColorScheme.background,
    textTheme: _lightTextTheme,
    inputDecorationTheme: _lightInputDecorationTheme,
    appBarTheme: _lightAppBarTheme,
    buttonTheme: _lightButtonTheme,
    floatingActionButtonTheme: _lightFabTheme,

  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    scaffoldBackgroundColor: _darkColorScheme.background,
    textTheme: _darkTextTheme,
    inputDecorationTheme: _darkInputDecorationTheme,
    appBarTheme: _darkAppBarTheme,
    buttonTheme: _darkButtonTheme,
    floatingActionButtonTheme: _darkFabTheme,
  );

  // Private color schemes
  static const ColorScheme _lightColorScheme = ColorScheme(
    primary: Colors.blue,
    primaryContainer: Colors.blueAccent,
    secondary: Colors.orange,
    secondaryContainer: Colors.orangeAccent,
    surface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    primary: Colors.blue,
    primaryContainer: Colors.blueAccent,
    secondary: Colors.orange,
    secondaryContainer: Colors.orangeAccent,
    surface: Colors.black,
    background: Colors.black,
    error: Colors.red,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onSurface: Colors.white,
    onBackground: Colors.white,
    onError: Colors.black,
    brightness: Brightness.dark,
  );

  // Private text themes
  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 96.0, fontWeight: FontWeight.bold, color: Colors.red),
    displayMedium: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.black),
    displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.normal, color: Colors.black),
    headlineMedium: TextStyle(fontSize: 34.0, fontWeight: FontWeight.normal, color: Colors.black),
    headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal, color: Colors.black),
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
    titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.black),
    titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
    bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
    labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
    labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, color: Colors.black),
  );

  static const TextTheme _darkTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 96.0, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.white),
    displaySmall: TextStyle(fontSize: 48.0, fontWeight: FontWeight.normal, color: Colors.white),
    headlineMedium: TextStyle(fontSize: 34.0, fontWeight: FontWeight.normal, color: Colors.white),
    headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal, color: Colors.white),
    titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
    titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.white),
    titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
    bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
    labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
    labelSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, color: Colors.white),
  );

  // Private input decoration themes
  static final InputDecorationTheme _lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[200],
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Colors.blue),
    ),
  );

  static final InputDecorationTheme _darkInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey[700],
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide.none,
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide: BorderSide(color: Colors.blue),
    ),
  );

  // Private app bar themes
  static const AppBarTheme _lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20.0),
  );

  static const AppBarTheme _darkAppBarTheme = AppBarTheme(
    backgroundColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
  );

  // Private button themes
  static const ButtonThemeData _lightButtonTheme = ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  );

  static const ButtonThemeData _darkButtonTheme = ButtonThemeData(
    buttonColor: Colors.blue,
    textTheme: ButtonTextTheme.primary,
  );

  // Private floating action button themes
  static const FloatingActionButtonThemeData _lightFabTheme = FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
  );

  static const FloatingActionButtonThemeData _darkFabTheme = FloatingActionButtonThemeData(
    backgroundColor: Colors.blue,
  );
}
