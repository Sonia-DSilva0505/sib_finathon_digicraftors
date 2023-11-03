import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'banking_walk_through.dart';
import '../utils/banking_colors.dart';
import '../utils/banking_contants.dart';
import '../utils/banking_strings.dart';

class BankingSplash extends StatefulWidget {
  static String tag = '/BankingSplash';

  const BankingSplash({super.key});

  @override
  State<BankingSplash> createState() => _BankingSplashState();
}

class _BankingSplashState extends State<BankingSplash> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    setState(() {
      finish(context);
      const BankingWalkThrough().launch(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topLeft,
                    colors: [Banking_Primary, Banking_palColor])),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(Banking_lbl_app_Name,
                        style: boldTextStyle(
                            color: Banking_TextColorWhite, size: 30))
                    .paddingOnly(bottom: spacing_standard),
                Text(Banking_lbl_app_Sub_title,
                    style:
                        boldTextStyle(color: Banking_TextColorWhite, size: 14)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
