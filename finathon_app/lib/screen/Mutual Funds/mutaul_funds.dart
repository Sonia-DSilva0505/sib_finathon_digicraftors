import 'package:finathon_app/utils/app_colors.dart';
import 'package:flutter/material.dart';

class MutualFund {
  String name;
  String description;
  double price;
  // Add more attributes as needed

  MutualFund(this.name, this.description, this.price);
}

class MutualFundsScreen extends StatefulWidget {
  const MutualFundsScreen({super.key});

  @override
  State<MutualFundsScreen> createState() => _MutualFundsScreenState();
}

class _MutualFundsScreenState extends State<MutualFundsScreen> {
  List<MutualFund> mutualFunds = [
    MutualFund("SIB Equity Fund",
        "Diversified equity fund with strong growth potential.", 100.0),
    MutualFund("SIB Bond Fund",
        "Invest in high-quality bonds for stable returns.", 150.0),
    // Add more mutual funds
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIB Bank Mutual Funds'),
        backgroundColor: R.primaryColor,
      ),
      body: ListView.builder(
        itemCount: mutualFunds.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: InkWell(
              onTap: () {
                // Handle tapping on a fund to navigate to a detailed screen
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mutualFunds[index].name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      mutualFunds[index].description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹${mutualFunds[index].price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward, // Add your preferred icon here
                          size: 30,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
