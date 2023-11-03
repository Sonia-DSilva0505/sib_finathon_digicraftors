import 'package:finathon_app/Track/line%20chart/line_chart_sample2.dart';
import 'package:flutter/material.dart';

class TabDaily extends StatelessWidget {
  const TabDaily({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        SizedBox(height: 200, child: LineChartSample2()),
      ],
    );
  }
}
