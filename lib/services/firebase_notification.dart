import 'package:base_project_flutter/export.dart';

// This method is called whenever a background message is received.
@pragma('vm:entry-point')
Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('Handling a background message: ${message.messageId}');
}

class FirebaseNotificationService {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Initializes the Firebase Messaging and notification settings
  Future<void> setupInteractedMessage() async {
    await _getToken();
    await _enableIOSNotifications();
    await _registerNotificationListeners();
  }

  /// Registers notification listeners for foreground and background messages
  Future<void> _registerNotificationListeners() async {
    final AndroidNotificationChannel channel = _androidNotificationChannel();
    final InitializationSettings initializationSettings = _initializationSettings();

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse: _onDidReceiveNotificationResponseBackGround,
    );

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        color: Colors.white,
        icon: '@drawable/launcher_icon',
      ),
      iOS: const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _handleMessage(message, platformChannelSpecifics);
    });
  }

  /// Handles the display of a notification when a message is received in the foreground
  void _handleMessage(RemoteMessage message, NotificationDetails platformChannelSpecifics) {
    debugPrint('MESSAGE ON FOREGROUND ############ DATA: ${message.notification!}');

    if (message.notification != null) {
      debugPrint('Message also contained a notification: ${message.notification!.title}');
    }

    _flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: message.data['payload'],
    );
  }

  /// Handles the response when a notification is interacted with
  void _onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    // Handle notification response here
  }

  /// Handles the response when a background notification is interacted with
  static void _onDidReceiveNotificationResponseBackGround(NotificationResponse notificationResponse) async {
    // Handle background notification response here
  }

  /// Enables iOS notifications with user permissions
  Future<void> _enableIOSNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    final NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    _logPermissionStatus(settings.authorizationStatus);
  }

  /// Logs the status of the notification permissions
  void _logPermissionStatus(AuthorizationStatus status) {
    switch (status) {
      case AuthorizationStatus.authorized:
        debugPrint('USER GRANTED PERMISSION');
        break;
      case AuthorizationStatus.provisional:
        debugPrint('USER GRANTED PROVISIONAL PERMISSION');
        break;
      default:
        debugPrint('USER DECLINED OR HAS NOT ACCEPTED PERMISSION');
        break;
    }
  }

  /// Defines the Android notification channel
  AndroidNotificationChannel _androidNotificationChannel() => const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        description: 'This channel is used for important notifications.',
        importance: Importance.max,
      );

  /// Initializes the settings for Android and iOS notifications
  InitializationSettings _initializationSettings() {
    const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@drawable/launcher_icon');
    final DarwinInitializationSettings iOSSettings = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: (id, title, body, payload) {
        debugPrint(" [onDidReceiveLocalNotification] ======>  $id, $title, $body");
      },
    );

    return InitializationSettings(android: androidSettings, iOS: iOSSettings);
  }

  /// Retrieves the FCM token and stores it in shared preferences
  Future<String?> _getToken() async {
    final String? token = await _firebaseMessaging.getToken();
    debugPrint('🔥 [FCM TOKEN] == $token');
    // if (token != null) {
    //   await SharedPreferencesService.instance!.setFCMToken(token);
    // }
    return token;
  }
}
