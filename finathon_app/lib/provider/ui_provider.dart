import 'package:finathon_app/utils/icon_text.dart';
import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  final mostUsedFeature = [
    'FOR_send_money',
    'transaction_own_acc',
    'transaction_neft',
    'gold_loan_renew'
  ];

  // For every feature, we have a component in the UI
  // This map will help us map the feature to the component
  //feature map for ['fd_open', 'kyc_update', 'FOR_add_beneficiary', 'FOR_send_money', 'priority_banking_request', 'mail_id_update', 'transaction_imps', 'transaction_neft', 'fast_tag', 'transaction_own_acc', 'billpay_recharge', 'fsld_open', 'rd_opening', 'gold_loan_renew', 'apply_apy', 'app_login']

  final featureComponentMap = {
    'transaction_own_acc': const IconText(
        iconPath: "images/icons/transaction_own_acc.png",
        text: "Transaction Own Account"),
    'transaction_imps': const IconText(
        iconPath: "images/icons/transaction_imps.png",
        text: "Transaction IMPS"),
    'transaction_neft': const IconText(
        iconPath: "images/icons/transaction_neft.png",
        text: "Transaction NEFT"),
    'gold_loan_renew': const IconText(
        iconPath: "images/icons/gold_loan_renew.png",
        text: "Gold Loan Renewal"),
    'fd_open': const IconText(
        iconPath: "images/icons/fd_open.png", text: "Open Fixed Deposit"),
    'kyc_update':
        const IconText(iconPath: "images/icons/kyc_update.png", text: "Update KYC"),
    'FOR_add_beneficiary': const IconText(
        iconPath: "images/icons/add_beneficiary.png", text: "Add Beneficiary"),
    'FOR_send_money': const IconText(
        iconPath: "images/icons/transaction_own_acc.png", text: "Send Money"),
    'priority_banking_request': const IconText(
        iconPath: "images/icons/transaction_own_acc.png",
        text: "Priority Banking Request"),
    'mail_id_update': const IconText(
        iconPath: "images/icons/kyc_update.png", text: "Update Email ID"),
    'fast_tag':
        const IconText(iconPath: "images/icons/fast_tag.png", text: "Fast Tag"),
    'rd_opening': const IconText(
        iconPath: "images/icons/kyc_update.png", text: "Open RD Account"),
    'apply_apy': const IconText(
        iconPath: "images/icons/kyc_update.png", text: "Apply APY Scheme"),
  };


  List<Draggable> dragables =  [
                                          Draggable<IconText>(
                                            data: const IconText(
                                                iconPath: "images/icons/fd.png",
                                                text: "balance"),
                                            feedback: Image.asset("images/icons/fd.png"),
                                            child: const IconText(
                                                iconPath: "images/icons/fd.png",
                                                text: "balance"),
                                          ),
                                           Draggable<IconText>(
                                            data: const IconText(
                                                iconPath: "images/icons/fd.png",
                                                text: "balance"),
                                           feedback: Image.asset("images/icons/fd.png"),
                                            child: const IconText(
                                                iconPath: "images/icons/fd.png",
                                                text: "balance"),
                                          ),
                                        ];

  // This list will contain the components of the most used features
  final iconList = [];

  UIProvider() {
    for (var feature in mostUsedFeature) {
      iconList.add(featureComponentMap[feature]);
    }
  }

  //return iconList;
}
