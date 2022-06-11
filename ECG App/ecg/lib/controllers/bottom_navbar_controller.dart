import 'package:flutter/material.dart';

class BottomNavBarNotifier extends ChangeNotifier {
  int index = 0;

  void updateIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
