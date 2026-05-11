import 'package:expense_tracker/features/transaction/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final List<CategoryModel> categories = [
    /// FOOD
    CategoryModel(
      title: "Food",
      icon: Icons.restaurant,
      color: const Color(0xFFE5CF45),
    ),

    /// SHOPPING
    CategoryModel(
      title: "Shopping",
      icon: Icons.shopping_bag_outlined,
      color: const Color(0xFF7EDC8A),
    ),

    CategoryModel(
      title: "Salary",
      icon: Icons.account_balance_wallet_outlined,
      color: const Color(0xFF4CAF50),
    ),

    /// TRANSPORT
    CategoryModel(
      title: "Transport",
      icon: Icons.directions_car,
      color: const Color(0xFF7EC8FF),
    ),

    /// BILLS
    CategoryModel(
      title: "Bills",
      icon: Icons.receipt_long,
      color: const Color(0xFFFF8A65),
    ),

    /// HEALTH
    CategoryModel(
      title: "Health",
      icon: Icons.favorite_outline,
      color: const Color(0xFFFF6B81),
    ),

    /// EDUCATION
    CategoryModel(
      title: "Education",
      icon: Icons.menu_book_outlined,
      color: const Color(0xFF9B7BFF),
    ),

    /// ENTERTAINMENT
    CategoryModel(
      title: "Entertainment",
      icon: Icons.movie_outlined,
      color: const Color(0xFFFFB347),
    ),

    /// TRAVEL
    CategoryModel(
      title: "Travel",
      icon: Icons.flight_takeoff,
      color: const Color(0xFF5CD6C0),
    ),

    /// GROCERIES
    CategoryModel(
      title: "Groceries",
      icon: Icons.local_grocery_store_outlined,
      color: const Color(0xFF8BC34A),
    ),

    /// WORK
    CategoryModel(
      title: "Work",
      icon: Icons.work_outline,
      color: const Color(0xFF607D8B),
    ),

    /// GIFT
    CategoryModel(
      title: "Gift",
      icon: Icons.card_giftcard,
      color: const Color(0xFFE573B7),
    ),

    /// SUBSCRIPTION
    CategoryModel(
      title: "Subscription",
      icon: Icons.subscriptions_outlined,
      color: const Color(0xFF64B5F6),
    ),

    /// PETS
    CategoryModel(
      title: "Pets",
      icon: Icons.pets_outlined,
      color: const Color(0xFFA1887F),
    ),

    /// SAVINGS
    CategoryModel(
      title: "Savings",
      icon: Icons.savings_outlined,
      color: const Color(0xFF4DB6AC),
    ),

    /// OTHERS
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

  Color getCategoryColor(String categoryTitle) {
    return categories
        .firstWhere((category) => category.title == categoryTitle)
        .color;
  }
}
