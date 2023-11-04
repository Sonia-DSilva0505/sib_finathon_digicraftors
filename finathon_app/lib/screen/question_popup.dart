import 'package:flutter/material.dart';

class SurveyWidget extends StatefulWidget {
  const SurveyWidget({super.key});

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  int selectedOption = -1;
  bool isVisible = true;

  Widget buildOption(String title, int value) {
    return Row(mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: value,
          groupValue: selectedOption,
          onChanged: (int? newValue) {
            setState(() {
              selectedOption = newValue!;
            });
          },
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return isVisible
        ? Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Take Survey',
                    style: TextStyle(fontSize: 15),
                  ),
                  const Text(
                    "Question: Are you interested in Mutual Funds?",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 10),
                  buildOption('Yes, Absolutely!', 1),
                  buildOption('I am not sure.', 2),
                  buildOption('I am not interested.', 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isVisible = false;
                          });
                        },
                        child: const Text('Skip'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isVisible = false;
                          });
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

