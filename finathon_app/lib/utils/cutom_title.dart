import 'package:finathon_app/utils/icon_text.dart';
import 'package:flutter/material.dart';

Widget customTitleWithSeeAll(
    BuildContext context, String title, Function seeAll, bool showEdit) {
  return SizedBox(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          IconButton(
              onPressed: () {
                // _pickfile();
                //show model bottom sheet
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      color: Colors.orange.withOpacity(0.1),
                      child: const Wrap(
                        children: [
                          Draggable<IconText>(
                            data: IconText(
                                icon: Icon(Icons.balance), text: "balance"),
                            feedback: Icon(Icons.balance),
                            child: IconText(
                                icon: Icon(Icons.balance), text: "balance"),
                          ),
                          Draggable<IconText>(
                            data: IconText(
                                icon: Icon(Icons.file_download), text: "fd"),
                            feedback: Icon(Icons.file_download),
                            child: IconText(
                                icon: Icon(Icons.file_download), text: "fd"),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: Image.asset(
                "images/icons/write.png",
                color: Colors.grey,
                width: 16,
              )),
        ],
      ),
      TextButton(
        onPressed: () {
          seeAll();
        },
        child: const Text(
          "See All",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    ],
  ));
}
