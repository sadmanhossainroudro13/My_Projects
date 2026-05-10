import 'package:expense_tracker/core/widgets/custom_loading.dart';
import 'package:expense_tracker/features/transaction/models/transaction_model.dart';
import 'package:expense_tracker/features/transaction/providers/transaction_provider.dart';
import 'package:expense_tracker/features/transaction/widgets/build_amount.dart';
import 'package:expense_tracker/features/transaction/widgets/build_category_chips.dart';
import 'package:expense_tracker/features/transaction/widgets/build_date.dart';
import 'package:expense_tracker/features/transaction/widgets/build_note_field.dart';
import 'package:expense_tracker/features/transaction/widgets/build_time.dart';
import 'package:expense_tracker/features/transaction/widgets/build_title_field.dart';
import 'package:expense_tracker/features/transaction/widgets/build_type_toggle.dart';
import 'package:expense_tracker/features/transaction/widgets/transaction_header.dart';
import 'package:expense_tracker/core/widgets/background_screen.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/core/theme/app_theme.dart';
import 'package:provider/provider.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  ///For screen loading
  bool isLoading = false;

  ///title controller
  final titleController = TextEditingController();

  // amount input controller
  final amountController = TextEditingController();

  // selected category
  String selectedCategory = "Food";

  // expense / income toggle
  bool isExpense = true;

  // selected date
  DateTime selectedDate = DateTime.now();

  // selected time
  TimeOfDay selectedTime = TimeOfDay.now();

  // note input controller
  final noteController = TextEditingController();

  ///PickedDate function
  Future<void> pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,

      initialDate: selectedDate,

      firstDate: DateTime(2020),

      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  ///PickedTime Function
  Future<void> pickTime() async {
    final pickedTime = await showTimePicker(
      context: context,

      initialTime: selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  //Save Transaction Function
  Future<void> saveTransaction() async {
    if (titleController.text.trim().isEmpty ||
        amountController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );

      return;
    }
    setState(() {
      isLoading = true;
    });

    final fullDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
    );

    final transaction = TransactionModel(
      title: titleController.text,
      amount: double.parse(amountController.text),
      category: selectedCategory,
      isExpense: isExpense,
      note: noteController.text,
      date: fullDate,
    );

    Provider.of<TransactionProvider>(
      context,
      listen: false,
    ).addTransaction(transaction);

    ///delay 2 second loading
    await Future.delayed(const Duration(seconds: 2));

    titleController.clear();
    amountController.clear();
    noteController.clear();

    setState(() {
      selectedCategory = "Food";
      isExpense = true;
      selectedDate = DateTime.now();
      selectedTime = TimeOfDay.now();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomLoading(
      isLoading: isLoading,
      child: BackgroundScreen(
        customChild: SafeArea(
          child: Stack(
            children: [
              ///  MAIN CONTENT
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///   HEADER
                  TransactionHeader(),

                  const SizedBox(height: 20),

                  ///  BODY (WHITE CARD AREA)
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
                            ///Title
                            BuildTitleField(titleController: titleController),

                            const SizedBox(height: 20),

                            ///   AMOUNT DISPLAY
                            BuildAmount(amountController: amountController),

                            const SizedBox(height: 20),

                            ///   CATEGORY CHIPS
                            BuildCategoryChips(
                              selectedCategory: selectedCategory,
                              onCategorySelected: (category) {
                                setState(() {
                                  selectedCategory = category;
                                });
                              },
                            ),

                            SizedBox(height: 20),

                            ///   EXPENSE / INCOME TOGGLE
                            BuildTypeToggle(
                              isExpense: isExpense,

                              onToggle: (value) {
                                setState(() {
                                  isExpense = value;
                                });
                              },
                            ),

                            const SizedBox(height: 20),

                            /// DATE & TIME
                            Row(
                              children: [
                                BuildDate(
                                  selectedDate:
                                      "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",

                                  onTap: pickDate,
                                ),

                                const SizedBox(width: 12),

                                BuildTime(
                                  selectedTime: selectedTime.format(context),
                                  onTap: pickTime,
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            ///  NOTE FIELD
                            BuildNoteField(notes: noteController),

                            ///GONNA ADD LATER RECIPT PHOTO

                            // const SizedBox(height: 20),

                            // /// RECEIPT
                            // BuildReceipt(),
                            const SizedBox(height: 20),

                            ///  SAVE BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 58,

                              child: ElevatedButton(
                                onPressed: saveTransaction,

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,

                                  elevation: 0,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),

                                child: const Text(
                                  "Save Transaction",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.bgDark,
                                  ),
                                ),
                              ),
                            ),

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
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();

    amountController.dispose();

    noteController.dispose();

    super.dispose();
  }
}
