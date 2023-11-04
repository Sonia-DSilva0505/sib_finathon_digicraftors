import 'package:finathon_app/provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class BankingPayment extends StatefulWidget {
  static var tag = "/BankingPayment";

  const BankingPayment({super.key});

  @override
  State<BankingPayment> createState() => _BankingPaymentState();
}

class _BankingPaymentState extends State<BankingPayment> {
  late List<String> filteredKeys;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
      final uiProvider = Provider.of<UIProvider>(context, listen: false);
    filteredKeys = uiProvider.featureComponentMap.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final featureComponentMap = uiProvider.featureComponentMap;

    void filterItems(String query) {
      setState(() {
        filteredKeys = featureComponentMap.keys
            .where((key) =>
                key.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              10.height,
              const Text(
                'Banking',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.black, // Set your desired text color
                ),
              ),
              8.height,
              TextFormField(
                controller: searchController,
                onChanged: (query) {
                  filterItems(query);
                },
                decoration: const InputDecoration(
                  hintText: 'Search Payment',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey, // Set your desired label text color
                  ),
                  suffixIcon: Icon(Icons.search, size: 30),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              20.height,
              GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: filteredKeys.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final key = filteredKeys[index];
                  final iconText = featureComponentMap[key];
                  return Container(
                    margin: const EdgeInsets.only(
                      left: 6,
                      right: 6,
                      top: 6,
                      bottom: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white, // Set your desired background color
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          iconText?.iconPath ?? "",
                          height: 35,
                          width: 35,
                        ),
                        15.height,
                        Text(
                          iconText?.text ?? "",
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
