import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/profile/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyTile extends StatelessWidget {
  final CurrencyModel currency;
  final bool isSelected;
  final VoidCallback onTap;

  const CurrencyTile({
    super.key,
    required this.currency,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,

      title: Text(currency.name),

      subtitle: Text(currency.code),

      trailing: isSelected
          ? const Icon(Icons.check_circle, color: Colors.green)
          : null,
    );
  }
}
