import 'package:finathon_app/provider/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/app_colors.dart';

class ShowGoalWidget extends StatefulWidget {
  const ShowGoalWidget({Key? key}) : super(key: key);

  @override
  State<ShowGoalWidget> createState() => _ShowGoalWidgetState();
}

class _ShowGoalWidgetState extends State<ShowGoalWidget> {
  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context, listen: true);
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 0,
        color: R.primaryColor.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Amount Taken"),
                  Text("For: ${goalProvider.goal_desc}"),
                  const Text("Goal Amount"),
                  Text('to be Saved: ${goalProvider.goal_amount}'),
                ],
              ),
              Text(goalProvider.getScore().toString()),
            ],
          ),
        ));
  }
}


// ListTile(
//       title: Text("For: ${goalProvider.goal_desc}"),
//       subtitle: Text('to be Saved: ${goalProvider.goal_amount}'),
//       trailing: IconButton(icon: Text(goalProvider.getScore().toString()), onPressed: (){},)
//     )
