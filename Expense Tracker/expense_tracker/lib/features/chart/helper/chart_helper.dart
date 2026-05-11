String getMonthName(int month) {
  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  return months[month - 1];
}

String getHeaderText({
  required String selectFilter,

  required DateTime selectedDate,
}) {
  if (selectFilter == "Week") {
    final startOfWeek = selectedDate.subtract(
      Duration(days: selectedDate.weekday - 1),
    );

    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    return "${startOfWeek.day} "
        "${getMonthName(startOfWeek.month)}"
        " - "
        "${endOfWeek.day} "
        "${getMonthName(endOfWeek.month)}";
  } else if (selectFilter == "Month") {
    return "${getMonthName(selectedDate.month)} "
        "${selectedDate.year}";
  } else {
    return "${selectedDate.year}";
  }
}
