import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  set selectedIndex (int changedIndex) {
    _selectedIndex = changedIndex;
    notifyListeners();
  }

  void changeTabs (BuildContext context) {
    if (_selectedIndex == 0) {
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    } else if (selectedIndex == 1) {
      Navigator.of(context).pushNamedAndRemoveUntil('/coffeestant', (route) => false);
    }
    notifyListeners();
  }
}