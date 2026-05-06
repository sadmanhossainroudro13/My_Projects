import 'package:expense_tracker/screens/addTransaction/widgets/build_amount.dart';
import 'package:expense_tracker/screens/addTransaction/widgets/build_category_chips.dart';
import 'package:expense_tracker/screens/addTransaction/widgets/build_date_time.dart';
import 'package:expense_tracker/screens/addTransaction/widgets/build_note_field.dart';
import 'package:expense_tracker/screens/addTransaction/widgets/build_receipt.dart';
import 'package:expense_tracker/screens/addTransaction/widgets/build_save_button.dart';
import 'package:expense_tracker/screens/addTransaction/widgets/build_type_toggle.dart';
import 'package:expense_tracker/screens/addTransaction/widgets/transaction_header.dart';
import 'package:expense_tracker/widgets/background_screen.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      customChild: SafeArea(
        child: Stack(
          children: [
            /// 🔹 MAIN CONTENT
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🟢 1. HEADER
                TransactionHeader(),

                const SizedBox(height: 20),

                /// 🟡 2. BODY (WHITE CARD AREA)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.inputBg,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),

                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///  3. AMOUNT DISPLAY
                          BuildAmount(),

                          const SizedBox(height: 20),

                          ///  4. CATEGORY CHIPS
                          BuildCategoryChips(),

                          const SizedBox(height: 20),

                          ///  5. EXPENSE / INCOME TOGGLE
                          BuildTypeToggle(),

                          const SizedBox(height: 20),

                          /// 🟠 6. DATE & TIME
                          BuildDateTime(),

                          const SizedBox(height: 20),

                          /// 🟡 7. NOTE FIELD
                          BuildNoteField(),

                          const SizedBox(height: 20),

                          /// 🟤 8. RECEIPT
                          BuildReceipt(),

                          const SizedBox(height: 30),

                          /// 🔴 9. SAVE BUTTON
                          BuildSaveButton(),

                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
