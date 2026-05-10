import 'package:expense_tracker/features/transaction/widgets/build_date_time_widget.dart';
import 'package:flutter/material.dart';

class BuildTime extends StatelessWidget {

  final String selectedTime;

  final VoidCallback onTap;

  const BuildTime({
    super.key,
    required this.selectedTime,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(

      child: BuildDateTimeWidget(

        icon: Icons.access_time_outlined,

        title: "Time",

        subtitle: selectedTime,

        onTap: onTap,
      ),
    );
  }
}