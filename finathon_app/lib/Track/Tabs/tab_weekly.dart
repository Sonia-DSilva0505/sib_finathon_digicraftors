import 'package:flutter/material.dart';

import '../bar graph/bar_graph.dart';

class TabWeekly extends StatelessWidget {
  const TabWeekly({super.key});

  @override
  Widget build(BuildContext context) {
    // list of weekly expense
    List<double> weeklySummary = [
      42.42,
      10.9,
      4.70,
      56.32,
      16.19,
      32.89,
      13.03,
    ];
    return Column(
      children: [
        const SizedBox(height: 30),
        SizedBox(
            height: 200,
            child: MyBarGraph(
              weeklySummary: weeklySummary,
            )),
      ],
    );
  }
}