
import 'package:finathon_app/provider/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShowGoalWidget extends StatefulWidget {
  const ShowGoalWidget({Key? key}) : super(key: key);

  @override
  State<ShowGoalWidget> createState() => _ShowGoalWidgetState();
}

class _ShowGoalWidgetState extends State<ShowGoalWidget> {
  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context, listen: true);
    return ListTile(
      title: Text("For: ${goalProvider.goal_desc}"),
      subtitle: Text('to be Saved: ${goalProvider.goal_amount}'),
      trailing: IconButton(icon: Text(goalProvider.getScore().toString()), onPressed: (){},)
    );
  }
}