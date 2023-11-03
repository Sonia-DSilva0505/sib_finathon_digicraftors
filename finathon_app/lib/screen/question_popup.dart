import 'package:flutter/material.dart';

class SurveyWidget extends StatefulWidget {
  const SurveyWidget({super.key});

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      width: 400,
      child:  Column(
          children: [
            const Text(
              "Question: Which option best describes your preference?",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                RadioListTile(
                  title: const Text("Option A"),
                  value: 1,
                  groupValue: selectedOption,
                  onChanged: ( value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Option B"),
                  value: 2,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Option C"),
                  value: 3,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Option D"),
                  value: 4,
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      );
  
  }
}

