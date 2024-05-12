import 'package:firebase_database/firebase_database.dart';
import 'package:coffee_spot/models/menu_model.dart';
import 'package:coffee_spot/models/review_model.dart';

class CafeModel {
  final String id;
  final String name;
  final String description;
  final String address;
  final String image;
  String? whatsappNumber;
  final String operationalHour;
  final int totalLikes;
  final bool isOpen;
  double ratingAverage;
  final List<MenuModel> menus;
  List<ReviewModel>? reviews;

  CafeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.image,
    this.whatsappNumber,
    required this.operationalHour,
    required this.totalLikes,
    required this.isOpen,
    required this.ratingAverage,
    required this.menus,
    this.reviews,
  });

  factory CafeModel.fromSnapshot(DataSnapshot snapshot) {
    Map<dynamic, dynamic> cafeData = snapshot.value as Map<dynamic, dynamic>;

    List<MenuModel> menusData = [];
    cafeData['menus'].forEach((key, value) {
      menusData.add(
        MenuModel(
          id: key,
          name: value['name'],
          image: value['image'],
          description: value['description'],
          price: value['price'],
          category: value['category'],
        ),
      );
    });

    List<ReviewModel>? reviewsData = [];
    if (cafeData['reviews'] != null) {
      cafeData['reviews'].forEach((key, value) {
        reviewsData.add(
          ReviewModel(
            id: key,
            name: value['name'],
            description: value['description'],
            date: value['date'],
            rating: value['rating'],
            isUpdated: value['isUpdated'],
          ),
        );
      });
    }

    return CafeModel(
      id: snapshot.key!,
      name: cafeData['name'],
      description: cafeData['description'],
      address: cafeData['address'],
      image: cafeData['image'],
      operationalHour: cafeData['operationalHour'],
      totalLikes: cafeData['totalLikes'],
      isOpen: cafeData['isOpen'],
      whatsappNumber: cafeData['whatsapppNumber'],
      ratingAverage: cafeData['ratingAverage'].toDouble(),
      menus: menusData,
      reviews: reviewsData,
    );
  }
}
