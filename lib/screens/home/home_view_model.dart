import 'package:coffee_spot/models/cafe_model.dart';
import 'package:coffee_spot/models/services/cafe_service.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final CafeService _cafeService = CafeService();

  List<CafeModel> _allCafes = [];
  List<CafeModel> get allCafes => _allCafes;
  final List<CafeModel> _cafesByStatus = [];
  List<CafeModel> get cafesByStatus => _cafesByStatus;
  List<CafeModel> _cafesByRating = [];
  List<CafeModel> get cafesByRating => _cafesByRating;
  List<CafeModel> _cafesByLikes = [];
  List<CafeModel> get cafesByLikes => _cafesByLikes;

  void fetchCafesDataByStatus() {
    for (var element in _allCafes) {
      if (element.isOpen == true) {
        _cafesByStatus.add(element);
      }
    }
  }

  void fetchCafesDataByRating() {
    _cafesByRating = _allCafes;
    _cafesByRating.sort((a, b) => a.ratingAverage.compareTo(b.ratingAverage));
  }

  void fetchCafesDataByTotalLikes() {
    _cafesByLikes = _allCafes;
    _cafesByLikes.sort((a, b) => a.totalLikes.compareTo(b.totalLikes));
  }

  void calculateRatingAverage() {
    for (var element in _allCafes) {
      if (element.reviews != null) {
        double ratingAvg = 0;
        double totalRating = 0;
        for (var element in element.reviews!) {
          totalRating += element.rating.toDouble();
        }
        ratingAvg = totalRating / (element.reviews!.length.toDouble());
        element.ratingAverage = ratingAvg;
      }
    }
  }

  void clearData() {
    _allCafes.clear();
    _cafesByLikes.clear();
    _cafesByRating.clear();
    _cafesByStatus.clear();
  }

  void fetchAllCafesData() {
    clearData();
    _cafeService.getAllCafesData().listen(
      (List<CafeModel> fetchedCafesData) {
        _allCafes = fetchedCafesData;
        calculateRatingAverage();
        fetchCafesDataByStatus();
        fetchCafesDataByTotalLikes();
        fetchCafesDataByRating();
        notifyListeners();
      },
      onError: (error) {
        throw Exception('Error Fetch Data All Cafes $error');
      },
    );
  }
}