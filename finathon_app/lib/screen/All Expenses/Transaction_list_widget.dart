
import 'package:finathon_app/provider/transtion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TranstionList extends StatefulWidget {
  const TranstionList({Key? key}) : super(key: key);

  @override
  State<TranstionList> createState() => _TranstionListState();
}

class _TranstionListState extends State<TranstionList> {
  @override
  Widget build(BuildContext context) {
  final transtionProvider = Provider.of<TransactionProvider>(context, listen: true);
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: transtionProvider.transtions.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(transtionProvider.transtions[index].category),
        );
      },),
    );
  }
}