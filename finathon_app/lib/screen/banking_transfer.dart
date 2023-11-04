import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../model/banking_model.dart';
import '../utils/banking_data_generator.dart';
import 'banking_transfer_successful.dart';
import '../utils/banking_colors.dart';
import '../utils/banking_contants.dart';
import '../utils/banking_slider.dart';
import '../utils/banking_strings.dart';

class BankingTransfer extends StatefulWidget {
  static var tag = "/BankingTransfer";

  const BankingTransfer({super.key});

  @override
  State<BankingTransfer> createState() => _BankingTransferState();
}

class _BankingTransferState extends State<BankingTransfer> {
  bool isSwitch = false;
  bool isGetOtp = false;
  var tapCount = 0;
  late List<BankingHomeModel> mList1;
  late List<BankingHomeModel2> mList2;

  void tappedConfirm() {
    if (tapCount != 1) {
      const BankingTransferSuccessful().launch(context);
    }
  }

  @override
  void initState() {
    super.initState();
    mList1 = bankingHomeList1();
    mList2 = bankingHomeList2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Banking_app_Background,
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.height,
              Text(
                isSwitch == true
                    ? Banking_lbl_Confirm_Transfer
                    : Banking_lbl_Transfer,
                style: primaryTextStyle(
                    color: Banking_TextColorPrimary,
                    size: 26,
                    fontFamily: fontBold),
              ),
              10.height,
              Text("Choose Account to Transfer",
                  style: primaryTextStyle(
                      color: Banking_TextColorSecondary,
                      size: 14,
                      fontFamily: fontBold)),
              16.height,
              const BankingSliderWidget().visible(isSwitch == false),
              Stack(
                children: [
                  Image.asset('Banking_ic_CardImage'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Manish Dayma",
                              style: boldTextStyle(
                                  color: Banking_whitePureColor,
                                  size: 18,
                                  fontFamily: fontMedium))
                          .paddingOnly(
                              top: spacing_large,
                              left: spacing_standard_new),
                      Text("The Same Bank",
                              style: boldTextStyle(
                                  color: Banking_whitePureColor,
                                  size: 18,
                                  fontFamily: fontMedium))
                          .paddingOnly(
                              top: spacing_large, left: spacing_standard_new),
                      Text('1121 *** ** *** 5555',
                              style: boldTextStyle(
                                  color: Banking_whitePureColor,
                                  size: 18,
                                  fontFamily: fontMedium))
                          .paddingOnly(
                              left: spacing_standard_new,
                              top: spacing_control),
                    ],
                  ),
                  10.height,
                ],
              ).visible(isSwitch == true),
              16.height,
              const Divider(),
              // Transactions
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recently Transaction",
                      style: primaryTextStyle(
                          size: 16,
                          color: Banking_TextColorPrimary,
                          fontFamily: fontRegular)),
                  Text("22 Oct 2023",
                      style: primaryTextStyle(
                          size: 16,
                          color: Banking_TextColorSecondary,
                          fontFamily: fontRegular)),
                ],
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: mList1.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    decoration: boxDecorationRoundedWithShadow(8,
                        backgroundColor: Banking_whitePureColor,
                        spreadRadius: 0,
                        blurRadius: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.account_balance_wallet,
                            size: 30, color: mList1[index].color),
                        10.width,
                        Text('${mList1[index].title}',
                                style: primaryTextStyle(
                                    size: 16,
                                    color: mList1[index].color,
                                    fontFamily: fontMedium))
                            .expand(),
                        Text(mList1[index].bal!,
                            style: primaryTextStyle(
                                color: mList1[index].color, size: 16)),
                      ],
                    ),
                  );
                },
              ),
              16.height,
              Text("22 Oct 2023",
                  style: primaryTextStyle(
                      size: 16,
                      color: Banking_TextColorSecondary,
                      fontFamily: fontRegular)),
              const Divider(),
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 15,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  BankingHomeModel2 data = mList2[index % mList2.length];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(top: 8, bottom: 8),
                    decoration: boxDecorationRoundedWithShadow(8,
                        backgroundColor: Banking_whitePureColor,
                        spreadRadius: 0,
                        blurRadius: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(data.icon!,
                            height: 30,
                            width: 30,
                            color:
                                index == 2 ? Banking_Primary : Banking_Primary),
                        10.width,
                        Text(data.title!,
                                style: primaryTextStyle(
                                    size: 16,
                                    color: Banking_TextColorPrimary,
                                    fontFamily: fontRegular))
                            .expand(),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(data.charge!,
                                style: primaryTextStyle(
                                    color: data.color, size: 16)))
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}

dialogContent(BuildContext context) {
  return Container(
    padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
    decoration: boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.circular(10),
        backgroundColor: Banking_whitePureColor),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        8.height,
        Text(Banking_lbl_Same_Bank,
                style: primaryTextStyle(
                    color: Banking_TextColorSecondary,
                    size: 16,
                    fontFamily: fontRegular))
            .onTap(() {
          finish(context);
        }),
        8.height,
        Divider(thickness: 1.0, color: Banking_greyColor.withOpacity(0.5)),
        8.height,
        Text(Banking_lbl_Other_Bank,
                style: primaryTextStyle(
                    color: Banking_TextColorSecondary,
                    size: 16,
                    fontFamily: fontRegular))
            .onTap(() {
          finish(context);
        }),
        8.height,
        Divider(thickness: 1.0, color: Banking_greyColor.withOpacity(0.5)),
        8.height,
        Text(Banking_lbl_Credit_Card,
                style: primaryTextStyle(
                    color: Banking_TextColorSecondary,
                    size: 16,
                    fontFamily: fontRegular))
            .onTap(() {
          finish(context);
        }),
        8.height,
      ],
    ),
  );
}
