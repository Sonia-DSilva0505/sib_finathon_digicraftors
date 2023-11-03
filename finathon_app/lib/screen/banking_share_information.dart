import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../model/banking_model.dart';
import '../utils/banking_colors.dart';
import '../utils/banking_contants.dart';
import '../utils/banking_data_generator.dart';
import '../utils/banking_images.dart';
import '../utils/banking_strings.dart';

class BankingShareInformation extends StatefulWidget {
  static var tag = "/BankingShareInformation";

  const BankingShareInformation({super.key});

  @override
  State<BankingShareInformation> createState() =>
      _BankingShareInformationState();
}

class _BankingShareInformationState extends State<BankingShareInformation> {
  late List<BankingShareInfoModel> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = bankingInfoList();
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
            children: <Widget>[
              30.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Icon(Icons.chevron_left,
                          size: 30, color: Banking_blackColor)
                      .onTap(
                    () {
                      finish(context);
                    },
                  ),
                  30.height,
                  Text("Share\nInformation",
                      style: boldTextStyle(
                          size: 30, color: Banking_TextColorPrimary)),
                ],
              ),
              20.height,
              Row(
                children: <Widget>[
                  const CircleAvatar(
                      backgroundImage: AssetImage(Banking_ic_user2),
                      radius: 25),
                  10.width,
                  Text("Manish Dayma",
                          style: boldTextStyle(
                              color: Banking_TextColorPrimary, size: 24))
                      .center(),
                ],
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(Banking_lbl_Account_Number,
                      style: primaryTextStyle(
                          color: Banking_TextColorPrimary,
                          size: 18,
                          fontFamily: fontSemiBold)),
                  Text("123 456 789",
                      style:
                          primaryTextStyle(size: 18, fontFamily: fontSemiBold)),
                ],
              ),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(Banking_lbl_Bank,
                      style: primaryTextStyle(
                          color: Banking_TextColorPrimary,
                          size: 18,
                          fontFamily: fontSemiBold)),
                  Text(Banking_lbl_app_Name,
                      style:
                          primaryTextStyle(size: 18, fontFamily: fontSemiBold)),
                ],
              ).paddingOnly(bottom: spacing_middle),
              const Divider(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(Banking_lbl_Branch,
                      style: primaryTextStyle(
                          color: Banking_TextColorPrimary,
                          size: 18,
                          fontFamily: fontSemiBold)),
                  Text("Ahmedabad",
                      style:
                          primaryTextStyle(size: 18, fontFamily: fontSemiBold)),
                ],
              ),
              const Divider(height: 24),
              Text(Banking_lbl_QR_Code,
                  style: primaryTextStyle(
                      color: Banking_TextColorPrimary,
                      size: 18,
                      fontFamily: fontSemiBold)),
              20.height,
              Image.asset(Banking_ic_QR,
                      height: 100, width: 100, fit: BoxFit.fill)
                  .center(),
              20.height,
              Text(Banking_lbl_Share_Info,
                  style: primaryTextStyle(
                      color: Banking_TextColorPrimary,
                      size: 18,
                      fontFamily: fontSemiBold)),
              40.height,
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mList1.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(right: spacing_standard_new),
                  physics: const ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 20,
                      width: 50,
                      margin: const EdgeInsets.only(right: 16),
                      padding: const EdgeInsets.all(8),
                      decoration: boxDecorationWithShadow(
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: Banking_whitePureColor,
                          boxShadow: defaultBoxShadow()),
                      child:
                          Image.asset(mList1[index].icon, height: 30, width: 30)
                              .center(),
                    );
                  },
                ),
              ).center(),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
