import 'package:finathon_app/provider/goal_provider.dart';
import 'package:finathon_app/provider/transtion_provider.dart';
import 'package:finathon_app/provider/ui_provider.dart';
import 'package:finathon_app/provider/user_provider.dart';
import 'package:finathon_app/screen/SMS/sms_service.dart';
import 'package:finathon_app/screen/banking_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:telephony/telephony.dart';
import 'utils/app_colors.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final telephony = Telephony.instance;

  final _smsProvider = SmsProvider();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  onMessage(SmsMessage message) async {
    _smsProvider.storeMessage(message);
  }

  Future<void> initPlatformState() async {
    final bool? result = await telephony.requestPhoneAndSmsPermissions;

    if (result != null && result) {
      telephony.listenIncomingSms(
          onNewMessage: onMessage, onBackgroundMessage: onBackgroundMessage);
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<GoalProvider>(
          create: (context) => GoalProvider(),
        ),
        ChangeNotifierProvider<UIProvider>(
          create: (context) => UIProvider(),
        ),
        ChangeNotifierProvider<TransactionProvider>(
          create: (context) => TransactionProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Banking UI Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: R.primaryColor,
          // primarySwatch: Colors.red,
        ),
        home: const BankingDashboard(),
      ),
    );
  }
}

onBackgroundMessage(SmsMessage message) {
  debugPrint("onBackgroundMessage called");
}


