// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class GoalProvider extends ChangeNotifier {
  bool goal_assigned = false;

  bool get is_goal_assigned => goal_assigned;
  set is_goal_assigned(bool value) => goal_assigned = value;

  String goal_desc = "Buy a phone";
  String goal_amount = "20000";

  double getScore() {
    return 0.0;
  }
}
