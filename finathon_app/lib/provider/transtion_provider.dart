


import 'package:finathon_app/model/transtions.dart';
import 'package:flutter/material.dart';



class TransactionProvider extends ChangeNotifier{

  List<Transaction> transtions = [
    Transaction(date: DateTime(11, 11, 2003), amount: "200", category: "Food", withdrawal: true),
    Transaction(date: DateTime(11, 11, 2003), amount: "400", category: "Shopping", withdrawal: false),
    Transaction(date: DateTime(11, 11, 2003), amount: "3000", category: "Food", withdrawal: true),
  ];
}