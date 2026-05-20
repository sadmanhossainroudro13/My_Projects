import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:expense_tracker/features/chart/helper/chart_helper.dart';
import 'package:expense_tracker/features/chart/widgets/chart_item_class.dart';
import 'package:expense_tracker/features/chart/widgets/category_list_section_budget.dart';
import 'package:expense_tracker/features/chart/widgets/chart_section_budget.dart';
import 'package:expense_tracker/features/chart/widgets/date_navigation_section.dart';
import 'package:expense_tracker/features/chart/widgets/time_filter_toggle.dart';
import 'package:expense_tracker/providers/category_provider.dart';
import 'package:expense_tracker/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  String selectFilter = "Week";

  DateTime selectedDate = DateTime.now();

  void resetChartDate() {
    selectedDate = DateTime.now();
    selectFilter = "Month";
  }

  ///To reset chart data
  @override
  void initState() {
    super.initState();
    resetChartDate();
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    final transactionProvider = Provider.of<TransactionProvider>(context);

    /// FILTERED TRANSACTIONS
    final filteredTransactions = transactionProvider.getFilteredTransactions(
      filter: selectFilter,

      selectedDate: selectedDate,
    );

    /// CATEGORY TOTALS
    Map<String, double> categoryTotals = {};

    for (var transaction in filteredTransactions) {
      if (categoryTotals.containsKey(transaction.category)) {
        categoryTotals[transaction.category] =
            categoryTotals[transaction.category]! + transaction.amount;
      } else {
        categoryTotals[transaction.category] = transaction.amount;
      }
    }

    /// CHART ITEMS
    final List<ChartItem> chartItems = categoryTotals.entries.map((entry) {
      return ChartItem(
        title: entry.key,

        amount: entry.value,

        limit: 1000,

        color: categoryProvider.getCategoryColor(entry.key).value,
      );
    }).toList();

    return Container(
      height: double.infinity,

      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),

      decoration: const BoxDecoration(color: AppColors.socialBg),

      child: SafeArea(
        child: Column(
          children: [
            /// TITLE
            Text(
              "PennyWise Chart",

              style: TextStyle(
                color: AppColors.hintText,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            /// FILTER TOGGLE
            TimeFilterToggle(
              selectedFilter: selectFilter,

              onChanged: (value) {
                setState(() {
                  selectFilter = value;
                });
              },
            ),

            const SizedBox(height: 15),

            /// DATE NAVIGATION
            DateNavigationSection(
              headerText: getHeaderText(
                selectFilter: selectFilter,

                selectedDate: selectedDate,
              ),

              onPrevious: () {
                setState(() {
                  if (selectFilter == "Week") {
                    selectedDate = selectedDate.subtract(
                      const Duration(days: 7),
                    );
                  } else if (selectFilter == "Month") {
                    selectedDate = DateTime(
                      selectedDate.year,
                      selectedDate.month - 1,
                    );
                  } else {
                    selectedDate = DateTime(selectedDate.year - 1);
                  }
                });
              },

              onNext: () {
                setState(() {
                  if (selectFilter == "Week") {
                    selectedDate = selectedDate.add(const Duration(days: 7));
                  } else if (selectFilter == "Month") {
                    selectedDate = DateTime(
                      selectedDate.year,
                      selectedDate.month + 1,
                    );
                  } else {
                    selectedDate = DateTime(selectedDate.year + 1);
                  }
                });
              },
            ),

            const SizedBox(height: 15),

            /// PIE CHART
            ChartSection(items: chartItems),

            const Divider(height: 20, indent: 15, endIndent: 15),

            /// CATEGORY LIST
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CategoryListSectionBudget(items: chartItems),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
