import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex (int changedIndex) {
    _selectedIndex = changedIndex;
    notifyListeners();
  }
}