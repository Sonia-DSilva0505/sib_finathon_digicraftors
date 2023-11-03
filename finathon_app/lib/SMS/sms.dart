import 'package:flutter/material.dart';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:readsms/readsms.dart';


class SMSReader extends StatefulWidget {
  const SMSReader({Key? key}) : super(key: key);

  @override
  State<SMSReader> createState() => _SMSReaderState();
}

class _SMSReaderState extends State<SMSReader> {
  final _plugin = Readsms();
  String sms = 'no sms received';
  String sender = 'no sms received';
  String time = 'no sms received';

  @override
  void initState() {
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
  void dispose() {
    super.dispose();
    _plugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('new sms received: $sms'),
              Text('new sms Sender: $sender'),
              Text('new sms time: $time'),
            ],
          ),
        ),
      ),
    );
  }
}