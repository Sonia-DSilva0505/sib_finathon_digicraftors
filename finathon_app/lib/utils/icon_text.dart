import 'package:flutter/material.dart';


class IconText extends StatelessWidget {
  final String iconPath;
  final String text;
  const IconText({Key? key, required this.iconPath, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return SizedBox(
    child: Column(children: [
      Padding(padding: const EdgeInsets.all(3),child: Image.asset(iconPath , height: 50),),
      Padding(padding: const EdgeInsets.all(2), child: Text(text),)

    ]),
  );
  }
}
