import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildAmount extends StatelessWidget {
  final TextEditingController amountController;

  const BuildAmount({super.key, required this.amountController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        /// title
        const Text(
          "Amount",

          style: TextStyle(
            fontWeight: FontWeight.bold,

            color: AppColors.hintText,
          ),
        ),

        const SizedBox(height: 10),

        ///  amount input
        TextField(
          //  parent controller
          controller: amountController,

          //  number keyboard
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],

          //  text style
          style: const TextStyle(
            fontSize: 25,

            fontWeight: FontWeight.bold,

            color: AppColors.bgLight,
          ),

          decoration: InputDecoration(
            //  hint text
            hintText: "\$ 0.00",

            hintStyle: TextStyle(
              fontSize: 25,

              fontWeight: FontWeight.bold,

              color: AppColors.hintText.withOpacity(.5),
            ),

            // background enable
            filled: true,

            //  same background color
            fillColor: Colors.white.withOpacity(0.35),

            //  remove border
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),

              borderSide: BorderSide.none,
            ),

            // remove focused border
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),

              borderSide: BorderSide.none,
            ),

            //  inner padding
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
          ),
        ),
      ],
    );
  }
}
