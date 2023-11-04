
import 'package:finathon_app/provider/transtion_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:readsms/readsms.dart';

class TranstionList extends StatefulWidget {
  const TranstionList({Key? key}) : super(key: key);

  @override
  State<TranstionList> createState() => _TranstionListState();
}

class _TranstionListState extends State<TranstionList> {
   final _plugin = Readsms();
  String sms = 'no sms received';
  String sender = 'no sms received';
  String time = 'no sms received';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPermission().then((value) {
      if (value) {
        _plugin.read();
        _plugin.smsStream.listen((event) {
          setState(() {
            sms = event.body;
            sender = event.sender;
            time = event.timeReceived.toString();
          });
        });
      }
    });
  }

  
  @override
  void dispose() {
    super.dispose();
    _plugin.dispose();
  }

  Future<bool> getPermission() async {
    if (await Permission.sms.status == PermissionStatus.granted) {
      return true;
    } else {
      if (await Permission.sms.request() == PermissionStatus.granted) {
        return true;
      } else {
        return false;
      }
    }
  }
  @override
  Widget build(BuildContext context) {
  final transtionProvider = Provider.of<TransactionProvider>(context, listen: true);
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: transtionProvider.transtions.length,
        itemBuilder: (context, index) {
        return ListTile(
          title: Text(transtionProvider.transtions[index].category),
          subtitle: Text(DateFormat('dd MMM y').format(transtionProvider.transtions[index].date).toString()),
          trailing: Text(transtionProvider.transtions[index].amount),
        );
      },),
    );
  }
}