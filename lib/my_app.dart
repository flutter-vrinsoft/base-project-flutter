import 'package:base_project_flutter/export.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ValueNotifier<ThemeMode> themeValueNotifier = ValueNotifier(ThemeMode.light);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await FkUserAgent.init();
      initPlatformState();
    });
    super.initState();
  }

  Future<void> initPlatformState() async {
    try {
      if (kDebugMode) print("FkUserAgent.properties:: ${jsonEncode(FkUserAgent.properties)}");
    } on PlatformException {
      if (kDebugMode) print("PlatformException");
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return AppThemes(
      themeNotifier: themeValueNotifier,
      child: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeValueNotifier,
        builder: (_, themeMode, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.light(), // Replace with your light theme
            darkTheme: ThemeData.dark(), // Replace with your dark theme
            themeMode: themeMode,
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
