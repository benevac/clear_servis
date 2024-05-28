import 'package:flutter/material.dart';

class SubscriptionProvider with ChangeNotifier {
  bool _isSubscribed = false;

  bool get isSubscribed => _isSubscribed;

  void subscribe() {
    _isSubscribed = true;
    notifyListeners();
  }

  void unsubscribe() {
    _isSubscribed = false;
    notifyListeners();
  }
}
