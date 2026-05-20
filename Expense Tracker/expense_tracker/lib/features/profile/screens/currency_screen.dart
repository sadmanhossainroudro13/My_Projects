import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/profile/models/currency_model.dart';
import 'package:expense_tracker/features/profile/widgets/currency_tile.dart';
import 'package:expense_tracker/providers/currency_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final TextEditingController searchController = TextEditingController();

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CurrencyProvider>(context);

    /// FILTERED LIST
    final List<CurrencyModel> filteredCurrencies = provider.currencies.where((
      currency,
    ) {
      return currency.name.toLowerCase().contains(searchText.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.socialBg,
      appBar: AppBar(title: const Text("Select Currency")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            /// SEARCH BAR
            TextField(
              controller: searchController,

              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },

              decoration: InputDecoration(
                hintText: "Search currency",

                prefixIcon: const Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// CURRENCY LIST
            Expanded(
              child: ListView.builder(
                itemCount: filteredCurrencies.length,

                itemBuilder: (context, index) {
                  final currency = filteredCurrencies[index];

                  return CurrencyTile(
                    currency: currency,

                    isSelected: provider.selectedCurrency.code == currency.code,

                    onTap: () {
                      provider.changeCurrency(currency);

                      Navigator.pop(context);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
