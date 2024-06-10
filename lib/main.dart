import 'package:base_project_flutter/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupPrefData();
  setupNetworkService();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => {runApp(const MyApp())},
  );
}

void setupNetworkService() {
  NetworkService().init();
}

setupPrefData() async {
  SharedPreferencesService instance = await SharedPreferencesService.getInstance();
  instance.username = "Amit";
  String username = instance.username;
}
