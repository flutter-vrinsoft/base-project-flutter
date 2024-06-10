Sure, you can use the `flutter_launcher_icons` package to change the app name and app icon easily. Below is a detailed Markdown file on how to use this package.

# Changing App Name and Icon in Flutter

## Prerequisites
- Flutter installed on your machine.
- Basic understanding of Flutter project structure.

## Step 1: Add `flutter_launcher_icons` to Your Project

1. Open your `pubspec.yaml` file.
2. Add the `flutter_launcher_icons` package under `dev_dependencies`.
3. Configure the package with your app icon paths and desired app name.

Here’s an example configuration:

```yaml
name: your_app_name
description: A new Flutter project.

# Other dependencies...
dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_launcher_icons: ^0.10.0

flutter_icons:
  android: "ic_launcher"
  #  android: true
  ios: true
  image_path: "assets/icon/icon.png"
#  remove_alpha_ios: true
#  min_sdk_android: 21 # android min sdk min:16, default 21
#  android_settings:
#    adaptive_icon_background: "assets/icon/icon_background.png"
#    adaptive_icon_foreground: "assets/icon/icon_foreground.png"
```

## Step 2: Add Icon Images

1. Create an `assets/icon` directory in your project.
2. Place your app icon image (`icon.png`) in the `assets/icon` directory.
3. If using adaptive icons for Android, place `icon_background.png` and `icon_foreground.png` in the `assets/icon` directory.

## Step 3: Run the Package

Run the following command to generate the app icons for both Android and iOS:

```sh
flutter pub run flutter_launcher_icons:main
```

This command will generate the necessary icon files and update the platform-specific files accordingly.

## Step 4: Change the App Name

1. Open your `android/app/src/main/AndroidManifest.xml` file.
2. Update the `android:label` attribute in the `<application>` tag:

   ```xml
   <application
       android:name="io.flutter.app.FlutterApplication"
       android:label="NewAppName"
       android:icon="@mipmap/ic_launcher">
       <!-- Other configurations... -->    
   </application>
   ```

3. Open your `ios/Runner/Info.plist` file.
4. Update the `CFBundleName` key:

```plist
<key>CFBundleName</key>
<string>NewAppName</string>
```

## Full `pubspec.yaml` Example

Here’s a complete `pubspec.yaml` example with `flutter_launcher_icons`:

```yaml
name: your_app_name
description: A new Flutter project.

# Other dependencies...
dependencies:
  flutter:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_launcher_icons: ^0.10.0

flutter_icons:
  android: "ic_launcher"
#  android: true
  ios: true
  image_path: "assets/icon/icon.png"
#  remove_alpha_ios: true
#  min_sdk_android: 21 # android min sdk min:16, default 21
#  android_settings:
#    adaptive_icon_background: "assets/icon/icon_background.png"
#    adaptive_icon_foreground: "assets/icon/icon_foreground.png"
```

## Final Steps

1. Ensure your app icon images are correctly placed in the specified paths.
2. Run the `flutter_launcher_icons` command.
3. Verify the changes by running your Flutter app.

## Conclusion

Using `flutter_launcher_icons` simplifies the process of changing your app’s icon and name. This package handles both Android and iOS platforms, ensuring your app looks consistent across devices.