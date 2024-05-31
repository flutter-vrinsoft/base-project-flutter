# Flutter Theme Guide: Dark and Light Modes

This guide covers how to define dark and light themes in Flutter, including text themes with their default values and other theming options like text fields, background colors, and input decorations.

## 1. Define Dark and Light Themes

First, let's define the basic structure for dark and light themes in Flutter.

```dart
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system, // Change to ThemeMode.light or ThemeMode.dark to test
      home: MyHomePage(),
    );
  }
}

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  accentColor: Colors.orange,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  textTheme: lightTextTheme,
  inputDecorationTheme: lightInputDecorationTheme,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blue,
  accentColor: Colors.orange,
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  textTheme: darkTextTheme,
  inputDecorationTheme: darkInputDecorationTheme,
);
```

## 2. Define Text Themes

Here are the text themes for both light and dark modes with their default values:

```dart
final TextTheme lightTextTheme = TextTheme(
  headline1: TextStyle(fontSize: 96.0, fontWeight: FontWeight.bold, color: Colors.black),
  headline2: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.black),
  headline3: TextStyle(fontSize: 48.0, fontWeight: FontWeight.normal, color: Colors.black),
  headline4: TextStyle(fontSize: 34.0, fontWeight: FontWeight.normal, color: Colors.black),
  headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal, color: Colors.black),
  headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
  subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.black),
  subtitle2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
  bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.black),
  bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.black),
  caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.black),
  button: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
  overline: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, color: Colors.black),
);

final TextTheme darkTextTheme = TextTheme(
  headline1: TextStyle(fontSize: 96.0, fontWeight: FontWeight.bold, color: Colors.white),
  headline2: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.white),
  headline3: TextStyle(fontSize: 48.0, fontWeight: FontWeight.normal, color: Colors.white),
  headline4: TextStyle(fontSize: 34.0, fontWeight: FontWeight.normal, color: Colors.white),
  headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal, color: Colors.white),
  headline6: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
  subtitle1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.white),
  subtitle2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
  bodyText1: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.white),
  bodyText2: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: Colors.white),
  caption: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: Colors.white),
  button: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
  overline: TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, color: Colors.white),
);
```

## 3. Define Input Decoration Themes

Input decorations for text fields in both light and dark modes:

```dart
final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.grey[200],
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.blue),
  ),
);

final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.grey[700],
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide.none,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: Colors.blue),
  ),
);
```

## 4. Additional Theme Customizations

You can customize other aspects of the theme as needed. Here are some examples:

### App Bar Theme

```dart
final AppBarTheme lightAppBarTheme = AppBarTheme(
  color: Colors.white,
  iconTheme: IconThemeData(color: Colors.black),
  textTheme: TextTheme(
    headline6: TextStyle(color: Colors.black, fontSize: 20.0),
  ),
);

final AppBarTheme darkAppBarTheme = AppBarTheme(
  color: Colors.black,
  iconTheme: IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    headline6: TextStyle(color: Colors.white, fontSize: 20.0),
  ),
);
```

### Button Theme

```dart
final ButtonThemeData lightButtonTheme = ButtonThemeData(
  buttonColor: Colors.blue,
  textTheme: ButtonTextTheme.primary,
);

final ButtonThemeData darkButtonTheme = ButtonThemeData(
  buttonColor: Colors.blue,
  textTheme: ButtonTextTheme.primary,
);
```

### Floating Action Button Theme

```dart
final FloatingActionButtonThemeData lightFabTheme = FloatingActionButtonThemeData(
  backgroundColor: Colors.blue,
);

final FloatingActionButtonThemeData darkFabTheme = FloatingActionButtonThemeData(
  backgroundColor: Colors.blue,
);
```

## 5. Apply Themes

Finally, apply the themes in your `MaterialApp`:

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme.copyWith(
        appBarTheme: lightAppBarTheme,
        buttonTheme: lightButtonTheme,
        floatingActionButtonTheme: lightFabTheme,
      ),
      darkTheme: darkTheme.copyWith(
        appBarTheme: darkAppBarTheme,
        buttonTheme: darkButtonTheme,
        floatingActionButtonTheme: darkFabTheme,
      ),
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Theme Guide'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello, World!'),
            TextField(
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Submit'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
```

By following these steps, you can create a consistent and customizable theme for both dark and light modes in your Flutter application. Adjust the values as needed to fit your design requirements.