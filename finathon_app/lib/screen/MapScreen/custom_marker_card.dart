import 'package:flutter/material.dart';
import '../../model/expense.dart';
import '../../utils/app_colors.dart';

class MyCard extends StatelessWidget {
  final Expense expense;

  const MyCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 80,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
          color: R.primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            expense.time.toString(),
            style: const TextStyle(
              fontSize: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Amount: ₹${expense.amount.toString()}',
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            'Category: $expense.category',
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }
}
