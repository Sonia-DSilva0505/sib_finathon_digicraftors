import 'package:finathon_app/provider/goal_provider.dart';
import 'package:finathon_app/provider/ui_provider.dart';
import 'package:finathon_app/provider/user_provider.dart';
import 'package:finathon_app/screen/banking_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import 'utils/app_colors.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider(),),
        ChangeNotifierProvider<GoalProvider>(create: (context) => GoalProvider(),),
        ChangeNotifierProvider<UIProvider>(create: (context) => UIProvider(),),
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
