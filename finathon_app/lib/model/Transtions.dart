class Transaction {
  DateTime date;
  String category;
  bool withdrawal;
  String amount; // Changed the type to double for the amount

  Transaction({
    required this.date,
    required this.category,
    required this.withdrawal,
    required this.amount,
  });

  // Convert the Transaction object to a JSON Map
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'category': category,
      'withdrawal': withdrawal,
      'amount': amount,
    };
  }

  // Create a factory method to create a Transaction object from a JSON Map
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      date: DateTime.parse(json['date']),
      category: json['category'],
      withdrawal: json['withdrawal'],
      amount: json['amount'].toDouble(), // Parse the amount as a double
    );
  }
}
