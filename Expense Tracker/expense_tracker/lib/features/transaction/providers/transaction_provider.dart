import 'package:expense_tracker/features/transaction/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> transactions = [];

  void addTransaction(TransactionModel transaction) {
    transactions.add(transaction);

    notifyListeners();
  }

  /// Today's Expense
  double get todayExpense {
    double total = 0;

    final now = DateTime.now();

    for (var transaction in transactions) {
      if (transaction.isExpense &&
          transaction.date.year == now.year &&
          transaction.date.month == now.month &&
          transaction.date.day == now.day) {

        total += transaction.amount;
      }
    }
    return total;
  }

  ///total income
  double get totalIncome {
    double total = 0;

    for (var transaction in transactions) {
      if (!transaction.isExpense) {
        total += transaction.amount;
      }
    }

    return total;
  }

  ///total expense
  double get totalExpense {
    double total = 0;

    for (var transaction in transactions) {
      if (transaction.isExpense) {
        total += transaction.amount;
      }
    }

    return total;
  }

  double get totalBalance {
    return totalIncome - totalExpense;
  }
}
