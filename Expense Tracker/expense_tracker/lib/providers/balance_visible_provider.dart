import 'package:expense_tracker/hive/services/hive_services.dart';
import 'package:flutter/material.dart';

class BalanceVisibleProvider extends ChangeNotifier {
  bool isHidden = false;

  void toggleBalanceVisibility() async {
    isHidden = !isHidden;

    await HiveServices.saveBalanceVisibility(isHidden);

    notifyListeners();
  }

  /// LOAD SAVED STATE
  Future<void> loadBalanceVisibility() async {
    final saved = await HiveServices.getBalanceVisibility();

    if (saved != null) {
      isHidden = saved;

      notifyListeners();
    }
  }
}
