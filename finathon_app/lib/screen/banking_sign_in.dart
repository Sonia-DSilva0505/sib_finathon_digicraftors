import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'banking_dashboard.dart';
import 'banking_forgot_password.dart';
import '../utils/banking_colors.dart';
import '../utils/banking_images.dart';
import '../utils/banking_strings.dart';
import '../utils/banking_widget.dart';

class BankingSignIn extends StatefulWidget {
  static var tag = "/BankingSignIn";

  const BankingSignIn({super.key});

  @override
  State<BankingSignIn> createState() => _BankingSignInState();
}

class _BankingSignInState extends State<BankingSignIn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(Banking_lbl_SignIn, style: boldTextStyle(size: 30)),
                EditText(text: "Phone", isPassword: false),
                8.height,
                EditText(text: "Password", isPassword: true, isSecure: true),
                8.height,
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(Banking_lbl_Forgot,
                          style: secondaryTextStyle(size: 16))
                      .onTap(
                    () {
                      const BankingForgotPassword().launch(context);
                    },
                  ),
                ),
                16.height,
                BankingButton(
                  textContent: Banking_lbl_SignIn,
                  onPressed: () {
                    finish(context);
                    const BankingDashboard().launch(context);
                  },
                ),
                16.height,
                Column(
                  children: [
                    Text(Banking_lbl_Login_with_FaceID,
                            style: primaryTextStyle(
                                size: 16, color: Banking_TextColorSecondary))
                        .onTap(() {}),
                    16.height,
                    Image.asset(Banking_ic_face_id,
                        color: Banking_Primary, height: 40, width: 40),
                  ],
                ).center(),
              ],
            ).center(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(Banking_lbl_app_Name.toUpperCase(),
                style: primaryTextStyle(
                    size: 16, color: Banking_TextColorSecondary)),
          ).paddingBottom(16),
        ],
      ),
    );
  }
}
