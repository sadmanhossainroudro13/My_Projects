import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  bool notificationEnabled = true;

  void toggleNotification(bool value) {
    notificationEnabled = value;
    notifyListeners();
  }
}
