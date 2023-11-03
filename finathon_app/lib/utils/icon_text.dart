import 'package:flutter/material.dart';


class IconText extends StatelessWidget {
  final Icon icon;
  final String text;
  const IconText({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return SizedBox(
    child: Column(children: [
      Padding(padding: const EdgeInsets.all(3),child:icon,),
      Padding(padding: const EdgeInsets.all(2), child: Text(text),)

    ]),
  );
  }
}
