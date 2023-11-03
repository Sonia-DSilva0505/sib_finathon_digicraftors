import 'package:finathon_app/Track/track.dart';
import 'package:finathon_app/screen/question_popup.dart';
import 'package:flutter/material.dart';
import '../utils/banking_bottom_navigation_bar.dart';
import '../utils/banking_colors.dart';
import '../utils/banking_images.dart';
import '../utils/banking_strings.dart';

import 'banking_home1.dart';
import 'banking_payment.dart';
import 'banking_saving.dart';
import 'banking_transfer.dart';

class BankingDashboard extends StatefulWidget {
  static var tag = "/BankingDashboard";

  const BankingDashboard({super.key});

  @override
  State<BankingDashboard> createState() => _BankingDashboardState();
}

class _BankingDashboardState extends State<BankingDashboard> {
  var selectedIndex = 0;
  var pages = [
    const BankingHome1(),
    const BankingTransfer(),
    const BankingPayment(),
    const BankingSaving(),
    const Tracking(),
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    Future.delayed(Duration.zero, () => showMyDialog(context));
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Take Survey'),
          content: const SurveyWidget(),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Skip'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Submit',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Banking_app_Background,
        bottomNavigationBar: BankingBottomNavigationBar(
          selectedItemColor: Banking_Primary,
          unselectedItemColor: Banking_greyColor.withOpacity(0.5),
          items: const <BankingBottomNavigationBarItem>[
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Home, title: Text(Banking_lbl_Home)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Transfer, title: Text(Banking_lbl_Transfer)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Payment, title: Text(Banking_lbl_Payment)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Saving, title: Text(Banking_lbl_Saving)),
            BankingBottomNavigationBarItem(
                icon: Banking_ic_Menu, title: Text(Banking_lbl_Menu)),
          ],
          currentIndex: selectedIndex,
          unselectedIconTheme: IconThemeData(
              color: Banking_greyColor.withOpacity(0.5), size: 28),
          selectedIconTheme:
              const IconThemeData(color: Banking_Primary, size: 28),
          onTap: _onItemTapped,
          type: BankingBottomNavigationBarType.fixed,
        ),
        body: SafeArea(
          child: pages[selectedIndex],
        ),
      ),
    );
  }
}
