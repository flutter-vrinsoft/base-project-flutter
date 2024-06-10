import 'package:base_project_flutter/export.dart';

class ThemeChangeButton extends StatelessWidget {
  const ThemeChangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = AppThemes.of(context)!.themeNotifier;

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, themeMode, __) {
        return ListTile(
          title: Text('$themeMode'),
          trailing: Switch(
            value: themeNotifier.value == ThemeMode.dark,
            onChanged: (bool value) {
              themeNotifier.value = themeNotifier.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
            },
          ),
        );
      },
    );
  }
}
