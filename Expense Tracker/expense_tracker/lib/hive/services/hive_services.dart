import 'package:expense_tracker/hive/constants/hive_constants.dart';
import 'package:hive/hive.dart';

class HiveServices {
  ///Save Currency
  static Future<void> saveCurrency(String code) async {
    final box = await Hive.openBox(HiveConstants.settingBox);

    await box.put(HiveConstants.currencyCode, code);
  }

  ///Get Currency
  static Future<String?> getCurrency() async {
    ///opening box
    final box = await Hive.openBox(HiveConstants.settingBox);

    return box.get(HiveConstants.currencyCode);
  }

  /// SAVE BALANCE VISIBILITY
  static Future<void> saveBalanceVisibility(bool isHidden) async {
    final box = await Hive.openBox(HiveConstants.balanceVisibility);

    await box.put(HiveConstants.balanceVisibility, isHidden);
  }

  ///ET BALANCE VISIBILITY
  static Future<bool?> getBalanceVisibility() async {
    final box = await Hive.openBox(HiveConstants.balanceVisibility);

    return box.get(HiveConstants.balanceVisibility);
  }
}
