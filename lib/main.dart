import 'package:base_project_flutter/export.dart';


void main() async {
  //This will ensure flutter binding (useful for firebase, notification etc.)
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebaseServices();
  // await setupPrefData();
  initializeNetworkServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => {runApp(const MyApp())},
  );
}

setupPrefData() async {
  SharedPreferencesService instance = await SharedPreferencesService.getInstance();
  instance.username = "Amit";
  var username = instance.username;
}

Future<void> initializeFirebaseServices() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseNotificationService().setupInteractedMessage();
  // Register the background message handler
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
}

void initializeNetworkServices() {
  // NetworkService().init();
}
