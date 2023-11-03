import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../model/banking_model.dart';
import '../utils/banking_colors.dart';
import '../utils/banking_contants.dart';
import '../utils/banking_data_generator.dart';
import '../utils/banking_strings.dart';
import '../utils/banking_widget.dart';

class BankingPaymentHistory extends StatefulWidget {
  static var tag = "/BankingPaymentHistory";

  const BankingPaymentHistory({super.key});

  @override
  State<BankingPaymentHistory> createState() => _BankingPaymentHistoryState();
}

class _BankingPaymentHistoryState extends State<BankingPaymentHistory> {
  late List<BankingPaymentHistoryModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = bankingHistoryList1();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: spacing_standard_new,
            ),
            headerView(Banking_lbl_Payment_History, width * 0.4, context),
            Text("22 Feb 2021",
                    style: secondaryTextStyle(
                        color: Banking_TextColorSecondary,
                        size: 14,
                        fontFamily: fontRegular))
                .paddingOnly(
                    left: spacing_standard_new, top: spacing_standard_new),
            const Divider().paddingOnly(
                left: spacing_standard_new, right: spacing_standard_new),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList1.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.account_balance_wallet,
                            size: 30, color: Banking_Primary)
                        .paddingOnly(left: spacing_standard),
                    Text(mList1[index].title!,
                            style: primaryTextStyle(size: 16))
                        .paddingOnly(
                            left: spacing_standard, right: spacing_standard)
                        .expand(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(mList1[index].rs!,
                              style: primaryTextStyle(
                                  color: Banking_TextColorOrange, size: 16))
                          .paddingOnly(
                              left: spacing_standard, right: spacing_standard),
                    )
                  ],
                ).paddingAll(spacing_standard),
              ),
            ).paddingOnly(bottom: 8),
            Text("22 Mar 2021",
                    style: secondaryTextStyle(
                        color: Banking_TextColorSecondary,
                        size: 14,
                        fontFamily: fontRegular))
                .paddingOnly(
                    left: spacing_standard_new, top: spacing_standard_new),
            const Divider().paddingOnly(
                left: spacing_standard_new, right: spacing_standard_new),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList1.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.account_balance_wallet,
                            size: 30, color: Banking_Primary)
                        .paddingOnly(left: spacing_standard),
                    Text(mList1[index].title!,
                            style: primaryTextStyle(size: 16))
                        .paddingOnly(
                            left: spacing_standard, right: spacing_standard)
                        .expand(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(mList1[index].rs!,
                              style: primaryTextStyle(
                                  color: Banking_TextColorOrange, size: 16))
                          .paddingOnly(
                              left: spacing_standard, right: spacing_standard),
                    )
                  ],
                ).paddingAll(spacing_standard),
              ),
            ).paddingOnly(bottom: 8),
            Text("22 Apr 2021",
                    style: secondaryTextStyle(
                        color: Banking_TextColorSecondary,
                        size: 14,
                        fontFamily: fontRegular))
                .paddingOnly(
                    left: spacing_standard_new, top: spacing_standard_new),
            const Divider().paddingOnly(
                left: spacing_standard_new, right: spacing_standard_new),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: mList1.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                    child: Row(
                  children: <Widget>[
                    const Icon(Icons.account_balance_wallet,
                            size: 30, color: Banking_Primary)
                        .paddingOnly(left: spacing_standard),
                    Text(mList1[index].title!,
                            style: primaryTextStyle(size: 16))
                        .paddingOnly(
                            left: spacing_standard, right: spacing_standard)
                        .expand(),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(mList1[index].rs!,
                              style: primaryTextStyle(
                                  color: Banking_TextColorOrange, size: 16))
                          .paddingOnly(
                              left: spacing_standard, right: spacing_standard),
                    )
                  ],
                ).paddingAll(spacing_standard)),
              ),
            ).paddingOnly(bottom: 8)
          ],
        ),
      ),
    );
  }
}
