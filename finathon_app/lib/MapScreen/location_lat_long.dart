// ignore_for_file: non_constant_identifier_names

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/expense.dart';

class LatLong {
  static List<LatLng> latlnglist = [
    const LatLng(19.101754, 72.825660),
    const LatLng(19.102282, 72.826082),
    const LatLng(19.103634, 72.824304),
    const LatLng(19.991042, 73.797906),
  ];
  static LatLng jw_marriot1 = const LatLng(19.101754, 72.825660);
  static LatLng jw_marriot2 = const LatLng(19.102282, 72.826082);
  static LatLng juhu_beach = const LatLng(19.103634, 72.824304);
  static LatLng nashik = const LatLng(19.991042, 73.797906);
}

class ExpensesList {
  //  Future<List<Expense>> giveExpenseList() async{
  //   Stream<List<Expense>> stream_exp_list = _homeController.getUserExpenseDetails();
  //   List<Expense> list = await stream_exp_list.expand((element) => element).toList();
  //   return list;
  // }

  static List<Expense> expenses = [
    Expense(
        time: DateTime(2023),
        amount: 320,
        category: 'Food',
        lat: 19.102282,
        lng: 72.826082),
    Expense(
        time: DateTime(2022),
        amount: 1080,
        category: 'Shopping',
        lat: 19.103634,
        lng: 72.824304),
    Expense(
        time: DateTime(2023),
        amount: 320,
        category: 'Food',
        lat: 19.991042,
        lng: 73.797906),
    Expense(
        time: DateTime(2023),
        amount: 3000,
        category: 'Food',
        lat: 23.09,
        lng: 45.03),
    Expense(
        time: DateTime(2023),
        amount: 3000,
        category: 'Shopping',
        lat: 23.09,
        lng: 45.03),
    Expense(
        time: DateTime(2023),
        amount: 3000,
        category: 'Travel',
        lat: 23.09,
        lng: 45.03),
  ];
}
