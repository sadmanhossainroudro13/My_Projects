import 'package:expense_tracker/features/transaction/widgets/build_date_time_widget.dart';
import 'package:flutter/material.dart';

class BuildDate extends StatelessWidget {

  final String selectedDate;

  final VoidCallback onTap;

  const BuildDate({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(

      child: BuildDateTimeWidget(

        icon: Icons.calendar_today_outlined,

        title: "Date",

        subtitle: selectedDate,

        onTap: onTap,
      ),
    );
  }
}