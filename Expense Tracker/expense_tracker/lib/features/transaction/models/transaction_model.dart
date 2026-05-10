class TransactionModel {
  final String title;
  final double amount;

  final String category;

  final bool isExpense;

  final DateTime date;


  final String note;

  TransactionModel({
    required this.title,
    required this.amount,
    required this.category,
    required this.isExpense,
    required this.note,
    required this.date,
  });
}
