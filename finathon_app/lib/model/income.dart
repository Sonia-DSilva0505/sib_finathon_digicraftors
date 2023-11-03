
import 'dart:convert';

class Income {
  final String source;
  final int amount;
  final DateTime date;
  Income({
    required this.source,
    required this.amount,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source,
      'amount': amount,
      'date': date.millisecondsSinceEpoch,
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      source: map['source'] as String,
      amount: map['amount'] as int,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Income.fromJson(String source) =>
      Income.fromMap(json.decode(source) as Map<String, dynamic>);
}
