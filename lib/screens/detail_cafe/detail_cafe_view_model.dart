import 'package:coffee_spot/models/cafe_model.dart';
import 'package:flutter/material.dart';

class DetailCafeViewModel extends ChangeNotifier {
  CafeModel? _selectedCafe;
  CafeModel? get selectedCafe => _selectedCafe;
  set selectedCafe(CafeModel? cafe) {
    _selectedCafe = cafe;
    notifyListeners();
  }
}