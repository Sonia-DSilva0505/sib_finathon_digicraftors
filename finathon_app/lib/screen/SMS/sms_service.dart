import 'package:telephony/telephony.dart';

class SmsProvider {
  List<SmsMessage> messages = [];

  void storeMessage(SmsMessage message) {
    messages.add(message);
  }
}