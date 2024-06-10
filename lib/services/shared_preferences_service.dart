///[Read Full Blog Here](https://isaacadariku.medium.com/storing-and-retrieving-data-in-flutter-with-shared-preferences-in-a-maintainable-way-cf75eed6dbe2)
library;
// We will use the singleton pattern to create a single instance of the SharedPreferencesService class.
// This will ensure that we only have one instance of the class and that we can access it from anywhere
// in the application. To do this, we will use a private constructor and a static getInstance() method
// to retrieve the single instance of the class.

import 'package:base_project_flutter/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

// These constants will be prefixed with _k to indicate that they are private constants outside of the SharedPreferencesService class.
// Global private constants
const String _kUsernameKey = 'username';
const String _kAuthToken = 'authToken';
const String _kFcmToken = 'fcmToken';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _prefs;

  SharedPreferencesService._();

  // Using a singleton pattern
  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();
    _prefs = await SharedPreferences.getInstance();
    return _instance!;
  }

  //[Add all preferences]
  // Persist and retrieve username
  String get username => _getData(_kUsernameKey) ?? '';
  set username(String value) => _saveData(_kUsernameKey, value);
  String get authToken => _getData(_kAuthToken) ?? '';
  set authToken(String value) => _saveData(_kAuthToken, value);
  String get fcmToken => _getData(_kFcmToken) ?? '';
  set fcmToken(String value) => _saveData(_kFcmToken, value);

  // Private generic method for retrieving data from shared preferences
  dynamic _getData(String key) {
    // Retrieve data from shared preferences
    var value = _prefs.get(key);

    // Easily log the data that we retrieve from shared preferences
    debugPrint('Retrieved $key: $value');

    // Return the data that we retrieve from shared preferences
    return value;
  }

  // Private method for saving data to shared preferences
  void _saveData(String key, dynamic value) {
    // Easily log the data that we save to shared preferences
    debugPrint('Saving $key: $value');

    // Save data to shared preferences
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
