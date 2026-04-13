import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final String str;
  const BoldText({required this.str});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        '$str',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
