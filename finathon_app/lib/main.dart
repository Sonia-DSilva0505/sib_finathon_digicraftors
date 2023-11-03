import 'package:finathon_app/provider/user_provider.dart';
import 'package:finathon_app/screen/banking_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
        title: 'Banking UI Flutter',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BankingDashboard(),
      ),
    );
  }
}
