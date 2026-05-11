import 'package:expense_tracker/features/transaction/models/transaction_model.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  List<TransactionModel> transactions = [];

  /// ADD TRANSACTION
  void addTransaction(TransactionModel transaction) {
    transactions.add(transaction);

    notifyListeners();
  }

  /// TODAY EXPENSE
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

  /// FILTERED TRANSACTIONS
  List<TransactionModel> getFilteredTransactions({
    required String filter,
    required DateTime selectedDate,
  }) {
    /// WEEK
    if (filter == "Week") {
      final startOfWeek = selectedDate.subtract(
        Duration(days: selectedDate.weekday - 1),
      );

      final endOfWeek = startOfWeek.add(const Duration(days: 6));

      return transactions.where((transaction) {
        return transaction.isExpense &&
            transaction.date.isAfter(
              startOfWeek.subtract(const Duration(days: 1)),
            ) &&
            transaction.date.isBefore(endOfWeek.add(const Duration(days: 1)));
      }).toList();
    }
    /// MONTH
    else if (filter == "Month") {
      return transactions.where((transaction) {
        return transaction.isExpense &&
            transaction.date.month == selectedDate.month &&
            transaction.date.year == selectedDate.year;
      }).toList();
    }
    /// YEAR
    else {
      return transactions.where((transaction) {
        return transaction.isExpense &&
            transaction.date.year == selectedDate.year;
      }).toList();
    }
  }

  /// TOTAL INCOME
  double get totalIncome {
    double total = 0;

    for (var transaction in transactions) {
      if (!transaction.isExpense) {
        total += transaction.amount;
      }
    }

    return total;
  }

  /// TOTAL EXPENSE
  double get totalExpense {
    double total = 0;

    for (var transaction in transactions) {
      if (transaction.isExpense) {
        total += transaction.amount;
      }
    }

    return total;
  }

  /// TOTAL BALANCE
  double get totalBalance {
    return totalIncome - totalExpense;
  }
}
