# Shared Preferences in Flutter

In this guide, we will demonstrate how to store and retrieve data in Flutter using shared preferences in a maintainable way. Shared preferences allow you to save and retrieve simple data persistently, using a key-value pair system. This can be very useful for saving user settings, login states, or any other small pieces of information that need to persist across app launches.

## Steps to Implement Shared Preferences

### 1. Add Dependencies

First, add the necessary dependencies to your `pubspec.yaml` file. Include `shared_preferences` for shared preferences and `flutter_lints` for linting.

```yaml
dependencies:
  shared_preferences: ^2.2.3
```

### 2. Initialize Shared Preferences

In your `main.dart` file, initialize shared preferences before running the app. Ensure that Flutter bindings are initialized and set the preferred device orientation.

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupPrefData();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(const MyApp()),
  );
}

Future<void> setupPrefData() async {
  SharedPreferencesService instance = await SharedPreferencesService.getInstance();
  instance.username = "Amit";
  var username = instance.username;
}
```

### 3. Create a Singleton Service Class

Create a singleton service class for shared preferences to ensure a single instance is used throughout the app. This class will handle saving and retrieving data.

```dart
library shared_preferences_service;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kUsernameKey = 'username';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _prefs;

  SharedPreferencesService._();

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();
    _prefs = await SharedPreferences.getInstance();
    return _instance!;
  }

  // Persist and retrieve username
  String get username => _getData(_kUsernameKey) ?? '';
  set username(String value) => _saveData(_kUsernameKey, value);

  // Private generic method for retrieving data from shared preferences
  dynamic _getData(String key) {
    var value = _prefs.get(key);
    debugPrint('Retrieved $key: $value');
    return value;
  }

  // Private method for saving data to shared preferences
  void _saveData(String key, dynamic value) {
    debugPrint('Saving $key: $value');
    if (value is String) {
      _prefs.setString(key, value);
    } else if (value is int) {
      _prefs.setInt(key, value);
    } else if (value is double) {
      _prefs.setDouble(key, value);
    } else if (value is bool) {
      _prefs.setBool(key, value);
    } else if (value is List<String>) {
      _prefs.setStringList(key, value);
    }
  }
}
```

### 4. Usage Example

Here's an example of how you can use the `SharedPreferencesService` to save and retrieve data:

```dart
import 'package:flutter/material.dart';
import 'shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesService prefs = await SharedPreferencesService.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferencesService prefs;

  const MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(prefs: prefs),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final SharedPreferencesService prefs;

  const HomeScreen({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Username: ${prefs.username}'),
            ElevatedButton(
              onPressed: () {
                prefs.username = 'NewUser';
              },
              child: Text('Change Username'),
            ),
          ],
        ),
      ),
    );
  }
}
```

### Additional Tips

- **Data Types Supported**: Shared preferences support basic data types such as `String`, `int`, `double`, `bool`, and `List<String>`.
- **Security**: For sensitive data, consider using secure storage solutions.
- **Performance**: Shared preferences are not suitable for storing large amounts of data due to performance implications.

### Conclusion

Using shared preferences in Flutter is a simple yet powerful way to persist small amounts of data. By encapsulating shared preferences logic in a service class and using a singleton pattern, you can keep your code clean and maintainable. Happy coding!

For more information, refer to the [Flutter documentation](https://flutter.dev/docs/cookbook/persistence/key-value) and [Shared Preferences documentation](https://pub.dev/packages/shared_preferences).