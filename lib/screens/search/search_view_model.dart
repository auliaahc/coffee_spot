import 'package:coffee_spot/models/cafe_model.dart';
import 'package:coffee_spot/screens/home/home_view_model.dart';
import 'package:flutter/material.dart';

class SearchViewModel extends ChangeNotifier {
  final HomeViewModel homeViewModel;
  SearchViewModel(this.homeViewModel);

  TextEditingController searchInputController = TextEditingController();
  String searchInput = '';

  List<CafeModel> _searchResult = [];
  List<CafeModel> get searchResult => _searchResult;

  void onChangedSearchInput(String input) {
    searchInput = input;
    getSearchResult();
    notifyListeners();
  }

  void clearCurrentSearchInput() {
    searchInputController.clear();
    searchInput = '';
    _searchResult = [];
    notifyListeners();
  }

  void getSearchResult() {
    if (searchInput == '') {
      _searchResult.clear();
    } else {
      _searchResult = homeViewModel.allCafes
        .where((element) => element.name.toLowerCase().contains(searchInput.toLowerCase()))
        .toList();
    }
  }
}