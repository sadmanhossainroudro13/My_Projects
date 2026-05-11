class ChartItem {
  final String title;
  final double amount; // spent
  final double limit; // total budget
  final int color;

  ChartItem({
    required this.title,
    required this.amount,
    required this.limit,
    required this.color,
  });
}
