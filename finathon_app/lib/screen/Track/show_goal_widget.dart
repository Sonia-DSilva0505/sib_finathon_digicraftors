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
    return Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)), // added rounded corners
        elevation: 0, // added elevation for shadow effect
        color:  Colors.grey
            .withOpacity(0.6), // changed primary color to orange-red
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              // changed gradient colors to monochromatic scheme
              colors: [Colors.white30, Colors.white70],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15), // added rounded corners
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Amount to be saved", style: TextStyle(color: Colors.red),),
                    const SizedBox(height: 4,),
                    
                    Text('₨ ${goalProvider.goal_amount}', style: const TextStyle(fontSize: 40, ),),
                    const SizedBox(height: 20,),

                    Text("For: ${goalProvider.goal_desc}"),
                    // const Text("Goal Amount"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Score ${goalProvider.getScore().toString()}"),
              ),
            ],
          ),
        ));
  }
}
