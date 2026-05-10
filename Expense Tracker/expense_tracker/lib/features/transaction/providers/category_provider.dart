import 'package:expense_tracker/features/transaction/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final List<CategoryModel> categories = [
    /// =========================
    /// EXPENSE CATEGORIES
    /// =========================
    CategoryModel(
      title: "Food",
      icon: Icons.restaurant,
      color: const Color(0xFFE5CF45),
    ),

    CategoryModel(
      title: "Shopping",
      icon: Icons.shopping_bag_outlined,
      color: const Color(0xFF7EDC8A),
    ),

    CategoryModel(
      title: "Transport",
      icon: Icons.directions_car,
      color: const Color(0xFF7EC8FF),
    ),

    CategoryModel(
      title: "Bills",
      icon: Icons.receipt_long,
      color: const Color(0xFFFF8A65),
    ),

    CategoryModel(
      title: "Health",
      icon: Icons.favorite_outline,
      color: const Color(0xFFFF6B81),
    ),

    CategoryModel(
      title: "Education",
      icon: Icons.menu_book_outlined,
      color: const Color(0xFF9B7BFF),
    ),

    CategoryModel(
      title: "Entertainment",
      icon: Icons.movie_outlined,
      color: const Color(0xFFFFB347),
    ),

    CategoryModel(
      title: "Travel",
      icon: Icons.flight_takeoff,
      color: const Color(0xFF5CD6C0),
    ),

    CategoryModel(
      title: "Groceries",
      icon: Icons.local_grocery_store_outlined,
      color: const Color(0xFF8BC34A),
    ),

    CategoryModel(
      title: "Subscription",
      icon: Icons.subscriptions_outlined,
      color: const Color(0xFF64B5F6),
    ),

    CategoryModel(
      title: "Pets",
      icon: Icons.pets_outlined,
      color: const Color(0xFFA1887F),
    ),

    /// =========================
    /// INCOME CATEGORIES
    /// =========================
    CategoryModel(
      title: "Salary",
      icon: Icons.account_balance_wallet_outlined,
      color: const Color(0xFF4CAF50),
    ),

    CategoryModel(
      title: "Freelance",
      icon: Icons.laptop_mac_outlined,
      color: const Color(0xFF26A69A),
    ),

    CategoryModel(
      title: "Business",
      icon: Icons.business_center_outlined,
      color: const Color(0xFF42A5F5),
    ),

    CategoryModel(
      title: "Gift",
      icon: Icons.card_giftcard,
      color: const Color(0xFFE573B7),
    ),

    /// =========================
    /// NEUTRAL
    /// =========================
    CategoryModel(
      title: "Savings",
      icon: Icons.savings_outlined,
      color: const Color(0xFF4DB6AC),
    ),

    CategoryModel(
      title: "Others",
      icon: Icons.category_outlined,
      color: const Color(0xFFD2D2D2),
    ),
  ];

  void addCategory(CategoryModel category) {
    categories.add(category);

    notifyListeners();
  }
}
