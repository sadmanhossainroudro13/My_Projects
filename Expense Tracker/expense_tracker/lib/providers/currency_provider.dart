import 'package:expense_tracker/hive/services/hive_services.dart';
import 'package:expense_tracker/features/profile/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyProvider extends ChangeNotifier {
  /// DEFAULT CURRENCY
  CurrencyModel selectedCurrency = CurrencyModel(
    name: "US Dollar",
    code: "USD",
    symbol: "\$",
  );

  /// POPULAR CURRENCY LIST
  final List<CurrencyModel> currencies = [
    CurrencyModel(name: "US Dollar", code: "USD", symbol: "\$"),

    CurrencyModel(name: "Bangladeshi Taka", code: "BDT", symbol: "৳"),

    CurrencyModel(name: "Euro", code: "EUR", symbol: "€"),

    CurrencyModel(name: "British Pound", code: "GBP", symbol: "£"),

    CurrencyModel(name: "Indian Rupee", code: "INR", symbol: "₹"),

    CurrencyModel(name: "Japanese Yen", code: "JPY", symbol: "¥"),

    CurrencyModel(name: "Chinese Yuan", code: "CNY", symbol: "¥"),

    CurrencyModel(name: "Canadian Dollar", code: "CAD", symbol: "C\$"),

    CurrencyModel(name: "Australian Dollar", code: "AUD", symbol: "A\$"),

    CurrencyModel(name: "Singapore Dollar", code: "SGD", symbol: "S\$"),

    CurrencyModel(name: "UAE Dirham", code: "AED", symbol: "د.إ"),

    CurrencyModel(name: "Saudi Riyal", code: "SAR", symbol: "﷼"),

    CurrencyModel(name: "Pakistani Rupee", code: "PKR", symbol: "₨"),

    CurrencyModel(name: "Russian Ruble", code: "RUB", symbol: "₽"),

    CurrencyModel(name: "South Korean Won", code: "KRW", symbol: "₩"),

    CurrencyModel(name: "Swiss Franc", code: "CHF", symbol: "CHF"),

    CurrencyModel(name: "Turkish Lira", code: "TRY", symbol: "₺"),

    CurrencyModel(name: "Thai Baht", code: "THB", symbol: "฿"),

    CurrencyModel(name: "Malaysian Ringgit", code: "MYR", symbol: "RM"),

    CurrencyModel(name: "Brazilian Real", code: "BRL", symbol: "R\$"),
  ];

  /// CHANGE CURRENCY
  void changeCurrency(CurrencyModel currency) async {
    selectedCurrency = currency;

    await HiveServices.saveCurrency(currency.code);

    notifyListeners();
  }

  ///Load currency
  Future<void> loadCurrency() async {
    final savedCode = await HiveServices.getCurrency();

    if (savedCode != null) {
      selectedCurrency = currencies.firstWhere(
        (currency) => currency.code == savedCode,
      );
      notifyListeners();
    }
  }
}
