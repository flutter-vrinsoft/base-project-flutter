import 'package:base_project_flutter/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupPrefData();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => {runApp(const MyApp())},
  );
}

setupPrefData() async {
  SharedPreferencesService instance = await SharedPreferencesService.getInstance();
  instance.username = "Amit";
  var username = instance.username;
}
