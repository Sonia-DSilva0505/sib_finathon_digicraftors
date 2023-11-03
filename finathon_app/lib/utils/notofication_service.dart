import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static final onClickNotification = BehaviorSubject<String>();


  static void onNotificationTap(NotificationResponse notificationResponse) {
    onClickNotification.add(notificationResponse.payload!);
  }
  static Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationTap,
        onDidReceiveBackgroundNotificationResponse: onNotificationTap);
  }


  static Future showSimpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker', icon: "ic_launcher");
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await _flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }


  // static Future showPeriodicNotifications({
  //   required String title,
  //   required String body,
  //   required String payload,
  // }) async {
  //   const AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails('channel 2', 'your channel name',
  //           channelDescription: 'your channel description',
  //           importance: Importance.max,
  //           priority: Priority.high,
  //           ticker: 'ticker');
  //   const NotificationDetails notificationDetails =
  //       NotificationDetails(android: androidNotificationDetails);
  //   await _flutterLocalNotificationsPlugin.periodicallyShow(
  //       1, title, body, RepeatInterval.everyMinute, notificationDetails,
  //       payload: payload);
  // }

  // static Future showScheduleNotification({
  //   required String title,
  //   required String body,
  //   required String payload,
  // }) async {
  //   tz.initializeTimeZones();
  //   await _flutterLocalNotificationsPlugin.zonedSchedule(
  //       2,
  //       title,
  //       body,
  //       tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
  //       const NotificationDetails(
  //           android: AndroidNotificationDetails(
  //               'channel 3', 'your channel name',
  //               channelDescription: 'your channel description',
  //               importance: Importance.max,
  //               priority: Priority.high,
  //               ticker: 'ticker')),
  //       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //       uiLocalNotificationDateInterpretation:
  //           UILocalNotificationDateInterpretation.absoluteTime,
  //       payload: payload);
  // }


  static Future cancel(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }


  static Future cancelAll() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }
}